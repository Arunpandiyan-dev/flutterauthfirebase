import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key, required this.hinttext, required this.obsecureText, required this.controller});
  final TextEditingController controller;
  final String hinttext;
  final bool obsecureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
           gapPadding: 4.0,
           borderRadius: BorderRadius.circular(6.0), 
        ),
        hintText: hinttext ,
        hintStyle: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),
        labelText: hinttext,
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.all(14.0),
      ),
      );
  }
}