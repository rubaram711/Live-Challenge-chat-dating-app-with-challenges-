import 'package:shared_preferences/shared_preferences.dart';

saveUserInfoLocally(String idToken, String accessToken, String email,String nike) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('idToken', idToken);
  prefs.setString('accessToken', accessToken);
  prefs.setString('email', email);
  prefs.setString('nike', nike);
}

Future<Map> getUserInfoFromPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String idToken = prefs.getString('idToken') ?? '';
  String accessToken = prefs.getString('accessToken') ?? '';
  String email = prefs.getString('email') ?? '';
  String nike = prefs.getString('nike') ?? '';
  return {
    'idToken': idToken,
    'accessToken': accessToken,
    'email': email,
    'nike': nike
  };
}

Future<String> getIdTokenFromPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String idToken = prefs.getString('idToken') ?? '';
  return idToken;
}

Future<String> getAccessTokenFromPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String accessToken = prefs.getString('accessToken') ?? '';
  return accessToken;
}

Future<String> getEmailFromPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String email = prefs.getString('email') ?? '';
  return email;
}

Future<String> getNikeNameFromPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String nike = prefs.getString('nike') ?? '';
  return nike;
}


saveUserIdLocally(String id) async{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  prefs.setString('id', id);
}

Future<String> getIdFromPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String id = prefs.getString('id') ?? '';
  return id;
}