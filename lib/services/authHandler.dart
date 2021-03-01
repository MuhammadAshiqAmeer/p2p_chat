import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:p2p_chat/views/register_screen.dart';
import 'package:p2p_chat/views/userlist_screen.dart';

class authHandler{

  handleAuth(){
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context,snapshot){
        if(snapshot.hasData){
          return listUser();
        }
        else{
          return RegisterUser();
        }
      },
    );
  }

  signOut(){
    FirebaseAuth.instance.signOut();
  }

  signIn(AuthCredential authCredential){
    FirebaseAuth.instance.signInWithCredential(authCredential);

  }

  signInWithOTP(smsCode,verId){
    AuthCredential authCredential=PhoneAuthProvider.credential(verificationId:verId, smsCode: smsCode);
    signIn(authCredential);
  }
}