import 'package:flutter/material.dart';


class ReusableTextForProfile extends StatelessWidget {
  const ReusableTextForProfile({Key? key, required this.text})
      : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.44,
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
      ),
    );
  }
}