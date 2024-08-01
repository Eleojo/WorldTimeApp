import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  String? time; // the time in that location (nullable)
  String flagUrl; // url to an asset flag icon
  String apiUrl; // api endpoint URL for the location
  bool isDayTime = false;// is day time or not

  WorldTime({
    required this.location,
    required this.flagUrl,
    required this.apiUrl,
  });

  Future<void> getTime() async {
    try {
      // Make the request
      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$apiUrl'));

      // Check if the response is successful
      if (response.statusCode == 200) {
        // Decode the JSON response
        Map<String, dynamic> data = jsonDecode(response.body);

        // Print the data for debugging
        //print(data);

        // Get properties from the data
        String dateTime = data['datetime'];
        String offset = data['utc_offset'].substring(1, 3);

        // Create DateTime object and add the offset
        DateTime now = DateTime.parse(dateTime);
        now = now.add(Duration(hours: int.parse(offset)));

        // Set the time property
        isDayTime = now.hour > 6 && now.hour < 19? true: false;
        time = DateFormat.jm().format(now);

      } else {
        throw Exception('Failed to load time data');
      }
    } catch (e) {
      print('Caught error: $e');
      time = 'Could not get time data';
    }
  }
}
