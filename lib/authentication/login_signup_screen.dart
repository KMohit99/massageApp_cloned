import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massage_app/authentication/signin_screen.dart';
import 'package:massage_app/authentication/therapist/therapist_signup.dart';
import 'package:massage_app/common_utils/AssetUtils.dart';

import '../common_utils/Colorconstant.dart';
import '../common_utils/common_button.dart';
import 'customer/customer_signup.dart';

class LoginSignUpScreen extends StatefulWidget {
  //customer = 0,
  //Therapist = 1
  final int number;

  const LoginSignUpScreen({Key? key, required this.number}) : super(key: key);

  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
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
                image: AssetImage(AssetUtils.loginScreenIMG),
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
                      (widget.number== 0 ? Get.to(Customer_Singup()) : Get.to(
                          TherapistSignup()));
                    },
                    label: 'Sign Up',
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
                      Get.to(SignInScreen());
                    },
                    label: 'Sign In',
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
