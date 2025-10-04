import 'package:flutter/material.dart';


class ReusableCoinsCard extends StatelessWidget {
  const ReusableCoinsCard({Key? key, required this.coinsNumber, required this.image}) : super(key: key);
final String coinsNumber;
final String image;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height= MediaQuery.of(context).size.height;
    return Container(
      height: height*0.06,
      width: width*0.4,
      padding: const EdgeInsets.all(5),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: height*0.036,
            width: width*0.4,
            padding: const EdgeInsets.fromLTRB(20,5,5,5),
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(30),
            ),
            child:  Center(
              child: Text(
                coinsNumber,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15),
              ),
            ),
          ),
          Positioned(
              left: 0,
              child: Image.asset( image,height: width*0.09,width: width*0.09,fit: BoxFit.contain,))
        ],
      ),
    );
  }
}
