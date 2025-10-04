import 'package:flutter/material.dart';

import '../Consts/colors.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  bool isLoadMore = false;
  ScrollController scrollController = ScrollController();
  //todo: change isDataFetched and chatsList value
  bool isDataFetched = true;
  List chatsList=[
    {
    'name':'rami ahmad',
     'last_msg':'hi',
      'img':'',
      'time':'12:55 PM',
      'id':'10',
  },
    {
    'name':'anas ahmad',
     'last_msg':'hello',
      'img':'',
      'time':'10:55 PM',
      'id':'10',
    },    {
    'name':'rami ahmad',
     'last_msg':'hi',
      'img':'',
      'time':'12:00 PM',
      'id':'10',
    },
  ];
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return
      RefreshIndicator(
        onRefresh: () async{
          //setState(() {
            //chatsList=[];
           // isDataFetched=false;
         // });
        //  getChatsFromBack();
        },
        child: SizedBox(
        height: height*0.75,
        child:isDataFetched? ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: scrollController,
          itemCount: isLoadMore
              ? chatsList.length + 1
              : chatsList.length,
          itemBuilder: (context, index) {
            if (index >= chatsList.length) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else{
              return ReusableChatsListItemCard(
                  chatsListItem: chatsList[index]);
            }
          },):const Center(child: CircularProgressIndicator()),
    ),
      );
  }
}


class ReusableChatsListItemCard extends StatelessWidget {
  const ReusableChatsListItemCard({Key? key, required this.chatsListItem}) : super(key: key);
final Map chatsListItem;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              radius: height*0.035,
              child: chatsListItem['img']==''
                  ? ClipOval(
                  child: Image.asset(
                    'assets/images/leo.jpg',
                    fit: BoxFit.cover,
                    height: width*0.15,
                    width: width*0.15,
                  ))
                  : ClipOval(
                  child: Image.asset(
                    'assets/images/profile.png',
                    fit: BoxFit.cover,
                    height: width*0.15,
                    width: width*0.15,
                  )),
            ),
            // CircleAvatar(
            //   backgroundColor: kBasicColor,
            //   radius: 30,
            //   child:
            //   // chatsListItem['img']!='' || chatsListItem['img']!=null ? Image.network(chatsListItem['img'],
            //   //     height: 30,//width*0.15,
            //   //     width:30,// width*0.15,
            //   //   fit: BoxFit.cover,
            //   //     loadingBuilder:
            //   //     ((context, child, loadingProgress) {
            //   //       if (loadingProgress == null) {
            //   //         return child;
            //   //       }
            //   //       return Center(
            //   //         child: CircularProgressIndicator(
            //   //           color: kBasicColor,
            //   //           value:
            //   //           loadingProgress.expectedTotalBytes !=
            //   //               null
            //   //               ? loadingProgress
            //   //               .cumulativeBytesLoaded /
            //   //               loadingProgress
            //   //                   .expectedTotalBytes!
            //   //               : null,
            //   //         ),
            //   //       );
            //   //     }),
            //   //   ):
            // //     Image.asset('assets/images/profile.png',
            // //       height: width*0.15,
            // //       width: width*0.15,
            // //       fit: BoxFit.contain,),
            // // ),
            // // ClipRRect(
            // //   borderRadius: BorderRadius.circular(30),
            // //   child:chatsListItem['img']!='' || chatsListItem['img']!=null ? Image.network(chatsListItem['img'],
            // //     height: width*0.15,
            // //     width: width*0.15,fit: BoxFit.cover,
            // //     loadingBuilder:
            // //     ((context, child, loadingProgress) {
            // //       if (loadingProgress == null) {
            // //         return child;
            // //       }
            // //       return Center(
            // //         child: CircularProgressIndicator(
            // //           color: kBasicColor,
            // //           value:
            // //           loadingProgress.expectedTotalBytes !=
            // //               null
            // //               ? loadingProgress
            // //               .cumulativeBytesLoaded /
            // //               loadingProgress
            // //                   .expectedTotalBytes!
            // //               : null,
            // //         ),
            // //       );
            // //     }),
            // //   ):
            // //   Image.asset('assets/images/profile.png',
            // //     height: width*0.15,
            // //     width: width*0.15,
            // //     fit: BoxFit.contain,),
            // // ),
            title: Text(
              chatsListItem['name'],
              style: const TextStyle(fontSize: 17),
            ),
            subtitle
                : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(chatsListItem['last_msg']),
                    Text(chatsListItem['time']),
                  ],
                ),
            onTap: () {
              Navigator.pushNamed(context, '/personal_chat_page',arguments: chatsListItem);
            },
          ),
        ),
        const Divider(color: Colors.grey,)
      ],
    );
  }
}

