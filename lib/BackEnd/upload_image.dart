
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:untitled6/Consts/urls.dart';
import '../Locale_Memory/save_user_info_locally.dart';

Future  uploadImage(File imageFile) async {
  String token = await getAccessTokenFromPref();
  String email = await getEmailFromPref();
  var stream  = http.ByteStream(imageFile.openRead());
  stream.cast();
  var length = await imageFile.length();
  var uri = Uri.parse(kUploadUserImageUrl);

  var request = http.MultipartRequest("POST", uri);

  var multipartFile = http.MultipartFile(
      "image", stream, length, filename: basename(imageFile.path));

  request.files.add(multipartFile);
  request.fields['a_token'] = token;
  request.fields['email'] = email;

  var respond = await request.send();
  final respStr = await respond.stream.bytesToString();
  // if (respond.statusCode == 200) {
  //   print("Image Uploaded");
  // } else {
  //   print("Upload Failed");
  // }
}
//[{"id":"1","path":"https:\/\/smart-marketing.tech\/clive\/api\/v1\/upload_img\/1.jpg","msg":"success"}]