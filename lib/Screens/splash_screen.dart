import 'package:flutter/material.dart';
import 'package:untitled6/Screens/home_page.dart';

import '../Locale_Memory/save_user_info_locally.dart';
import 'Auth/login.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate=false;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child:   Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
                duration: const Duration(milliseconds: 400),
                bottom:animate? 300 :-170,
                child: const Logo())
          ],
        ),
      ),
    );
  }

  Future startAnimation() async{
    String id='';
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {animate=true;});
    String idToken=await getIdTokenFromPref();
    setState(() {
      id=idToken;
    });
    await Future.delayed(const Duration(milliseconds: 1000));
    // ignore: use_build_context_synchronously
    if(id==''){
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => const Login()),
              (Route<dynamic> route) => false);
    } else{
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => const HomePage(index: 0)),
              (Route<dynamic> route) => false);
    }
  }
}

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: 250,
          width: 250,
          child: Image.asset('assets/images/logo.png')),
    );
  }
}