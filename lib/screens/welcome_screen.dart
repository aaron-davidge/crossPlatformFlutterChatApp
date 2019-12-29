import 'dart:ffi';

import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/rounded_button.dart';

import 'registration_screen.dart';


class WelcomeScreen extends StatefulWidget {

  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller =  AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    animation = ColorTween(begin: Colors.black, end: Colors.white).animate(controller);

    controller.reverse(from: 1.0);

    controller.addListener(() {
      setState(() {

      });
    });
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 200.0,
                  ),
                ),
              TypewriterAnimatedTextKit(
               text: [
                  "CHESS CHAT",
                  "Sign-in",
                  "Register",
                    ],
                textStyle: TextStyle(
                    fontSize: 30.0,
                    fontFamily: "Agne",
                    color: Colors.red

            ),
            textAlign: TextAlign.center,
            alignment: AlignmentDirectional.center // or Alignment.topLeft
        ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                title: 'Login',
                color: Colors.red,
                onPressed: () {
              Navigator.pushNamed(context, LoginScreen.id);
            }),
            RoundedButton(
                title: 'Register',
                color: Colors.red,
                onPressed: () {
              Navigator.pushNamed(context, RegistrationScreen.id);
          }),
          ],
        ),
      ),
    );
  }
}

