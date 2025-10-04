import 'package:flutter/material.dart';
import '../Consts/colors.dart';

class PlusAndMinusButton extends StatelessWidget {
  const PlusAndMinusButton({Key? key, required this.isAdd, required this.onTapFunction}) : super(key: key);
  final bool isAdd;
  final Function onTapFunction;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height= MediaQuery.of(context).size.height;
    return Container(
      height: height*0.04,
      width: width*0.09,
      padding: const EdgeInsets.all(5),
      color: kBasicColor,
      child: Center(
        child: InkWell(
          onTap: (){
            onTapFunction();
          },
          child: Icon(
            isAdd? Icons.add: Icons.remove,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}