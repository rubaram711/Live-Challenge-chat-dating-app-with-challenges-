import 'package:shared_preferences/shared_preferences.dart';

saveDialogStatusLocally(int dialogOpen) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('dialogOpen', dialogOpen);
}

Future<int> getDialogStatusFromPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int dialogOpen = prefs.getInt('dialogOpen') ?? 0;
  return dialogOpen;
}
