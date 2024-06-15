import 'package:flutter/material.dart';
class button extends StatelessWidget {
   button({required this.text,required this.function});
  String text;
  VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(text)),
        height: 40,
        width: double.infinity,),
    );
  }
  }
