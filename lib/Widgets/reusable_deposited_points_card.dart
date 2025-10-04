import 'package:flutter/material.dart';

import '../Consts/colors.dart';


class ReusableDepositedPointsCard extends StatelessWidget {
  const ReusableDepositedPointsCard({Key? key, required this.text, required this.onTapFunction, required this.isClicked}) : super(key: key);
  final String text;
  final bool isClicked;
  final Function onTapFunction;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        onTapFunction();
      },
      child: Container(
        height: height * 0.055,
        width: width * 0.7,
        decoration: BoxDecoration(
          color: isClicked?kBasicColor: kThirdColor,
          border: Border.all(color: kBasicColor),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.fromLTRB(20, 5, 5, 5),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 15),
          ),
        ),
      ),
    );
  }
}