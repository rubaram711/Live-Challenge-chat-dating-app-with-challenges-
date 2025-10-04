import 'package:flutter/material.dart';
import 'package:untitled6/consts/colors.dart';



class ReusableInAppBarBtn extends StatelessWidget {
  const ReusableInAppBarBtn(
      {Key? key, required this.text, required this.onTapFunction})
      : super(key: key);
  final String text;
  final Function onTapFunction;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Material(
      color: Colors.white.withOpacity(0.3),
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        splashColor: kThirdColor,
        borderRadius: BorderRadius.circular(30),
        onTap: () {
          onTapFunction();
        },
        child: Container(
          height: height * 0.036,
          width: width * 0.37,
          padding: const EdgeInsets.fromLTRB(20, 5, 5, 5),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}