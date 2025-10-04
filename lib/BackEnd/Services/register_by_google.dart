// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../Screens/Auth/login.dart';
import '../../Widgets/reusable_alert.dart';
import '../../l10n/app_localizations.dart';
import '../login.dart';

class AuthService{
  signInWithGoogle(String lang,BuildContext context) async{
    showDialog(
      context: context,
      builder: (context) {
        return const Dialog(
          backgroundColor: Colors.transparent,
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
    final GoogleSignInAccount? gUser=await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth =await gUser!.authentication;

    final credential =GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    final user=(await FirebaseAuth.instance.signInWithCredential(credential)).user;
    if(user!=null){
      // alert(context, AppLocalizations.of(context)!.wait);
      isWaitingStatus=true;
    var result= await login('${user.displayName}','${user.email}','${gAuth.accessToken}','${gAuth.idToken}',lang);
    return result;
    }else{
      return 'error';
    }
  }


}
//[{msg: success}]