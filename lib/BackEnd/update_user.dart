//{"a_token":"88g","email":"jhghg@gmail.com","bio":"h10","country":"sy","nike":"hasan",
// "mobile":"009767654333","accept":1,"adult":1}
// ret:
// error
// success and id

import 'package:http/http.dart' as http;
import 'package:untitled6/Locale_Memory/save_user_info_locally.dart';
import 'dart:convert';
import '../Consts/urls.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future updateUserInfo(String username, String country, String mobile,
    String bio, int accept, int adult, String lang) async {
  final uri = Uri.parse(kUpdateUserUrl);
  String token = await getAccessTokenFromPref();
  String email = await getEmailFromPref();
  var notificationToken;
  await FirebaseMessaging.instance.getToken().then((tok) =>notificationToken=tok );
  var response = await http.post(
    uri,
    body: jsonEncode(<String, dynamic>{
      "a_token": token,
      "email": email,
      "bio": bio,
      "country": country,
      "nike": username,
      "mobile": mobile,
      "accept": accept,
      "adult": adult,
      "rtoken": notificationToken,
      "lang":lang
    }),
  );
  var p = json.decode(response.body);
  return p[0];
}

// Future uploadUserImageInfo(String username, String country, String mobile,
//     String bio, int accept, int adult) async {
//   final uri = Uri.parse(kUploadUserImageUrl);
//   String token = await getAccessTokenFromPref();
//   String email = await getEmailFromPref();
//   var response = await http.post(
//     uri,
//     body: jsonEncode(<String, dynamic>{
//       "a_token": token,
//       "email": email,
//       "image":
//     }),
//   );
//   print(token);
//   var p = json.decode(response.body);
//   print('55555555555555555555555555555555 $p');
//   return p[0];
// }
//
