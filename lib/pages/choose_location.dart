import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'Nigeria', flagUrl: 'https://flagcdn.com/w320/ng.jpg', apiUrl: 'Africa/Lagos'),
    WorldTime(location: 'New York', flagUrl: 'https://flagcdn.com/w320/us.jpg', apiUrl: 'America/New_York'),
    WorldTime(location: 'London', flagUrl: 'https://flagcdn.com/w320/gb.jpg', apiUrl: 'Europe/London'),
    WorldTime(location: 'Tokyo', flagUrl: 'https://flagcdn.com/w320/jp.jpg', apiUrl: 'Asia/Tokyo'),
    WorldTime(location: 'Sydney', flagUrl: 'https://flagcdn.com/w320/au.jpg', apiUrl: 'Australia/Sydney'),
    WorldTime(location: 'Rio de Janeiro', flagUrl: 'https://flagcdn.com/w320/br.jpg', apiUrl: 'America/Sao_Paulo'),
    WorldTime(location: 'Cairo', flagUrl: 'https://flagcdn.com/w320/eg.jpg', apiUrl: 'Africa/Cairo'),
    WorldTime(location: 'Moscow', flagUrl: 'https://flagcdn.com/w320/ru.jpg', apiUrl: 'Europe/Moscow'),
    WorldTime(location: 'New Delhi', flagUrl: 'https://flagcdn.com/w320/in.jpg', apiUrl: 'Asia/Kolkata'),
  ];

  void updateTime(index) async{
    var clikedWorldTime = locations[index];
    await clikedWorldTime.getTime();
    //Navigate to home with data
    Navigator.pop(context,{
    'location': clikedWorldTime.location,
    'time': clikedWorldTime.time,
    'flagUrl': clikedWorldTime.flagUrl,
    'isDayTime': clikedWorldTime.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),



      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(locations[index].flagUrl),
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
