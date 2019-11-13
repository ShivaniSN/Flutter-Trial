import 'package:flutter/material.dart';
import 'package:flutter_app/Dashboard.dart';
import 'package:flutter_app/EditTextWidget.dart';

class Profile extends StatelessWidget {
  String userName;
  var iconList = [Icons.person, Icons.mobile_screen_share];

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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 10.0,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundImage: new AssetImage('assets/images/talin.jpg'),
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
                      color: Colors.blue),
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Name : ',
                        style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            color: Colors.black54),
                      )),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Talin Stalingard',
                        style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ))
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Role : ',
                        style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            color: Colors.black54),
                      )),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Android Devceloper',
                        style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ))
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Mobile : ',
                        style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            color: Colors.black54),
                      )),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        '9999999999',
                        style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ))
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'City : ',
                        style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            color: Colors.black54),
                      )),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Pune',
                        style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ))
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 90.0,right: 20.0),
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      _onButtonPressed(context);
                    },
                    icon: Icon(Icons.edit),
                    label: Text("Edit"),
                    elevation: 10.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onButtonPressed(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            height: 300,
            child: Container(
              child: _buildBottomNavigationMenu(),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10),
                ),
              ),
            ),
          );
        });
  }

  Column _buildBottomNavigationMenu() {
    return Column(
      children: <Widget>[
        EditTextWidget('Enter Name', 'What is your name ?', iconList[0],
            _validateUserInputUserName),
        EditTextWidget('Enter Mobile', 'What is your mobile number ?',
            iconList[1], _validateUserInputPassword),
        Padding(
          padding: EdgeInsetsDirectional.only(top: 40.0),
          child: Builder(
            builder: (context) => RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                /*if (_formKey.currentState.validate()) {
                  // _formKey.currentState.save();
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Data')));
                  Navigator.pushReplacement(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new Dashboard(loginName)),
                  );
                }*/
              },
              child: Text(
                'EDIT',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
        )
      ],
    );
  }

  String _validateUserInputUserName(String value) {
    if (value.isNotEmpty) {
      userName = value;
//      return loginName;
    }
    if (value.isEmpty) {
      return 'Username Missing';
    } else {
      return null;
    }
  }

  String _validateUserInputPassword(String value) {
    if (value.isEmpty) {
      return 'Mobile Missing';
    } else if (value.length != 10) {
      return 'Mobile should be of 10 digits';
    } else {
      return null;
    }
  }
}
