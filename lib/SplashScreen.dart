import 'dart:async';
import 'package:api_flutter/Api/GolfFetch.dart';
import 'package:api_flutter/Api/JobFetch.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2),()=>{
      Navigator.push(context, MaterialPageRoute(builder: (context)=> GolfFetch()))
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Image.asset(
            'images/job.png',
            width: 200,
          )),
    );
  }
}
