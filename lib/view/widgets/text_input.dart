import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';

class TextInputField extends StatelessWidget {
   const TextInputField({
    Key? key,
    required this.controller,
    required this.myIcon,
    required this.myLableText,
    this.toHide = false,
  }) : super(key: key);

  final TextEditingController controller;
  final IconData myIcon;
  final String myLableText;
  final bool toHide;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: toHide,
      controller: controller,
      decoration: InputDecoration(
        icon: Icon(myIcon),
        labelText: myLableText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: borderColor),
        ),
      ),
    );
  }
}
