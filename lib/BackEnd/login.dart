import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:untitled6/Consts/urls.dart';

import '../Locale_Memory/save_user_info_locally.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


Future login(String nike,String email,String accessToken,String idToken,String lang) async{
  final uri = Uri.parse(kLoginUrl);
  var notificationToken;
  await FirebaseMessaging.instance.getToken().then((tok) =>notificationToken=tok );
  var response = await http.post(
    uri,
    body: jsonEncode(<String, dynamic>{
      'nike': nike,
      'email': email,
      'a_token': accessToken,
      'id_token': idToken,
      "rtoken": notificationToken,
      "lang":lang
    }),
  );

  var p = json.decode(response.body);
  if('${p[0]['msg']}' =='success'){
    await saveUserInfoLocally(idToken,accessToken,email,nike);
  }
   return p[0]['msg'];
}
// {"email":"jhghg@gmail.com","a_token":"h10","id_token":"1"}
// ret:
// error
// success
//[{msg: success}]