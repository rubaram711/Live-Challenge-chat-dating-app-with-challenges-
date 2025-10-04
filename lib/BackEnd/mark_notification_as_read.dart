import '../Consts/urls.dart';
import '../Locale_Memory/save_user_info_locally.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future markNotificationAsRead(String notiId) async {
  String email=await getEmailFromPref();
  String accessToken= await getAccessTokenFromPref();
  final uri = Uri.parse(kSendAsReadNotificationUrl);
  var response = await http.post(
    uri,
    body:jsonEncode(<String, dynamic>{
      'a_token': accessToken,
      'email':email,
      "id":notiId
    }),
  );

  var p = json.decode(response.body);
  print(p);
  // if(p[0]['msg']=='success'){
    return p[0]['msg'];
  // }
  // return [];
}
//{"msg":"success"}