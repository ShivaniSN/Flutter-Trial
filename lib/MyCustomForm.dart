import 'package:flutter/material.dart';

import 'splashscreen.dart';

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final appTitle = 'First Flutter App';
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return new Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Form(
          autovalidate: _autoValidate,
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
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 20.0, end: 20.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter Username',
                        hintText: 'What is your login username ?',
                        icon: Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                      ),
                      controller: _controllerUsername,
                      keyboardType: TextInputType.text,
                      validator: (String value) {
                        return value.contains('') ? 'Username Missing' : '';
                      },
                      onFieldSubmitted: (String value) {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new SplashScreen()),
                          );
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 20.0, end: 20.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter Password',
                        hintText: 'What is your login password ?',
                        icon: Icon(
                          Icons.lock,
                          color: Colors.blue,
                        ),
                      ),
                      controller: _controllerPassword,
                      keyboardType: TextInputType.number,
                      validator: (String value) {
                        return value.contains('') ? 'Password Missing' : '';
                      },
                      onFieldSubmitted: (String value) {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new SplashScreen()),
                          );
                        }
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
                          LinearProgressIndicator(
                            value: 2000,
                          );
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new SplashScreen()),
                            );
                          } else {
                            _autoValidate = true;
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
              )))
    );
  }
}
