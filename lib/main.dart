import 'package:flutter/material.dart';
import 'package:flutter_app/splashscreen.dart';

import 'MyCustomForm.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: new SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/HomeScreen': (BuildContext context) => new MyCustomForm()
      },
    );
  }
}



