import 'package:flutter/material.dart';
import 'package:flutter_app/Dashboard.dart';

class Profile extends StatelessWidget {
  String userName;

  Profile(String loginName) {
    userName = loginName;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                new MaterialPageRoute(
                    builder: (context) => new Dashboard(userName)),
              );
            }),
        title: Text('Profile'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: new AssetImage('assets/images/logo.jpg'),
              minRadius: 30,
              maxRadius: 60,
            ),
          ),
          Center(
            child: Text(
              userName,
              style: TextStyle(
//                    backgroundColor: Colors.blue.withOpacity(0.6),
                  fontSize: 30,
                  fontStyle: FontStyle.normal,
                  color: Colors.blue)
              ,
            ),
          )
        ],
      ),
    );
  }
}
