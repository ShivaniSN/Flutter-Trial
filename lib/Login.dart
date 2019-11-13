import 'package:flutter/material.dart';
import 'package:flutter_app/Dashboard.dart';
import 'package:flutter_app/EditTextWidget.dart';
import 'package:flurry_analytics/flurry_analytics.dart';

// Create a Form widget.
class Login extends StatefulWidget {
  @override
  _LoginState createState() {
    return _LoginState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class _LoginState extends State<Login> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<LoginState>.
  final appTitle = 'First Flutter App';
  final _formKey = GlobalKey<FormState>();
  String loginName;
  var iconList = [Icons.person,Icons.lock];

  String _validateUserInputUserName(String value) {
    if (value.isNotEmpty) {
      loginName = value;
//      return loginName;
    }
    if (value.isEmpty) {
      return 'Username Missing';
    }else{
      return null;
    }
  }

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
    // Build a Form widget using the _formKey created above.
    return new Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
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
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'FLUTTER APP',
                      style: TextStyle(
                          //backgroundColor: Colors.blue.withOpacity(0.6),
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    )),
                EditTextWidget('Enter Username','What is your login username ?',iconList[0],_validateUserInputUserName),
                EditTextWidget('Enter Password','What is your login password ?',iconList[1],_validateUserInputPassword),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 80.0),
                  child: Builder(
                    builder: (context) => RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          // _formKey.currentState.save();
                          FlurryAnalytics.logEvent("logged in by : "+ loginName);
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data')));
                          Navigator.pushReplacement(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new Dashboard(loginName)),
                          );
                        }
                      },
                      child: Text(
                        'LOGIN',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                )
              ],
            ))));
  }
}
