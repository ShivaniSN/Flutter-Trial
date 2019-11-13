import 'package:flutter/material.dart';

class EditTextWidget extends StatelessWidget {
  final String labelText,hintText;
   final icon;
  final Function(String) validator;

  EditTextWidget(this.labelText,this.hintText,this.icon,this.validator);

  _changeKeyboardType(entry) {
    if (hintText.contains("password")) {
      return TextInputType.number;
    }
    return TextInputType.text;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 20.0, end: 20.0,top: 30.0),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            icon: Icon(
              icon,
              color: Colors.blue,
            ),
          ),
          keyboardType: _changeKeyboardType(hintText),
          validator: (String value) {
            return validator(value);
          },
        ),
      ),
    );
  }
}
