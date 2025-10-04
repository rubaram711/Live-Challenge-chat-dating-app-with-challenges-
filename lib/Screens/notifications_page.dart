import 'package:flutter/material.dart';
import '../BackEnd/get_notifications.dart';
import '../Widgets/reusable_notification_card.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  var notifications=[];
  bool isDataFetched=false;
  int page=0;
  bool isLoadMore = false;
  ScrollController scrollController = ScrollController();
  getNotificationsFromBack()async{
    var p=await getNotifications(page);
    if(p!=[]){
      setState(() {
        notifications.addAll(p);
      });
    }
    scrollController.addListener(() async {
      if (isLoadMore) return;
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        setState(() async {
          isLoadMore = true;
          page = page + 1;
          var p = await getNotifications(page);
          notifications.addAll(p);
          setState(() {
            isLoadMore = false;
          });
        });
      }
    });
    setState(() {
      isDataFetched=true;
    });
  }
  @override
  void initState() {
    getNotificationsFromBack();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return RefreshIndicator(
      onRefresh: () async{
        setState(() {
          notifications=[];
          isDataFetched=false;
        });
         getNotificationsFromBack();
      },
      child: SizedBox(
        height: height*0.75,
        child:isDataFetched? ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: scrollController,
          itemCount: isLoadMore
              ? notifications.length + 1
              : notifications.length,
          itemBuilder: (context, index) {
            if (index >= notifications.length) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else{
                    return ReusableNotificationCard(
                        notificationInfo: notifications[index]);
                  }
                },):const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
