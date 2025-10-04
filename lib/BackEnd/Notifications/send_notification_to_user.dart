

import 'package:firebase_messaging/firebase_messaging.dart';

getUserToken() async{
  await FirebaseMessaging.instance.getToken().then((token) => print(token));
}

sendNotificationToUser() async{

}