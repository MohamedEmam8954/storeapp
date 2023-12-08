import 'package:flutter/material.dart';

class Customtextformfield extends StatelessWidget {
  Customtextformfield({
    super.key,
    required this.hinttext,
    this.onchanged,
    this.textInputType,
  });

  final String hinttext;
  void Function(String)? onchanged;
  TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      onChanged: onchanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(15),
        hintText: hinttext,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.black),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}
