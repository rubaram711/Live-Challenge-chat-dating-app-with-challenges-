import 'package:flutter/material.dart';
import '../BackEnd/get_users.dart';
import '../Consts/colors.dart';
import '../Dialog/send_challenge_request_dialog.dart';
import '../Widgets/reusable_text_field.dart';
import '../Widgets/reusable_user_card.dart';
import '../l10n/app_localizations.dart';



class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  var usersList = [];
  bool isUsersDataFetched = false;
  bool _adultFilter = false;
  var copyList = [];
  String search='';
  int page=0,adult=2;
  bool isLoadMore = false;
  ScrollController scrollController = ScrollController();
  fetchData() async {
    setState(() {
      usersList=[];
    });
    var p = await getUsers(search,page,adult);
    usersList.addAll(p);
    scrollController.addListener(() async {
      if (isLoadMore) return;
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        setState(() async {
          isLoadMore = true;
          page = page + 1;
            var p = await getUsers(search,page,adult);
          usersList.addAll(p);
          setState(() {
            isLoadMore = false;
          });
        });
      }
    });
    setState(() {
        isUsersDataFetched = true;
    });
  }


  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return RefreshIndicator(
      onRefresh: () async{
        setState(() {
          usersList=[];
          isUsersDataFetched=false;
        });
        fetchData();
      },
      child: GestureDetector(
        onTap: ()=>FocusScope.of(context).unfocus(),
        child: SizedBox(
            height: height * 0.75,
            child: isUsersDataFetched
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: width * 0.75,
                              child: ReusableTextField(
                                text: AppLocalizations.of(context)!.search,
                                isEnabled: true,
                                onChangedFunc: (value) {
                                  setState(() {
                                    search=value;
                                  });
                                },
                                validationFunc: () {},
                                onTapFunction: (){},
                              )),
                          InkWell(
                            onTap: (){
                              isUsersDataFetched=false;
                              fetchData();
                            },
                            child: const CircleAvatar(
                              backgroundColor: kBasicColor,
                              radius: 22,
                              child: ClipOval(
                                  child: Icon(
                                    Icons.search,
                                    size: 24,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              '     ${AppLocalizations.of(context)!.filter}'),
                          Switch(
                            activeColor: kBasicColor,
                            activeTrackColor: kBasicColor.withOpacity(0.5),
                            inactiveThumbColor: Colors.grey,
                            inactiveTrackColor: Colors.grey.withOpacity(0.5),
                            value: _adultFilter,
                            onChanged: (bool value) {
                              setState(() {
                                _adultFilter = value;
                                if (value == true) {
                                  setState(() {
                                    adult=1;
                                    isUsersDataFetched=false;
                                    fetchData();
                                    // usersList = usersList
                                    //     .where((element) => element['adult'] =='1')
                                    //     .toList();
                                  });
                                } else {
                                  setState(() {
                                    adult=2;
                                    isUsersDataFetched=false;
                                    fetchData();
                                    //usersList = copyList;
                                  });
                                }
                              });
                            },
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          controller: scrollController,
                          itemCount: isLoadMore
                              ? usersList.length + 1
                              : usersList.length,
                          itemBuilder: (context, index) {
                            if (index >= usersList.length) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else{
                              return ReusableUserCard(
                                  userInfo: usersList[index],
                              onTapFunction: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return  SendChallengeRequestDialog(
                                    userInfo: usersList[index],
                                    );
                                  },
                                );
                              },
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  )
                : const Center(child: CircularProgressIndicator())
        ),
      ),
    );
  }
}
