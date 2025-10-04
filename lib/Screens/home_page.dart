import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/Screens/profile_page.dart';
import 'package:untitled6/Screens/support_page.dart';
import 'package:untitled6/Screens/users_page.dart';
import 'package:untitled6/Widgets/reusable_alert.dart';
import 'package:untitled6/consts/colors.dart';
import '../BackEnd/get_my_data.dart';
import '../BackEnd/login.dart';
import '../Dialog/deposit_dialog.dart';
import '../Dialog/privacy_policy_dialog.dart';
import '../Locale_Memory/save_user_info_locally.dart';
import '../Widgets/reusable_custom_tab.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Widgets/reusable_in_app_bar_btn.dart';
import '../l10n/app_localizations.dart';
import 'chats_page.dart';
import 'notifications_page.dart';


List tabs = [
  {'text': 'users', 'isClicked': true, 'icon': Icons.group},
  {
    'text': 'notifications',
    'isClicked': false,
    'icon': Icons.notifications_active
  },
  {'text': 'chat', 'isClicked': false, 'icon': Icons.chat},
  {'text': 'profile', 'isClicked': false, 'icon': Icons.person},
  {'text': 'support', 'isClicked': false, 'icon': Icons.support},
];

List content = [
  const UsersPage(),
  const NotificationsPage(),
  const ChatsPage(),
  const ProfilePage(),
  const SupportPage(),
];

var myData = {};
bool isMyDataFetched = false;

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.index}) : super(key: key);
final int index;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  sendLangAndToken()async{
    String accessToken = await getAccessTokenFromPref();
    String email = await getEmailFromPref();
    String idToken = await getIdTokenFromPref();
    String nike = await getNikeNameFromPref();
    // ignore: use_build_context_synchronously
    final Locale locale = Localizations.localeOf(context);
    var p=await login(nike, email, accessToken, idToken, locale.languageCode);
    if(p!='success'){
      // ignore: use_build_context_synchronously
      alert(context, 'There is an error');
    }
  }



  getMyDataMenu() async {
    myData = await getMyData();
    setState(() {
      isMyDataFetched = true;
    });
  }


  void requestPermission() async{
    FirebaseMessaging messaging=FirebaseMessaging.instance;
    NotificationSettings settings=await messaging.requestPermission(
      alert: true,
      announcement:false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      // ignore: use_build_context_synchronously
      // Navigator.pushNamed(context, '/noti');
    }
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Navigator.pushNamed(context, '/notifications');
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      Navigator.pushNamed(context, '/noti');
    });
  }
  getUserToken() async{
    await FirebaseMessaging.instance.getToken().then((token) => print('00000token $token'));
  }
  int thisPageIndex =0;
  @override
  void initState() {
    super.initState();
  setState(() {
    thisPageIndex = widget.index;
  });
    if(thisPageIndex==1){
      setState(() {
        tabs[1]['isClicked'] = true;
        tabs[0]['isClicked'] = false;
        tabs[2]['isClicked'] = false;
        tabs[3]['isClicked'] = false;
        tabs[4]['isClicked'] = false;
      });
    }
    sendLangAndToken();
    getUserToken();
    requestPermission();
    getMyDataMenu();
    SharedPreferences.getInstance().then((prefs) {
      final int dialogOpen = prefs.getInt('dialog_open') ?? 0;
      if (dialogOpen == 0) {
        showDialog(
          context: context,
          builder: (context) {
            return const PrivacyPolicyDialog(
              mdFileName: 'privacy_policy.md',
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.fromLTRB(15, height * 0.045, 15, 0),
          child: Column(
            children: [
              Container(
                height: height * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: kBasicColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ReusableCustomTab(
                          index: 0,
                          text: AppLocalizations.of(context)!.users,
                          onPressFunc: () {
                            setState(() {
                              thisPageIndex = 0;
                              tabs[0]['isClicked'] = true;
                              tabs[1]['isClicked'] = false;
                              tabs[2]['isClicked'] = false;
                              tabs[3]['isClicked'] = false;
                              tabs[4]['isClicked'] = false;
                            });
                          },
                        ),
                        ReusableCustomTab(
                          index: 1,
                          text: AppLocalizations.of(context)!.notifications,
                          onPressFunc: () {
                            setState(() {
                              thisPageIndex = 1;
                              tabs[1]['isClicked'] = true;
                              tabs[0]['isClicked'] = false;
                              tabs[2]['isClicked'] = false;
                              tabs[3]['isClicked'] = false;
                              tabs[4]['isClicked'] = false;
                            });
                          },
                        ),
                        ReusableCustomTab(
                          index: 2,
                          text: AppLocalizations.of(context)!.chat,
                          onPressFunc: () {
                            setState(() {
                              thisPageIndex = 2;
                              tabs[2]['isClicked'] = true;
                              tabs[0]['isClicked'] = false;
                              tabs[1]['isClicked'] = false;
                              tabs[3]['isClicked'] = false;
                              tabs[4]['isClicked'] = false;
                            });
                          },
                        ),
                        ReusableCustomTab(
                          index: 3,
                          text: AppLocalizations.of(context)!.profile,
                          onPressFunc: () {
                            setState(() {
                              thisPageIndex = 3;
                              tabs[3]['isClicked'] = true;
                              tabs[0]['isClicked'] = false;
                              tabs[1]['isClicked'] = false;
                              tabs[2]['isClicked'] = false;
                              tabs[4]['isClicked'] = false;
                            });
                          },
                        ),
                        ReusableCustomTab(
                          index: 4,
                          text: AppLocalizations.of(context)!.support,
                          onPressFunc: () {
                            setState(() {
                              thisPageIndex = 4;
                              tabs[4]['isClicked'] = true;
                              tabs[0]['isClicked'] = false;
                              tabs[1]['isClicked'] = false;
                              tabs[2]['isClicked'] = false;
                              tabs[3]['isClicked'] = false;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ReusableInAppBarBtn(
                          text: AppLocalizations.of(context)!.deposit,
                          onTapFunction: () {
                            showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const DepositDialog();
                                  },
                                );
                          },
                        ),
                        ReusableInAppBarBtn(
                          text: AppLocalizations.of(context)!.withdraw,
                          onTapFunction: () {},
                        )
                      ],
                    ),
                  ],
                ),
              ),
              content[thisPageIndex]
            ],
          ),
        ));
  }
}


