import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../Consts/colors.dart';



class ReusableTextField extends StatefulWidget {
  const ReusableTextField({
    super.key,
    required this.onChangedFunc,
    required this.validationFunc,
    required this.text, required this.onTapFunction,
    required this.isEnabled,
  });
  final Function onChangedFunc;
  final Function validationFunc;
  final String text;
final Function onTapFunction;
final bool isEnabled;
  @override
  State<ReusableTextField> createState() => _ReusableTextFieldState();
}

class _ReusableTextFieldState extends State<ReusableTextField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(vertical: 5) ,
      decoration:  const BoxDecoration(
          boxShadow:  [ BoxShadow(
            color: Colors.white,
            blurRadius: 10.0, // You can set this blurRadius as per your requirement
          ),]
      ),
      child: TextFormField(
      //  textDirection: TextDirection.rtl,
        cursorColor: kBasicColor,
        style: const TextStyle(color: Colors.black, fontSize: 14),
        decoration: InputDecoration(
          hintText: widget.text,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.fromLTRB(10, 0, 25, 5),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kBasicColor),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kBasicColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          errorStyle: const TextStyle(
            fontSize: 10.0,
          ),
        ),
        onTap: widget.isEnabled
            ?null
            :(){
          showCountryPicker(
            context: context,
            showPhoneCode: true,
            onSelect: (Country country) {
              widget.onTapFunction(country.displayNameNoCountryCode,country.phoneCode);
              print('Select country: ${country.displayName}');
            },
          );
        },
        // enabled: widget.isEnabled?true:false,
        onChanged: (value) => widget.onChangedFunc(value),
        validator: (value)=>widget.validationFunc(value),
      ),
    );
  }
}



class SearchTextField extends StatelessWidget {
  const SearchTextField(
      {Key? key,
      required this.onChangedFunc,
      required this.onPressSearchIcon,
      required this.text})
      : super(key: key);
  final Function onChangedFunc;
  final Function onPressSearchIcon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      // height: 60,
      child: TextFormField(
      //  textDirection: TextDirection.rtl,
        cursorColor: kBasicColor,
        style: const TextStyle(color: Colors.black, fontSize: 14),
        decoration: InputDecoration(
          hintText: text,
         // labelStyle: TextStyle(fontSize: 15, color: Colors.grey[700]),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: IconButton(
            onPressed: () {
              onPressSearchIcon();
            },
            icon: const Icon(
              Icons.search,
              color: kBasicColor,
              size: 23,
            ),
          ),
          contentPadding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
          border: const OutlineInputBorder(
            // borderSide:BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        onChanged: (value) {
          onChangedFunc(value);
        },
      ),
    );
  }
}
