//get my data
// https://smart-marketing.tech/clive/api/v1/getMy/
// {"email":"jghj@gmail.com","a_token":"kuggjgj"}
// ret:
// 	  "id" => $id ,
// 	  "nike" => $nike,
// 	  "bio" => $bio,
// 	  "country" => $country,
// 	  "mobile" => $mobile,
// 	  "img" => "https://smart-marketing.tech/clive/api/v1/upload_img/uploads/hghg.jpg",
// 	  "adult" => $adult,
// 	  "accept" => $accept,
// 	  "msg" => "success"

import 'package:http/http.dart' as http;
import 'package:untitled6/Consts/urls.dart';
import 'package:untitled6/Widgets/reusable_alert.dart';
import 'dart:convert';

import '../Locale_Memory/save_user_info_locally.dart';



Future getMyData() async {
  String email=await getEmailFromPref();
  String accessToken= await getAccessTokenFromPref();
  final uri = Uri.parse(kGetMyDataUrl);
  var response = await http.post(
    uri,
    body:jsonEncode(<String, dynamic>{
      'a_token': accessToken,
      'email':email
    }),
  );

  var p = json.decode(response.body);
  if(p[0]['msg']=='error'){
    return {};
  }
  return p[0];
}

// [{id: 3, nike: Ruba Ramadan, bio: null, country: null, mobile: null,
// img: https://smart-marketing.tech/clive/api/v1/upload_img/uploads/,
// adult: null, accept: null, msg: success}]