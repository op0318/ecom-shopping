import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final int maxLines;
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintext,
      this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintext,
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintext';
        }
        return null;
      }, //With this validator we can validate and any eroors is thrown,it will be called by the Form
    );
  }
}
