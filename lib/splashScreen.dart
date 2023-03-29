
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'authentication/front_page.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState(){
    setState(() {
      // SystemChannels.textInput.invokeMethod('TextInput.hide');

      Timer(
          Duration(seconds: 5),
              () =>
          //     Navigator.of(context).pushReplacement(MaterialPageRoute(
          // builder: (BuildContext context) => Loginscreen())
          // )
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => FrontPageScreen()))
      );
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      body:   Container(
        constraints: BoxConstraints.expand(),
        // height: 200,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Splashscreenbackground.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
