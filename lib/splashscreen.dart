import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SplashScreen'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Image(
              image: new AssetImage('assets/images/flutter.jpg'),
              width: 300.0,
              height: 300.0),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'FLUTTER APP',
                style: TextStyle(
//                    backgroundColor: Colors.blue.withOpacity(0.6),
                    fontSize: 30,
                    fontStyle: FontStyle.normal,
                    color: Colors.blue),
              )),
        ],
      )),
    );
  }
}
