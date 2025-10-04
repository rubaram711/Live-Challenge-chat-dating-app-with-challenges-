import '../Consts/urls.dart';
import '../Locale_Memory/save_user_info_locally.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future getMyPoints() async {
  String email=await getEmailFromPref();
  String accessToken= await getAccessTokenFromPref();
  final uri = Uri.parse(kGetMyPointsUrl);
  var response = await http.post(
    uri,
    body:jsonEncode(<String, dynamic>{
      'a_token': accessToken,
      'email':email,
      "ad":0
    }),
  );

  var p = json.decode(response.body);
  if(p[0]['msg']=='success'){
    return p[0]['Balance'];
  }
  return '-1';
}