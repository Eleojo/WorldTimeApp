import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_app/services/world_time.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  //String time = 'Loading';

  void setWorldTime() async{
    WorldTime countryTime = WorldTime(location: 'Nigeria', flagUrl: 'Nigeria.png', apiUrl: 'Africa/Lagos');
    await countryTime.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': countryTime.location,
      'time': countryTime.time,
      'flagUrl': countryTime.flagUrl,
      //'apiUrl':countryTime.apiUrl,
      'isDayTime': countryTime.isDayTime,
    });
  //   setState(() {
  //     time = countryTime.time.toString(); // convert time to type string
  //   });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Run function(like getting an API) in the init state
    setWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}