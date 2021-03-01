import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(
    title: Image.asset(
      "assets/images/log.png",
      height: 40,
    ),
    elevation: 0.0,
    centerTitle: false,
  );
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText, hintStyle: TextStyle(color: Colors.white54));
}

TextStyle textFieldStyle() {
  return TextStyle(
    color: Colors.white,
  );
}
