import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:massage_app/common_utils/AssetUtils.dart';
import 'package:massage_app/common_utils/FontUtils.dart';
import 'package:massage_app/common_utils/common_textfeild.dart';

import '../../common_utils/Colorconstant.dart';
import '../../common_utils/common_button.dart';
import '../homepage/dashboard.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _mobilenumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool remember = false;

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
                                'Sign In',
                                style: FontStyleUtility.h25(
                                    fontColor: ColorConstant.whitecolor,
                                    family: 'LR',
                                    fontWeight: FWT.regular),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Don't have an Account?",
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
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                        width: 10,
                                        child: Checkbox(
                                          visualDensity: VisualDensity(horizontal: -4,vertical: -4),
                                          activeColor: Colors.white,
                                          checkColor: Colors.red,
                                          value: remember,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              remember = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 5,),
                                      Text(
                                        "Remember me",
                                        style: FontStyleUtility.h16(
                                            fontColor: ColorConstant.whitecolor,
                                            family: 'LR',
                                            fontWeight: FWT.regular),
                                      ),
                                    ],
                                  ),
                                ),
                                 Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Forgot Password?",
                                    style: FontStyleUtility.h16(
                                        fontColor: ColorConstant.whitecolor,
                                        family: 'LR',
                                        fontWeight: FWT.regular),
                                  ),
                                ),

                              ],
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
                            Get.to(DashboardScreen());
                          },
                          label: 'Sign In',
                          back_color: ColorConstant.buttoncolor,
                          text_color: ColorConstant.whitecolor,
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
