import 'package:flutter/material.dart';
import 'package:untitled6/Widgets/reusable_button.dart';

import '../Consts/deposit_options_list.dart';
import '../Widgets/reusable_deposited_points_card.dart';
import '../Widgets/reusable_text_field.dart';
import '../l10n/app_localizations.dart';

class DepositDialog extends StatefulWidget {
  const DepositDialog({Key? key,this.radius=20 }) : super(key: key);
  final double radius;
  @override
  State<DepositDialog> createState() => _DepositDialogState();
}

class _DepositDialogState extends State<DepositDialog> {
  String amount='';
  @override
  Widget build(BuildContext context) {
    String p=AppLocalizations.of(context)!.point;
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.radius)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 20),
        height: MediaQuery.of(context).size.height * 0.65,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              AppLocalizations.of(context)!.deposited_amount,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ReusableDepositedPointsCard(
              isClicked: depositOptionsList[0]['isClicked'],
              onTapFunction: (){
                setState(() {
                  depositOptionsList[0]['isClicked']=true;
                  depositOptionsList[1]['isClicked']=false;
                  depositOptionsList[2]['isClicked']=false;
                  depositOptionsList[3]['isClicked']=false;
                  depositOptionsList[4]['isClicked']=false;
                  amount='${depositOptionsList[0]['points']}';
                });
              },
              text: '${depositOptionsList[0]['points']} $p = ${depositOptionsList[0]['points']} \$',
            ),
            ReusableDepositedPointsCard(
              isClicked: depositOptionsList[1]['isClicked'],
              onTapFunction: (){
                setState(() {
                  depositOptionsList[1]['isClicked']=true;
                  depositOptionsList[0]['isClicked']=false;
                  depositOptionsList[2]['isClicked']=false;
                  depositOptionsList[3]['isClicked']=false;
                  depositOptionsList[4]['isClicked']=false;
                  amount='${depositOptionsList[1]['points']}';
                });
              },
              text: '${depositOptionsList[1]['points']} $p = ${depositOptionsList[1]['points']} \$',
            ),
            ReusableDepositedPointsCard(
              isClicked: depositOptionsList[2]['isClicked'],
              onTapFunction: (){
                setState(() {
                  depositOptionsList[2]['isClicked']=true;
                  depositOptionsList[1]['isClicked']=false;
                  depositOptionsList[0]['isClicked']=false;
                  depositOptionsList[3]['isClicked']=false;
                  depositOptionsList[4]['isClicked']=false;
                  amount='${depositOptionsList[2]['points']}';
                });
              },
              text: '${depositOptionsList[2]['points']} $p = ${depositOptionsList[2]['points']} \$',
            ),
            ReusableDepositedPointsCard(
              isClicked: depositOptionsList[3]['isClicked'],
              onTapFunction: (){
                setState(() {
                  depositOptionsList[3]['isClicked']=true;
                  depositOptionsList[1]['isClicked']=false;
                  depositOptionsList[2]['isClicked']=false;
                  depositOptionsList[0]['isClicked']=false;
                  depositOptionsList[4]['isClicked']=false;
                  amount='${depositOptionsList[3]['points']}';
                });
              },
              text: '${depositOptionsList[3]['points']} $p = ${depositOptionsList[3]['points']} \$',
            ),
            ReusableDepositedPointsCard(
              isClicked: depositOptionsList[4]['isClicked'],
              onTapFunction: (){
                setState(() {
                  depositOptionsList[4]['isClicked']=true;
                  depositOptionsList[1]['isClicked']=false;
                  depositOptionsList[2]['isClicked']=false;
                  depositOptionsList[0]['isClicked']=false;
                  depositOptionsList[3]['isClicked']=false;
                  amount='${depositOptionsList[4]['points']}';
                });
              },
              text: '${depositOptionsList[3]['points']} $p = ${depositOptionsList[3]['points']} \$',
            ),
            ReusableTextField(
              text: AppLocalizations.of(context)!.otherwise,
              isEnabled: true,
              onChangedFunc: (value) {
                setState(() {
                  amount = value;
                });
              },
              validationFunc: (String value) {},
              onTapFunction: (){},
            ),
            const SizedBox(
              height: 20,
            ),
            ReusableGradientButton(text: AppLocalizations.of(context)!.deposit, onPressButton: (){})
          ],
        ),
      ),
    );
  }
}
