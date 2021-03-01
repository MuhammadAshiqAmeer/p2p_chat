import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p2p_chat/widgets/appBar.dart';

class listUser extends StatefulWidget {
  @override
  _listUserState createState() => _listUserState();
}

class _listUserState extends State<listUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: new Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'list user',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
