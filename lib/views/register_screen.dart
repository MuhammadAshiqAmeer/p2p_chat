import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:p2p_chat/services/authHandler.dart';
import 'package:p2p_chat/widgets/appBar.dart';

class RegisterUser extends StatefulWidget {
  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  String phoneNo;
  String verificationId,smsCode;
  bool codeSent=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 100,
            ),
            Image(
              image: AssetImage('assets/images/log.png'),
              height: 70,
            ),
            SizedBox(
              height: 80,
            ),
             TextField(
              style: textFieldStyle(),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(hintText:"Register Mobile No...",hintStyle: TextStyle(color: Colors.white54),prefixText: '+91'),
              onChanged: (val) {
                setState(() {
                  this.phoneNo = '+91'+val;
                });
              },
            ),
            codeSent ? TextField(
              style: textFieldStyle(),
              keyboardType: TextInputType.phone,
              decoration: textFieldInputDecoration("Enter OTP"),
              onChanged: (val) {
                setState(() {
                  this.smsCode = val;
                });
              },
            ):Container(),
            SizedBox(
              height: 100,
            ),
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      const Color(0xff145C9E),
                      const Color(0xff007EF4)
                    ]),
                    borderRadius: BorderRadius.circular(30)),
                child: codeSent ? Text('Verify',
                    style: TextStyle(color: Colors.white, fontSize: 17)):Text ('Register',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              onTap: (){
                codeSent ? authHandler().signInWithOTP(smsCode, verificationId):verifyPhoneNo(phoneNo);
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Direct Connection",
              style: TextStyle(
                  color: Colors.white, decoration: TextDecoration.underline),
            )
          ],
        ),
      ),
    );
  }

  Future<void> verifyPhoneNo(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      authHandler().signIn(authResult);
    };
    final PhoneVerificationFailed notVerified =
        (FirebaseAuthException authException) {
      print('${authException.message}');
    };
    final PhoneCodeSent codeSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent=true;
      });
    };
    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: verified,
        verificationFailed: notVerified,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}
