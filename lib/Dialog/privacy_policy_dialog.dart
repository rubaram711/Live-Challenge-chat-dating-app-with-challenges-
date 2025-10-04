import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Widgets/reusable_button.dart';
import '../l10n/app_localizations.dart';

class PrivacyPolicyDialog extends StatelessWidget {
  const PrivacyPolicyDialog({Key? key,  this.radius=20 , required this.mdFileName
  }): super(key: key);
final double radius;
final String mdFileName;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding:const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
        height: MediaQuery.of(context).size.height*0.55,
        child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: Future.delayed(const Duration(milliseconds: 2)).then((value) {
                return rootBundle.loadString('assets/$mdFileName');
              }),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return Markdown(
                    data: snapshot.data!,
                  );
                }
                return const Center(child: CircularProgressIndicator(),);
              },
            )
          ),
         const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*0.32,
                child: ReusableGradientButton(onPressButton: (){
                  SystemNavigator.pop();
                },text: AppLocalizations.of(context)!.disagree,),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.32,
                child: ReusableGradientButton(onPressButton: (){
                  SharedPreferences.getInstance().then((prefs) { prefs.setInt("dialog_open", 1);
                  Navigator.of(context).pop();});
                },text: AppLocalizations.of(context)!.agree,),
              ),
            ],
          )
        ],
        ),
      ),
    );
  }
}
