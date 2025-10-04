import 'package:flutter/material.dart';
import '../Consts/colors.dart';


class ReusableUserCard extends StatelessWidget {
  const ReusableUserCard({Key? key, required this.userInfo, required this.onTapFunction}) : super(key: key);
  final Map userInfo;
  final Function onTapFunction;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height= MediaQuery.of(context).size.height;
    return InkWell(
      onTap: (){
        FocusScope.of(context).unfocus();
        onTapFunction();
      },
      child: Container(
        height: height*0.17,
        padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        margin: const EdgeInsets.only(top: 10,),
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 8
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child:userInfo['img']!='' || userInfo['img']!=null ? Image.network(userInfo['img'],
                height: width*0.25,
                width: width*0.25,fit: BoxFit.cover,
                loadingBuilder:
                ((context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: kBasicColor,
                      value:
                      loadingProgress.expectedTotalBytes !=
                          null
                          ? loadingProgress
                          .cumulativeBytesLoaded /
                          loadingProgress
                              .expectedTotalBytes!
                          : null,
                    ),
                  );
                }),
              ):
              Image.asset('assets/images/profile.png',
                height: width*0.25,
                width: width*0.25,fit: BoxFit.contain,),
            ),
            const SizedBox(width: 15,),
            SizedBox(
              width: width*0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: height*0.02,),
                  Row(
                    children: [
                      Text(
                        userInfo['nike'] ?? '',
                        style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15),),
                      userInfo['adult']=='1' ? const SizedBox(width: 5,):const SizedBox(),
                      userInfo['adult']=='1' ?  Image.asset('assets/images/adult.png',width: 25,height: 25,) :const SizedBox()
                    ],
                  ),
                  const SizedBox(height: 5,),
                  // Text(userInfo['brief'])
                  Text(userInfo['bio'] ?? '')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}