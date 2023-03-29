import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_utils/Colorconstant.dart';
import '../common_utils/common_button.dart';
import 'login_signup_screen.dart';

class FrontPageScreen extends StatefulWidget {
  const FrontPageScreen({Key? key}) : super(key: key);

  @override
  State<FrontPageScreen> createState() => _FrontPageScreenState();
}

class _FrontPageScreenState extends State<FrontPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            // height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/frontpagescreen.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 150,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  child: CommonButton(
                    ontap: (){
                      Get.to(LoginSignUpScreen(number: 0,));
                    },
                    label: 'Sign Up as Customer',
                    back_color: ColorConstant.buttoncolor,
                    text_color: ColorConstant.whitecolor,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: CommonButton(
                    ontap: (){
                      Get.to(LoginSignUpScreen(number: 1,));

                    },
                    label: 'Sign Up as Therapist',
                    text_color: ColorConstant.blackText,
                    back_color: ColorConstant.whitecolor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
