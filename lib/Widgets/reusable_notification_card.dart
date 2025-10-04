import 'package:flutter/material.dart';
import 'package:untitled6/Widgets/reusable_alert.dart';
import 'package:untitled6/l10n/app_localizations.dart';

import '../BackEnd/mark_notification_as_read.dart';
import '../BackEnd/send_accept.dart';
import '../Screens/home_page.dart';

class ReusableNotificationCard extends StatefulWidget {
  const ReusableNotificationCard({Key? key, required this.notificationInfo})
      : super(key: key);
  final Map notificationInfo;

  @override
  State<ReusableNotificationCard> createState() =>
      _ReusableNotificationCardState();
}

class _ReusableNotificationCardState extends State<ReusableNotificationCard> {
  bool isRead = false;
  bool isAcceptNot = false;
  changeReadState() {
    if (widget.notificationInfo['id_snd'] == myData['id']) {
      setState(() {
        isAcceptNot = true;
      });
      if (widget.notificationInfo['noti_snd'] == '1') {
        setState(() {
          isRead = true;
        });
      }
    } else if (widget.notificationInfo['id_rec'] == myData['id']) {
      if (widget.notificationInfo['noti_rec'] == '1') {
        setState(() {
          isRead = true;
        });
      }
    }
  }

  @override
  void initState() {
    changeReadState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: !isRead ?() async {
        var p = await markNotificationAsRead(widget.notificationInfo['id']);
        if (p == 'success') {
          setState(() {
            isRead = true;
          });
        }

       if(!isAcceptNot) {
         print('m');
          var res = await sendAccept(
            int.parse(widget.notificationInfo['id']),
          );
          if (res == 'success') {
            // ignore: use_build_context_synchronously
            alert(context, AppLocalizations.of(context)!.accept_successfully);
          } else {
            // ignore: use_build_context_synchronously
            alert(context, AppLocalizations.of(context)!.accept_successfully);
          }
        }
      } :null,
      child: Container(
        height: height * 0.15,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        margin: const EdgeInsets.only(
          top: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 8)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.2),
              radius: 30,
              child: ClipOval(
                  child: Icon(
                    widget.notificationInfo['type'] == '0'? Icons.phone:Icons.videocam,
                          size: 32,
                          color:isAcceptNot?Colors.green: Colors.blue,
                        )),
            ),
            SizedBox(
              width: width * 0.05,
            ),
            SizedBox(
              width: width * 0.5,
              child: Text(
                isAcceptNot
                    ? AppLocalizations.of(context)!.receive_accept(
                        widget.notificationInfo['type'] == '0' ? 'audio' : 'video',
                        widget.notificationInfo['nike'],
                        widget.notificationInfo['pnts'])
                    : AppLocalizations.of(context)!.receive_request(
                        widget.notificationInfo['type'] == '0' ? 'audio' : 'video',
                        widget.notificationInfo['nike'],
                        widget.notificationInfo['pnts']),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isRead ? Colors.grey[600] : Colors.black,
                    fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}
