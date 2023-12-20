import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  const CustomTextField({Key? key,required this.controller,required this.hintext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
    decoration: InputDecoration(
      hintText: hintext,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black)
      ),
      enabledBorder:OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black)
    )
    ),
      validator: (val){

      },//With this validator we can validate and any eroors is thrown,it will be called by the Form

    );
  }
}
