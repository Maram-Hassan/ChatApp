import 'package:chat_app/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/button.dart';
import '../widgets/textformfield.dart';
class register extends StatelessWidget {
   register();
  static String id="register";
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Image(image: AssetImage("assets/images/scholar.png")),
              Text("SCHOLAR Chat",style: TextStyle(fontSize: 30),),
              SizedBox(height: 50,),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Register",style: TextStyle(fontSize: 20),),
                ],
              ),
              SizedBox(height: 10,),
              textformfield(
                hinttext: "email",
                type: TextInputType.emailAddress,
                onchange: (data) {
                  email = data;
                },
                msg: "email mustn't be empty",
              ),
              SizedBox(height: 10,),
              textformfield(
                hinttext: "password",
                type: TextInputType.visiblePassword,
                msg: "password mustn't be empty",
                onchange: (data) {
                  password = data;
                },
                obscureText: true,
              ),
              SizedBox(height: 10,),
              button(text: "register",
                  function:() async {
                    var auth = FirebaseAuth.instance;
                    UserCredential user=await  auth.createUserWithEmailAndPassword(
                        email: email!, password: password!);
                    print(user.user!.email);
                  }),
              Container(decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text("Register")),
                height: 40,
                width: double.infinity,),
              Row(
                children: [
                  Text("already have an account"),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context,login.id);
                    },
                      child: Text("Login"))
                ],)
            ],
          ),
        ),
      ),
    );
  }
}
