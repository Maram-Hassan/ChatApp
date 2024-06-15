
import 'package:chat_app/screens/chatpage.dart';
import 'package:chat_app/screens/login.dart';
import 'package:chat_app/screens/register.dart';
import 'package:flutter/cupertino.dart';

Map<String,WidgetBuilder>  routes= {
login.id : (context) => login() ,
  register.id : (context) => register() ,
  chatpage.id : (context) => chatpage() ,

};