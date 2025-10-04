import '../Consts/urls.dart';
import '../Locale_Memory/save_user_info_locally.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future getNotifications(int page) async {
  String email=await getEmailFromPref();
  String accessToken= await getAccessTokenFromPref();
  final uri = Uri.parse(kGetNotificationsUrl);
  var response = await http.post(
    uri,
    body:jsonEncode(<String, dynamic>{
      'a_token': accessToken,
      'email':email,
      "page":page
    }),
  );

  var p = json.decode(response.body);
  if(p[0]['msg']=='success'){
    return p;
  }
  return [];
}