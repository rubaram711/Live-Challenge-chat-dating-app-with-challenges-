import 'package:flutter/material.dart';


class ZoomImageDialog extends StatelessWidget {
  const ZoomImageDialog({Key? key, this.radius = 20, required this.image}) : super(key: key);
  final double radius;
  final String image;

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return Dialog(
      insetPadding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),),
      child: SizedBox(
        height: height * 0.5,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: Image.network(image,fit: BoxFit.cover,)),
      ),
    );
  }
}
