import 'package:flutter/material.dart';
import '../../BackEnd/Services/register_by_google.dart';
import '../../Consts/colors.dart';
import '../../Widgets/reusable_alert.dart';
import '../../l10n/app_localizations.dart';
import 'package:flutter/foundation.dart';
bool isWaitingStatus=false;
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isIosPlatform=false;
  @override
  void initState() {
    if (defaultTargetPlatform == TargetPlatform.iOS){
       setState(() {
         isIosPlatform=true;
       });
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(color: kThirdColor.withOpacity(0.2),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            top: -(MediaQuery.of(context).size.width * 0.2),
            child: Container(
              height: MediaQuery.of(context).size.width * 0.95,
              width: MediaQuery.of(context).size.width*1.2,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [kBasicColor,kThirdColor,],
                  begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                  ),//color: kBasicColor.withOpacity(0.7),
                  borderRadius: BorderRadius.all(Radius.circular(
                      MediaQuery.of(context).size.width * 0.95
                  ))
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height*0.2,
            child: Container(
              height: MediaQuery.of(context).size.height*0.60,
              width: MediaQuery.of(context).size.width*0.90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow:   const [ BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0, // You can set this blurRadius as per your requirement
                ),],
              ),
              padding: const EdgeInsets.symmetric(
                  vertical:100,// MediaQuery.of(context).size.height * 0.21,
                  horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                  AppLocalizations.of(context)!.login,
                    style:const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.black),
                  ),
                  Text(
                      isIosPlatform
                          ? AppLocalizations.of(context)!.apple_login_explanation
                          : AppLocalizations.of(context)!.google_login_explanation,
                      style:const TextStyle(
                      fontSize: 17,color: Colors.black,
                  ),textAlign: TextAlign.center),
                  const SizedBox(height: 20,),
                  ReusableLoginButton(
                    text: isIosPlatform
                        ? AppLocalizations.of(context)!.apple_login_btn
                        :AppLocalizations.of(context)!.google_login_btn,
                    image:isIosPlatform?'assets/images/apple.png': 'assets/images/google.png',
                    onTapFunc: () async {
                      final Locale locale = Localizations.localeOf(context);
                      var rst=await AuthService().signInWithGoogle(locale.languageCode,context);
                      if(rst=='success'){
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(context, '/home');
                      }
                      else{
                        // ignore: use_build_context_synchronously
                        showDialog(
                            context: context,
                            builder: (context) {
                              return  AlertDialog(
                                content: Text(
                                    AppLocalizations.of(context)!.error),
                              );
                            });
                      }
                    },
                  )
                ],
              ),
            ),
          ),
          isWaitingStatus?const CircularProgressIndicator():const SizedBox()
        ],
      ),
    );
  }
}

class ReusableLoginButton extends StatelessWidget {
  const ReusableLoginButton(
      {Key? key,
      required this.onTapFunc,
      required this.text,
      required this.image})
      : super(key: key);
  final Function onTapFunc;
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
         onTapFunc();
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
              boxShadow:   const [ BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0, // You can set this blurRadius as per your requirement
              ),],
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: 45,
                height: 45,
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          )),
    );
  }
}
