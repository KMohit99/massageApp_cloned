import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:massage_app/common_utils/AssetUtils.dart';
import 'package:massage_app/common_utils/FontUtils.dart';
import 'package:massage_app/common_utils/common_textfeild.dart';

import '../../common_utils/Colorconstant.dart';
import '../../common_utils/common_button.dart';
import '../otp_verification.dart';

class Customer_Singup extends StatefulWidget {
  const Customer_Singup({Key? key}) : super(key: key);

  @override
  State<Customer_Singup> createState() => _Customer_SingupState();
}

class _Customer_SingupState extends State<Customer_Singup> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _mobilenumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          constraints: BoxConstraints.expand(),
          // height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetUtils.customerSignUpIMG),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          key: _formKey,
          backgroundColor: Colors.transparent,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                color: Colors.black.withOpacity(0.4),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          visualDensity:
                              VisualDensity(vertical: -4, horizontal: -4),
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'Create An Account',
                                style: FontStyleUtility.h25(
                                    fontColor: ColorConstant.whitecolor,
                                    family: 'LR',
                                    fontWeight: FWT.regular),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                'Already have an account?',
                                style: FontStyleUtility.h16(
                                    fontColor: ColorConstant.whitecolor,
                                    family: 'LR',
                                    fontWeight: FWT.regular),
                              ),
                            ),
                            SizedBox(
                              height: 48,
                            ),
                            // Text(
                            //   "Email Address",
                            //   style: TextStyle(
                            //     color: ColorConstant.whiteiconcolor,
                            //     fontSize: 18,
                            //     fontFamily: 'Lato Regular',
                            //   ),
                            // ),
                            // Transform.translate(
                            //   offset: Offset(0, -10),
                            //   child: TextFormField(
                            //     validator: (value) {
                            //       if (value == null ||
                            //           value.isEmpty ||
                            //           !value.contains('@') ||
                            //           !value.contains('.')) {
                            //         return 'Please Enter Your Email';
                            //       }
                            //       return null;
                            //     },
                            //     controller: _emailController,
                            //     keyboardType: TextInputType.emailAddress,
                            //     style: TextStyle(color: ColorConstant.whiteiconcolor),
                            //     decoration: InputDecoration(
                            //       // isDense: true,
                            //       errorStyle: const TextStyle(fontSize: 0.01),
                            //       fillColor: Colors.white,
                            //       hintText: "Type your email",
                            //       contentPadding: EdgeInsets.only(top: 20),
                            //
                            //       hintStyle: TextStyle(
                            //         color: ColorConstant.whiteiconcolor,
                            //         fontSize: 14,
                            //       ),
                            //       enabledBorder: UnderlineInputBorder(
                            //         borderSide: BorderSide(
                            //             color: ColorConstant.whiteiconcolor),
                            //       ),
                            //       focusedBorder: UnderlineInputBorder(
                            //         borderSide: BorderSide(
                            //             color: ColorConstant.whiteiconcolor),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            CommonTextfeild(
                                labelname: 'Email Address',
                                hintname: 'Type your email',
                                controller: _emailController,
                              readonly: false,),
                            SizedBox(
                              height: 15,
                            ),

                            Text(
                              "Password",
                              style: TextStyle(
                                  color: ColorConstant.whiteiconcolor,
                                  fontSize: 18),
                            ),
                            Transform.translate(
                              offset: Offset(0, -10),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Your Email';
                                  }
                                  return null;
                                },
                                style: TextStyle(color: Colors.white),
                                obscureText: _passwordVisible,
                                controller: _passwordController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  errorStyle: const TextStyle(fontSize: 0.01),
                                  contentPadding: EdgeInsets.only(top: 20),
                                  fillColor: Colors.white,
                                  hintText: "Create Password",
                                  hintStyle: TextStyle(
                                      color: ColorConstant.whiteiconcolor,
                                      fontSize: 14),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorConstant.whiteiconcolor),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorConstant.whiteiconcolor),
                                  ),
                                  suffixIcon: IconButton(
                                    padding: EdgeInsets.only(top: 15),
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      _passwordVisible
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: ColorConstant.whiteiconcolor,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Mobile Number",
                              style: TextStyle(
                                  color: ColorConstant.whiteiconcolor,
                                  fontSize: 18),
                            ),
                            Transform.translate(
                              offset: Offset(0, -10),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Your Email';
                                  }
                                  return null;
                                },
                                inputFormatters: <TextInputFormatter>[
                                  // for below version 2 use this
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]'))
                                ],
                                maxLength: 10,
                                keyboardType: TextInputType.number,
                                controller: _mobilenumberController,
                                style: TextStyle(
                                    color: ColorConstant.whiteiconcolor),
                                decoration: InputDecoration(
                                  errorStyle: const TextStyle(fontSize: 0.01),
                                  contentPadding: EdgeInsets.only(top: 20),
                                  fillColor: Colors.white,
                                  hintText: "Enter Your Contact Number",
                                  hintStyle: TextStyle(
                                      fontFamily: 'Lato Regular',
                                      color: ColorConstant.whiteiconcolor,
                                      fontSize: 14),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorConstant.whiteiconcolor),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorConstant.whiteiconcolor),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 10,
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: CommonButton(
                          ontap: () {
                            Get.to(OtpVerification());
                          },
                          label: 'Continue',
                          back_color: ColorConstant.buttoncolor,
                          text_color: ColorConstant.whitecolor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'By selecting create account , you agree to our Terms and Privacy Policy',
                            style: FontStyleUtility.h16(
                                fontColor: ColorConstant.whitecolor,
                                family: 'LR',
                                fontWeight: FWT.regular),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
