import 'package:flutter/material.dart';
import 'package:flutter_app/Dashboard.dart';

import 'EditTextWidget.dart';

class ChangePassword extends StatefulWidget{
  final String userName;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChangePasswordState();
  }

  ChangePassword(this.userName);
}

class _ChangePasswordState extends State<ChangePassword>{
  final _appTitle = 'Change Password';
  final _formKey = GlobalKey<FormState>();
  var iconList = [Icons.lock,Icons.lock,Icons.lock];

  String _validateUserInputPassword(String value) {
    if (value.isEmpty) {
      return 'Password Missing';
    } else if (value.length < 4) {
      return 'Password should be greater than 4 digits';
    }else{
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(_appTitle),
          leading: new IconButton(
              icon: new Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new Dashboard('')),
                );
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
                    EditTextWidget('Old Password','What is your old password ?',iconList[0],_validateUserInputPassword),
                    EditTextWidget('New Password','What is your new password ?',iconList[1],_validateUserInputPassword),
                    EditTextWidget('Confirm Password','What is your confirm password ?',iconList[2],_validateUserInputPassword),
                    Padding(
                      padding: EdgeInsetsDirectional.only(top: 50.0),
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
                              Navigator.pushReplacement(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new Dashboard('')),
                              );
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