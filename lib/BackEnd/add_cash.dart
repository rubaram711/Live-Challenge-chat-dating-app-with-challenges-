import 'package:http/http.dart' as http;
import 'package:untitled6/Consts/urls.dart';
import 'dart:convert';

import '../Locale_Memory/save_user_info_locally.dart';



Future addCash() async {
  String email=await getEmailFromPref();
  String accessToken= await getAccessTokenFromPref();
  final uri = Uri.parse(kAddCashUrl);
  var response = await http.post(
    uri,
    body:jsonEncode(<String, dynamic>{
      'a_token': accessToken,
      'email':email,
      "ad":"0"
    }),
  );

  var p = json.decode(response.body);
  return p[0]['msg'];
}
