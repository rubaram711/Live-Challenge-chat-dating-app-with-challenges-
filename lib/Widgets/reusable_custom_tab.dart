import 'package:flutter/material.dart';
import 'package:untitled6/consts/colors.dart';
import '../Screens/home_page.dart';

class ReusableCustomTab extends StatefulWidget {
  const ReusableCustomTab(
      {Key? key, required this.index, required this.onPressFunc, required this.text,})
      : super(key: key);
  final Function onPressFunc;
  final int index;
  final String text;
  @override
  State<ReusableCustomTab> createState() => _ReusableCustomTabState();
}

class _ReusableCustomTabState extends State<ReusableCustomTab> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width*0.17,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              widget.onPressFunc();
            },
            child: CircleAvatar(
              backgroundColor:tabs[widget.index]['isClicked']?kThirdColor: Colors.white.withOpacity(0.3),
              radius: width*0.07,
              child: ClipOval(
                  child: Icon(tabs[widget.index]['icon'],size: width*0.08,color: Colors.white,)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.text,//tabs[widget.index]['text'],
            style: const TextStyle(fontSize: 11, color: Colors.white),
          )
        ],
      ),
    );
  }
}