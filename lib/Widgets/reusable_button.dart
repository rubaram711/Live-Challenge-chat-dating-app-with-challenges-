import 'package:flutter/material.dart';
import '../consts/colors.dart';



class ReusableGradientButton extends StatelessWidget {
  const ReusableGradientButton({super.key, required this.text,required this.onPressButton});
  final String text;
  final Function onPressButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [kBasicColor, kThirdColor]),
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
          onPressed: (){
             onPressButton();
          },
        style: ElevatedButton.styleFrom(
            backgroundColor:
            text=='Disagree'||text== 'رفض'||text=='Cancel'||text== 'إلغاء' ? Colors.grey: Colors.transparent ,
            minimumSize:const Size.fromHeight(45), //MediaQuery.of(context).size*0.06,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      ),
    );
  }
}

class ReusableButton extends StatelessWidget {
  const ReusableButton({super.key, required this.text,required this.onPressButton});
  final String text;
  final Function onPressButton;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
          onPressButton();
        },
      style: ElevatedButton.styleFrom(
        backgroundColor: kBasicColor,
          minimumSize:const Size.fromHeight(50), //MediaQuery.of(context).size*0.06,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),

      ),
      child: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    );
  }
}




class ReUsableTextButton extends StatelessWidget {
  const ReUsableTextButton({super.key, required this.text, required this.onPress, required this.isGrey, required this.isUnderLined});
  final String text;
  final Function onPress;
 final bool isGrey;
 final bool isUnderLined;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        onPress();
      },
      child: Text(text,
        style: TextStyle(
            fontSize: 15,
            decoration:isUnderLined? TextDecoration.underline:TextDecoration.none,
            fontWeight: FontWeight.bold,
           // color:isGrey? Colors.grey: kBasicColor
        ),
      ),
    );
  }
}

class ReusableButtonWithStyling extends StatelessWidget {
  const ReusableButtonWithStyling({Key? key, required this.text, required this.onPressButton}) : super(key: key);
  final String text;
  final Function onPressButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){onPressButton();},
      child: Container(
        height: 90,
        width: 350,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/bg.jpg",),fit: BoxFit.cover)
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
             // color: kBasicColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
