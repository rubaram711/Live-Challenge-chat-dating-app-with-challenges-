import 'package:flutter/material.dart';
import 'package:untitled6/BackEnd/send_request.dart';
import 'package:untitled6/Dialog/zoom_image_dialog.dart';
import 'package:untitled6/Widgets/reusable_alert.dart';
import 'package:untitled6/Widgets/reusable_button.dart';
import 'package:untitled6/l10n/app_localizations.dart';

import '../Consts/colors.dart';
import '../Widgets/reusable_plus_and_minus_button.dart';

class SendChallengeRequestDialog extends StatefulWidget {
  const SendChallengeRequestDialog(
      {Key? key, this.radius = 20, required this.userInfo})
      : super(key: key);
  final double radius;
  final Map userInfo;
  @override
  State<SendChallengeRequestDialog> createState() =>
      _SendChallengeRequestDialogState();
}

class _SendChallengeRequestDialogState
    extends State<SendChallengeRequestDialog> {
  int pointsCounter = 3;
  bool _adultFilter = false;
  int groupVal = 0;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.radius),
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
          height: height * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  widget.userInfo['img'] == ''
                      ? const CircleAvatar(
                          backgroundColor: kBgColor,
                          radius: 70,
                          child: Icon(
                            Icons.person,
                            size: 80,
                            color: Colors.black54,
                          ))
                      : InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return ZoomImageDialog(
                                  image: widget.userInfo['img'],
                                );
                              },
                            );
                          },
                          child: CircleAvatar(
                            backgroundColor: kBasicColor,
                            radius: 70,
                            child: ClipOval(
                                child: //Container(),
                                    Image.network(
                              widget.userInfo['img'],
                              fit: BoxFit.cover,
                              height: 140,
                              width: 140,
                            )),
                          ),
                        ),
                  widget.userInfo['adult'] == '1'
                      ? Positioned(
                          bottom: 4.0,
                          right: 1.0,
                          child: Image.asset(
                            'assets/images/adult.png',
                            width: 33,
                            height: 33,
                          ),
                        )
                      : const SizedBox()
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.radius),
                    border: Border.all(color: kBasicColor)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!
                          .challenge_award, //'Challenge Award',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: height * 0.045,
                          width: width * 0.65,
                          color: Colors.black38,
                          child: Center(
                            child: Text(
                              '$pointsCounter ${AppLocalizations.of(context)!.points}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Positioned(
                            left: 2,
                            child: PlusAndMinusButton(
                              onTapFunction: () {
                                if (pointsCounter != 3) {
                                  setState(() {
                                    pointsCounter--;
                                  });
                                }
                              },
                              isAdd: false,
                            )),
                        Positioned(
                            right: 2,
                            child: PlusAndMinusButton(
                              onTapFunction: () {
                                setState(() {
                                  pointsCounter++;
                                });
                              },
                              isAdd: true,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.radius),
                    border: Border.all(color: kBasicColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.request_adult,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Switch(
                      activeColor: kBasicColor,
                      activeTrackColor: kBasicColor.withOpacity(0.5),
                      inactiveThumbColor: Colors.grey,
                      inactiveTrackColor: Colors.grey.withOpacity(0.5),
                      value: _adultFilter,
                      onChanged: (bool value) {
                        setState(() {
                          _adultFilter = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.radius),
                    border: Border.all(color: kBasicColor)),
                child: Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.request_challenge_type,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 0,
                              activeColor: kBasicColor,
                              groupValue: groupVal,
                              onChanged: (value) {
                                setState(() {
                                  groupVal = value!;
                                });
                              },
                            ),
                            Text(AppLocalizations.of(context)!.audio),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 1,
                              activeColor: kBasicColor,
                              groupValue: groupVal,
                              onChanged: (value) {
                                setState(() {
                                  groupVal = value!;
                                });
                              },
                            ),
                            Text(AppLocalizations.of(context)!.video),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ReusableButton(
                  text: AppLocalizations.of(context)!.send_request,
                  onPressButton: () async {
                    var p = await sendRequest(
                        int. parse(widget.userInfo['id']),
                        pointsCounter,
                        _adultFilter ? 0 : 1,
                        groupVal);
                    if(p=='success'){
                      // ignore: use_build_context_synchronously
                      alert(context, AppLocalizations.of(context)!.sent_successfully);
                    }else{
                      // ignore: use_build_context_synchronously
                      alert(context, AppLocalizations.of(context)!.sent_field);
                    }
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pop();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
