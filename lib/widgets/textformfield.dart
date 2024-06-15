
import 'package:flutter/material.dart';
class textformfield extends StatelessWidget {
   textformfield({required this.msg,required this.hinttext,required this.type,required this.onchange,this.obscureText =false});
String hinttext;
   String msg;
TextInputType type;
   Function onchange;
   bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:(value) {
        if(value!.isEmpty){
          return msg;
        }
        return null;
      },
      controller: TextEditingController(),
      obscureText: obscureText,
      onChanged: onchange(),
      keyboardType: type,
      decoration: InputDecoration(
        hintText: hinttext,
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        ));
  }
}
