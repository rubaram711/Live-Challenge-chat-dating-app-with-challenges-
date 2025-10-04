import 'package:flutter/material.dart';
import 'package:untitled6/Consts/colors.dart';
import 'package:untitled6/Widgets/reusable_coins_card.dart';
import '../BackEnd/get_my_points.dart';
import '../Dialog/update_profile_dialog.dart';
import '../Widgets/reusable_button.dart';
import '../Widgets/reusable_text_for_profile.dart';
import '../l10n/app_localizations.dart';
import 'home_page.dart';
//import 'package:cached_network_image/cached_network_image.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isMyDataFetched=false;
  String points='0';
  getMyPointsFromBack() async{
    var p= await getMyPoints();
    setState(() {
      points='$p';
      isMyDataFetched=true;
    });
  }
  @override
  void initState() {
    getMyPointsFromBack();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.fromLTRB(7, 0, 7, 20),
      height: height * 0.75,
      child: isMyDataFetched && myData.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // ReusableCoinsCard(
                    //   coinsNumber: '34.99k',
                    //   image: 'assets/images/coin.png',
                    // ),
                    ReusableCoinsCard(
                        coinsNumber: points,
                        image: 'assets/images/money.png'),
                    ReusableCoinsCard(
                      coinsNumber:'${myData['level']}',
                      image: 'assets/images/level.png',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    myData['img'] == '' ||  myData['img']==null
                        ? Container(
                            height: height * 0.3,
                            width: width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade200, blurRadius: 8)
                              ],
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  'assets/images/profile.png',
                                  color: Colors.black54,
                                )),
                          )
                        : SizedBox(
                            height: height * 0.3,
                            width: width * 0.4,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(
                                myData['img'],
                                fit: BoxFit.cover,
                                height: height * 0.3,
                                width: width * 0.4,
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
                              ),
                            ),
                          ),
                    SizedBox(
                      width: width*0.035,
                    ),
                    SizedBox(
                      height: height * 0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableTextForProfile(
                            text: myData['nike'] ?? '',
                          ),
                          ReusableTextForProfile(
                            text: myData['country'] == '' ||  myData['country']==null
                                ? AppLocalizations.of(context)!
                                    .unspecified_country
                                : myData['country'],
                          ),
                          ReusableTextForProfile(
                            text: myData['mobile'] == ''||  myData['mobile']==null
                                ? AppLocalizations.of(context)!
                                    .unspecified_phone
                                : myData['mobile'],
                          ),
                          ReusableTextForProfile(
                            text: myData['accept'] == "1" ||  myData['accept']==null
                                ? AppLocalizations.of(context)!
                                    .accept_challenges
                                : AppLocalizations.of(context)!
                                    .not_accept_challenges,
                          ),
                          ReusableTextForProfile(
                              text: myData['adult'] == "1" ||  myData['adult']==null
                                  ? AppLocalizations.of(context)!
                                      .accept_adult_challenges
                                  : AppLocalizations.of(context)!
                                      .not_accept_adult_challenges)
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: height * 0.02),
                  height: height * 0.1,
                  width: width * 0.8,
                  child: Center(
                    child: myData['bio'] == '' ||  myData['bio']==null
                        ? Text(
                            AppLocalizations.of(context)!.unspecified_bio,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black26, fontSize: 16),
                          )
                        : Text(
                            myData['bio'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 17),
                          ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                ReusableButton(
                  text: AppLocalizations.of(context)!.update_profile,
                  onPressButton: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const UpdateProfileDialog(
                          adult: 1,
                        );
                      },
                    );
                  },
                )
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
