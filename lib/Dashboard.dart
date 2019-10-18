import 'package:flutter/material.dart';

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
    // TODO: implement build
    return DefaultTabController(
        length: 3,
        child: new Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
        bottom: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_bike)),
          ],
        ),
      ),
      body:
         /* code to add list [listview/recyclerview]
          ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  color: Colors.blue[colorCodes[index]],
                  child: Center(child: Text('${entries[index]}')),
                );
              }),*/
      TabBarView(
        children: [
          Icon(Icons.directions_car),
          Icon(Icons.directions_transit),
          Icon(Icons.directions_bike),
        ],
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
