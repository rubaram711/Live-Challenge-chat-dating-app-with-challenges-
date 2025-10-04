import 'package:flutter/material.dart';

import '../../Widgets/reusable_button.dart';
import '../../consts/colors.dart';

class AppIntroducingCore extends StatelessWidget {
  const AppIntroducingCore({super.key});

  static const kIcons = <Icon>[
    Icon(Icons.event),
    Icon(Icons.home),
    Icon(Icons.android),
    Icon(Icons.alarm),
    Icon(Icons.face),
    Icon(Icons.language),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: kIcons.length,
        // Use a Builder here, otherwise DefaultTabController.of(context) below
        // returns null.
        child: Builder(
          builder: (BuildContext context) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 25),
            child: Column(
              children: <Widget>[
                const TabPageSelector(selectedColor: kBasicColor ),
                Expanded(
                  child: IconTheme(
                    data: IconThemeData(
                      size: 128.0,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: const TabBarView(children: kIcons),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.3,
                  child: ReusableGradientButton(text: 'NEXT',onPressButton:() {
                    final TabController controller =
                    DefaultTabController.of(context)!;
                    if (!controller.indexIsChanging) {
                     if (controller.index==kIcons.length-1){
                       Navigator.pushNamed(context, '/home');
                     }
                     else{
                       controller.index++;
                     }
                     // controller.animateTo(kIcons.length - 1);
                    }
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}