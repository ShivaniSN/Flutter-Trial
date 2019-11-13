import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Category.dart';
import 'package:flutter_app/ChangePassword.dart';
import 'package:flutter_app/Login.dart';

import 'Profile.dart';

class Dashboard extends StatelessWidget {
  final String userName;
  final appTitle = 'First Flutter App';
  final List<String> entries = <String>['Profile','Route', 'Change Password', 'Logout'];
  final List<int> colorCodes = <int>[100, 300, 500];

  Dashboard(this.userName);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: new Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
          body:
          SizedBox(// TODO : carousel from https://pub.dev/packages/carousel_slider  OR https://pub.dev/packages/carousel_pro
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
              child: Carousel(
                images: [
                  ExactAssetImage('assets/images/light.jpg'),
                  ExactAssetImage('assets/images/talin.jpg'),
                  ExactAssetImage('assets/images/balloon.jpeg'),
                  ExactAssetImage('assets/images/beach.jpeg')
                ],
              )),
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
                'Route',
                style: TextStyle(
//                    backgroundColor: Colors.blue.withOpacity(0.6),
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    color: Colors.blue),
              ),
              leading: Icon(
                Icons.card_travel,
                color: Colors.blue,
              ),
              onTap: (){
                Navigator.pushReplacement(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new Category(userName)),
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
              onTap: (){
                Navigator.pushReplacement(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new Login()),
                );
              }
                  //to exit the app => => => => => => SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop'),
            )
          ],
        ),
      ),
    )
    );
  }
}
