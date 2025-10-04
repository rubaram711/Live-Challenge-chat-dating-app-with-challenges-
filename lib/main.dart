import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/Screens/home_page.dart';
import 'package:untitled6/Screens/notifications_page.dart';
import 'package:untitled6/l10n/app_localizations.dart';
import 'BackEnd/Notifications/notifications_handler.dart';
import 'Screens/Auth/login.dart';
import 'Screens/personal_chat_page.dart';
import 'Screens/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      localeResolutionCallback: localeCallBack,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      routes: {
        '/home': (context) => const HomePage(index: 0,),
        '/noti': (context) => const HomePage(index: 1,),
        '/profile': (context) => const HomePage(index: 3,),
        '/login':(context)=> const Login(),
        '/notifications':(context)=> const NotificationsPage(),
        '/personal_chat_page':(context)=> const PersonalChatPage()
      },
      home: const SplashScreen(),
    );
  }
}


Locale localeCallBack(Locale? locale,Iterable<Locale> supportedLocales){
  if(locale==null){
    return supportedLocales.last;
  }

  for(var supportedLocale in supportedLocales){
    if(locale.languageCode==supportedLocale.languageCode){
      return supportedLocale;
    }
  }

  return supportedLocales.last;

}