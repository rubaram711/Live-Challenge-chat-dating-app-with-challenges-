import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled6/BackEnd/update_user.dart';
import 'package:untitled6/BackEnd/upload_image.dart';
import 'package:untitled6/Widgets/reusable_alert.dart';
import '../BackEnd/get_my_data.dart';
import '../Consts/colors.dart';
import '../Locale_Memory/save_user_info_locally.dart';
import '../Screens/home_page.dart';
import '../Widgets/reusable_button.dart';
import '../Widgets/reusable_text_field.dart';
import '../l10n/app_localizations.dart';

class UpdateProfileDialog extends StatefulWidget {
  const UpdateProfileDialog({Key? key, this.radius = 20, required this.adult})
      : super(key: key);
  final double radius;
  final int adult;
  @override
  State<UpdateProfileDialog> createState() => _UpdateProfileDialogState();
}

class _UpdateProfileDialogState extends State<UpdateProfileDialog> {
  final formKey = GlobalKey<FormState>();
  String userImage64 = '';
  String username = myData['nike']==''?'username':myData['nike'];
  String bio =  myData['bio']==''?'bio':myData['bio'];
  String country =  myData['country']==''?'country':myData['country'];
  String phone =  myData['mobile']==''?'mobile phone':myData['mobile'];
  String phoneCode='';
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Widget bottomSheet() {
    return Container(
      height: 110.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.enter_photo,
            style: const TextStyle(fontSize: 18.0),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.camera,
                      color: kBasicColor,
                      size: 35,
                    ),
                    onPressed: () async {
                      //await takePhoto(ImageSource.camera);
                      final pickedFile = await _picker.pickImage(
                        source: ImageSource.camera,
                      );
                      if (pickedFile != null) {
                        setState(() {
                          hasImage = false;
                          _imageFile = File(pickedFile.path);
                        });
                      }
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pop();
                    },
                  ),
                  Text(
                    AppLocalizations.of(context)!.camera,
                  ),
                ],
              ),
              const SizedBox(
                width: 90,
              ),
              Column(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.image,
                      color: kBasicColor,
                      size: 35,
                    ),
                    onPressed: () async {
                      // await takePhoto(ImageSource.gallery);
                      final pickedFile = await _picker.pickImage(
                        source: ImageSource.gallery,
                      );
                      if (pickedFile != null) {
                        setState(() {
                          hasImage = false;
                          _imageFile = File(pickedFile.path);
                        });
                      }
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pop();
                    },
                  ),
                  Text(
                    AppLocalizations.of(context)!.gallery,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Future<String> imageToBase64String(File? imageFile) async {
    final bytes = File(imageFile!.path).readAsBytesSync();
    String img64 = base64Encode(bytes);
    return img64;
  }

  imageFromBase64String(String base64String) {
    final bytes = const Base64Decoder().convert(base64String);
    return bytes;
  }

  bool hasImage = false;
  bool _accept = myData['accept']=='1'?true:false;
  bool _adult = myData['adult']=='1'?true:false;

  @override
  void initState() {
   if(myData['img']!=''){
     setState(() {
       hasImage=true;
     });
   }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.radius)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        hasImage == false
                            ? _imageFile == null
                                ? const CircleAvatar(
                                    backgroundColor: kBgColor,
                                    radius: 60,
                                    child: Icon(
                                      Icons.person,
                                      size: 80,
                                      color: Colors.black54,
                                    ))
                                : CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 60,
                                    child: ClipOval(
                                        child: Image.file(
                                      _imageFile!,
                                      fit: BoxFit.cover,
                                      height: 120,
                                      width: 120,
                                    )),
                                  )
                            : CircleAvatar(
                                backgroundColor: kBasicColor,
                                radius: 60,
                                child: ClipOval(
                                    child: //Container(),
                                        Image.network(
                                  myData['img'],
                                  fit: BoxFit.cover,
                                  height: 120,
                                  width: 120,
                                )),
                              ),
                        Positioned(
                          bottom: 0.0,
                          right: -2.0,
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: ((builder) => bottomSheet()));
                            },
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              color: kBasicColor,
                              size: 28.0,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ReusableTextField(
                      text: username,
                      isEnabled: true,
                      onChangedFunc: (value) {
                        setState(() {
                          username = value;
                        });
                      },
                      validationFunc: (String value) {},
                      onTapFunction: (){},
                    ),
                    ReusableTextField(
                      text: country,
                      isEnabled: false,
                      onChangedFunc: (value) {
                        setState(() {
                          country = value;
                        });
                      },
                      validationFunc: (String value) {},
                      onTapFunction: (cnt,cod){
                        setState(() {
                          country=cnt;
                          phoneCode=cod;
                        });
                      },
                    ),
                    ReusableTextField(
                      text: phone,
                      isEnabled: true,
                      onChangedFunc: (value) {
                        setState(() {
                          phone = value;
                        });
                      },
                      validationFunc: (String value) {
                        if(phone.length!=10 && phone.isNotEmpty && phone!=myData['mobile']){
                          return  AppLocalizations.of(context)!.phone10Digits;
                        }
                      },
                      onTapFunction: (){},
                    ),
                    ReusableTextField(
                      text: bio,
                      isEnabled: true,
                      onChangedFunc: (value) {
                        setState(() {
                          bio = value;
                        });
                      },
                      validationFunc: (String value) {},
                      onTapFunction: (){},
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            '  ${AppLocalizations.of(context)!.accept_challenges}'),
                        Switch(
                          activeColor: kBasicColor,
                          activeTrackColor: kBasicColor.withOpacity(0.5),
                          inactiveThumbColor: Colors.grey,
                          inactiveTrackColor: Colors.grey.withOpacity(0.5),
                          value: _accept,
                          onChanged: (bool value) {
                            setState(() {
                              _accept = value;
                              if (value == false) {
                                _adult = value;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            '  ${AppLocalizations.of(context)!.accept_adult_challenges}'),
                        Switch(
                          activeColor: kBasicColor,
                          activeTrackColor: kBasicColor.withOpacity(0.5),
                          inactiveThumbColor: Colors.grey,
                          inactiveTrackColor: Colors.grey.withOpacity(0.5),
                          value: _adult,
                          onChanged: (bool value) {
                            setState(() {
                              _adult = value;
                              if (value == true) {
                                _accept = value;
                              }
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.32,
                  child: ReusableGradientButton(
                    onPressButton: () {
                      Navigator.of(context).pop();
                    },
                    text: AppLocalizations.of(context)!.cancel,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.32,
                  child: ReusableGradientButton(
                    onPressButton: () async {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const Dialog(
                            backgroundColor: Colors.transparent,
                            child: Center(child: CircularProgressIndicator()),
                          );
                        },
                      );
                      final Locale locale = Localizations.localeOf(context);
                      if(_imageFile!=null){
                        uploadImage(_imageFile!);
                      }
                      if(formKey.currentState!.validate()){
                        int acceptAsNumber = _accept ? 1 : 0;
                        int adultAsNumber = _adult ? 1 : 0;
                        String mobile = phone == ''
                            ? ''
                            : phone.startsWith('+$phoneCode')
                                ? phone
                                : '+$phoneCode ${phone.substring(1)}';
                        var result = await updateUserInfo(username, country,
                            mobile, bio, acceptAsNumber, adultAsNumber,locale.languageCode);
                        if (result['msg'] == 'success') {
                          await saveUserIdLocally(result['id']);
                          myData = await getMyData();
                          //thisPageIndex = 3;
                          // ignore: use_build_context_synchronously
                          alert(
                              context,
                              // ignore: use_build_context_synchronously
                              AppLocalizations.of(context)!
                                  .updated_successfully);
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(context, '/profile');
                        } else {
                          // ignore: use_build_context_synchronously
                          alert(
                              context,
                              // ignore: use_build_context_synchronously
                              AppLocalizations.of(context)!
                                  .updated_successfully);
                        }
                      }
                    },
                    text: AppLocalizations.of(context)!.save,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
