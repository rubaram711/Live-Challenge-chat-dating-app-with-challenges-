import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Consts/colors.dart';
import 'home_page.dart';

List messagesList=[
  {
    'text':'Hello',
    'sender':'1',
    'time':'10:20 PM',
    'reciever':'10',
  },{
    'text':'Hello',
    'sender':'10',
    'time':'10:20 PM',
    'reciever':'1',
  },


];
class PersonalChatPage extends StatefulWidget {
  const PersonalChatPage({Key? key}) : super(key: key);

  @override
  State<PersonalChatPage> createState() => _PersonalChatPageState();
}

class _PersonalChatPageState extends State<PersonalChatPage> {
  String otherPersonId='';
  String otherPersonName='';
  final messageTextController=TextEditingController();
  String? messageText;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final Map<String, dynamic>? args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    setState(() {
      otherPersonId= args!["id"];
      otherPersonName= '${args['name']}';
    });
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.081,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: height*0.035,
              child: args!['img']==''
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
            const SizedBox(
              width: 10,
            ),
            Text(otherPersonName,
                  style: const TextStyle(
               color: Colors.white,
               fontSize: 15,
               fontWeight: FontWeight.bold),
                ),
          ],
        ),
        backgroundColor: kBasicColor,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessageStreamBuilder(otherPersonId: otherPersonId,),
            Container(
              decoration: const BoxDecoration(
                  border:
                  Border(top: BorderSide(width: 2, color: kBasicColor))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: TextField(
                        controller: messageTextController,
                        onChanged: (value) {
                          setState(() {
                            messageText=value;
                          });
                        },
                        decoration: const InputDecoration(
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            border: InputBorder.none),
                      )),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      messageTextController.clear();
                   setState(() {
                     messagesList.add({
                       'text':messageText,
                       'sender':myData['id'],
                       'time':DateFormat("HH:mm").format(DateTime.now()),
                       'reciever':otherPersonId,
                     });
                   });
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStreamBuilder extends StatelessWidget {
  const MessageStreamBuilder({Key? key, required this.otherPersonId}) : super(key: key);
  final String otherPersonId;
  @override
  Widget build(BuildContext context) {
          List<MessageBubble> messagesWidgets=[];
          for(var message in messagesList.reversed){
            final messageText=message['text'];
            final messageSender=message['sender'];
            final messageReciever=message['reciever'];
            final currentUser=myData['id'];
              final messageWidget=MessageBubble(text: messageText,sender:messageSender,
                isMe: messageSender==currentUser && messageReciever==otherPersonId?true:false,
              );
              messagesWidgets.add(messageWidget);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              children: messagesWidgets,
            ),
          );
  }
}


class MessageBubble extends StatelessWidget {
  const MessageBubble({Key? key, required this.text, required this.sender, required this.isMe}) : super(key: key);
  final String text;
  final String sender;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return
      Padding(
      padding:isMe
          ? const EdgeInsets.fromLTRB(90,5,10,5)
          : const EdgeInsets.fromLTRB(10,5,90,5),
      child:
      Column(
        mainAxisAlignment: isMe?MainAxisAlignment.end:MainAxisAlignment.start,
        crossAxisAlignment: isMe?CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Material(
            borderRadius: isMe
                ? const BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )
                : const BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            color:isMe? kSecondaryColor:Colors.grey[400],
            child: Column(
              crossAxisAlignment: isMe?CrossAxisAlignment.end:CrossAxisAlignment.start,
              children: [
                Container(
                    padding:isMe?const EdgeInsets.fromLTRB(40,10,20,10):const EdgeInsets.fromLTRB(20,10,40,10),
                    child: Text(text)
              ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}