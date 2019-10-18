import 'package:flutter/material.dart';
import 'package:flutter_app/ChangePassword.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'Profile.dart';

class Dashboard extends StatelessWidget {
  String userName;
  final appTitle = 'First Flutter App';
  final List<String> entries = <String>['Profile', 'Change Password', 'Logout'];
  final List<int> colorCodes = <int>[100, 300, 500];

  Dashboard(String loginName) {
    userName = loginName;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: new Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
          body: CarouselSlider( // TODO : carousel from https://pub.dev/packages/carousel_slider
            height: 400.0,
            items: [1,2,3,4,5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          color: Colors.amber
                      ),
                      child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                  );
                },
              );
            }).toList(),
          ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                userName,
                style: TextStyle(
//                    backgroundColor: Colors.blue.withOpacity(0.6),
                    fontSize: 30,
                    fontStyle: FontStyle.normal,
                    color: Colors.white),
              ),
              decoration: BoxDecoration(
                /*If you want to add image as background of drawer header add below mentioned code
                color: Colors.blue,
                image: DecorationImage(
                    image: AssetImage('assets/images/flutter.jpg'), fit: BoxFit.fill,),
                 */
                // To add gradient to drawer header
                gradient: LinearGradient(
                  // Where the linear gradient begins and ends
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.1, 0.5, 0.7, 0.9],
                  colors: [
                    // Colors are easy thanks to Flutter's Colors class.
                    Colors.blue[800],
                    Colors.blue[700],
                    Colors.blue[600],
                    Colors.blue[400],
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Profile',
                style: TextStyle(
//                    backgroundColor: Colors.blue.withOpacity(0.6),
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    color: Colors.blue),
              ),
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue,
              ),
              onTap: (){
                Navigator.pushReplacement(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new Profile(userName)),
                );
              },
            ),
            ListTile(
              title: Text(
                'Change Password',
                style: TextStyle(
//                    backgroundColor: Colors.blue.withOpacity(0.6),
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    color: Colors.blue),
              ),
              leading: Icon(
                Icons.lock_outline,
                color: Colors.blue,
              ),
              onTap: (){
                Navigator.pushReplacement(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new ChangePassword(userName)),
                );
              },
            ),
            ListTile(
              title: Text(
                'Logout',
                style: TextStyle(
//                    backgroundColor: Colors.blue.withOpacity(0.6),
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    color: Colors.blue),
              ),
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    )
    );
  }
}
