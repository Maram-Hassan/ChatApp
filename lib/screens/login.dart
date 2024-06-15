import 'package:chat_app/screens/register.dart';
import 'package:chat_app/widgets/button.dart';
import 'package:chat_app/widgets/textformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class login extends StatelessWidget {
  static String id="login";
  var formkey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(height: 50,),
                Image(image: AssetImage("assets/images/scholar.png")),
                Text("SCHOLAR Chat",style: TextStyle(fontSize: 30),),
                SizedBox(height: 50,),
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Sign In",style: TextStyle(fontSize: 20),),
                  ],
                ),
                SizedBox(height: 10,),
                textformfield(hinttext: "email",type:TextInputType.emailAddress,onchange: (){},msg: "email musnt be empty",),
                SizedBox(height: 10,),
                textformfield(hinttext: "password",type:TextInputType.visiblePassword,onchange: (){},obscureText: true,msg: "password musnt be empty",),
                SizedBox(height: 10,),

                Container(decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text("Sign In")),
                  height: 40,
                  width: double.infinity,),
                SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("dont have an account yet?"),
                    GestureDetector(onTap:  () {
                       Navigator.pushNamed(context,register.id);
                    },
                        child: Text("Register now",style: TextStyle(color: Colors.white),))
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
