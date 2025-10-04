import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Consts/urls.dart';
import '../Locale_Memory/save_user_info_locally.dart';

Future getUsers(String search, int page, int adult) async {
  String token = await getAccessTokenFromPref();
  String email = await getEmailFromPref();
  final uri = Uri.parse(kGetUsersUrl);
  var response = await http.post(
    uri,
    body: jsonEncode(<String, dynamic>{
      'a_token': token,
      'email': email,
      'page': page,
      'search': search,
      'adult': adult
    }),
  );

  var p = json.decode(response.body);
  if (p[0]['msg'] == 'error' || p[0]['msg'] =='empty') {
    return [];
  } else {
    return p;
  }
}

// [[], {msg: empty}]

//list of users
// {"a_token":"","email":"","page":1,"adult":0 or 1 or 2} 0 mean not adult - 1 mean only adult - 2 mean all
// https://smart-marketing.tech/clive/api/v1/listofusers/
// ret array of :
// 	  "id" => $id ,
// 	  "nike" => $nike,
// 	  "bio" => $bio,
// 	  "country" => $country,
// 	  "mobile" => $mobile,
// 	  "img" => "https://smart-marketing.tech/clive/api/v1/upload_img/uploads/hghg.jpg",
// 	  "adult" => $adult,
// 	  "accept" => $accept,
// 	  "msg" => "success"

//[{id: 6, nike: ahmad naser, bio: play oud, country: Syria (SY), mobile: +963 978833355,
// img: https://smart-marketing.tech/clive/api/v1/upload_img/uploads/6.jpg, adult: 1, accept: 1, msg: success},
// {id: 7, nike: Suzan ahmad, bio: Artist, country: Syria (SY), mobile: +96399992222,
// img: https://smart-marketing.tech/clive/api/v1/upload_img/uploads/7.jpg, adult: 1, accept: 1, msg: success}]
