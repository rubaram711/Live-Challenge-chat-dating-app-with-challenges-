import '../Consts/urls.dart';
import '../Locale_Memory/save_user_info_locally.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future sendRequest(int idRec,int points,int adult,int type) async {
  print('int $idRec,int $points,int $adult,int $type');
  String email=await getEmailFromPref();
  String accessToken= await getAccessTokenFromPref();
  final uri = Uri.parse(kSendRequestUrl);
  var response = await http.post(
    uri,
    body:jsonEncode(<String, dynamic>{
      'a_token': accessToken,
      'email':email,
      "id_rec":idRec,
      "pnts":points,
      "type":type,//0 (voice) or 1 (video) ,
      "adult": adult,
      "update":0
    }),
  );

  var p = json.decode(response.body);
  // if(p[0]['msg']=='success'){
    return p[0]['msg'];
  // }
}