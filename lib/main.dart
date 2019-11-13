import 'package:flurry_analytics/flurry_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/splashscreen.dart';

import 'Login.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  _flurryAnalyticsCall() async => await FlurryAnalytics.initialize(androidKey: "37ZBKNJ3HX4QZ7XPZK39", iosKey: "37ZBKNJ3HX4QZ7XPZK39", enableLog: true);

  @override
  Widget build(BuildContext context) {
    _flurryAnalyticsCall();
    return MaterialApp(
      home: new Login(),
     /* routes: <String, WidgetBuilder>{
        '/HomeScreen': (BuildContext context) => new Login()
      },*/
    );
  }
}



