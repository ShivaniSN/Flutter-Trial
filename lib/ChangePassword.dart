import 'package:flutter/material.dart';
import 'package:flutter_app/Dashboard.dart';

class ChangePassword extends StatefulWidget{
  String userName;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChangePasswordState();
  }

  ChangePassword(String loginName) {
    userName = loginName;
  }
}

class ChangePasswordState extends State<ChangePassword>{
  final appTitle = 'Change Password';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
          leading: new IconButton(
              icon: new Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
//                Navigator.pushReplacement(
//                  context,
//                  new MaterialPageRoute(
//                      builder: (context) => new Dashboard(ChangePassword.userName)),
//                );
              }),
        ),
        body: Form(
            key: _formKey,
            child: new SingleChildScrollView(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image(
                        image: new AssetImage('assets/images/flutter.jpg'),
                        width: 200.0,
                        height: 200.0),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 20.0, end: 20.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Old Password',
                          hintText: 'What is your old password ?',
                          icon: Icon(
                            Icons.person,
                            color: Colors.blue,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (String value) {
                          if(value.isNotEmpty){
//                            loginName = value;
                          }
                          return value.isEmpty ? 'Old Password Missing' : null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 20.0, end: 20.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'New Password',
                          hintText: 'What is your new password ?',
                          icon: Icon(
                            Icons.lock,
                            color: Colors.blue,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (String value) {
                          if(value.isEmpty){
                            return 'Password Missing';
                          }else if(value.length < 4){
                            return 'Password should be greater than 4 digits';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 20.0, end: 20.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          hintText: 'What is your confirm password ?',
                          icon: Icon(
                            Icons.lock,
                            color: Colors.blue,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (String value) {
                          if(value.isEmpty){
                            return 'Password Missing';
                          }else if(value.length < 4){
                            return 'Password should be greater than 4 digits';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(top: 20.0),
                      child: Builder(
                        builder: (context) => RaisedButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              // _formKey.currentState.save();
                              Scaffold
                                  .of(context)
                                  .showSnackBar(SnackBar(content: Text('Processing Data')));
//                              Navigator.pushReplacement(
//                                context,
//                                new MaterialPageRoute(
//                                    builder: (context) => new Dashboard(loginName)),
//                              );
                            }
                          },
                          child: Text(
                            'CHANGE',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                    )
                  ],
                )))
    );
  }
}