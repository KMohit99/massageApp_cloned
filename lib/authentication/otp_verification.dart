import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pin_put/pin_put.dart';

import '../common_utils/AssetUtils.dart';
import '../common_utils/Colorconstant.dart';
import '../common_utils/FontUtils.dart';
import '../common_utils/common_button.dart';
import 'confirm_otp.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({Key? key}) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pinOTPController = TextEditingController();
  final FocusNode _pinOTPFocus = FocusNode();
  String? varification;

  final BoxDecoration pinOTPDecoration = BoxDecoration(
    boxShadow: const [
      BoxShadow(
        color: Colors.black,
        blurRadius: 10,
        offset: Offset(0, 0),
        spreadRadius: -8,
      ),
    ],
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
  );
  final BoxDecoration pinOTPDecoration2 = BoxDecoration(
      boxShadow: const [
        BoxShadow(
          color: Colors.black,
          blurRadius: 10,
          offset: Offset(0, 0),
          spreadRadius: -8,
        ),
      ],
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: Colors.transparent,
      ));

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
              image: AssetImage(AssetUtils.loginScreenIMG),
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
                                'Mobile Verification',
                                style: FontStyleUtility.h25(
                                    fontColor: ColorConstant.whitecolor,
                                    family: 'LR',
                                    fontWeight: FWT.regular),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              child: Text(
                                'Please Enter OTP here',
                                style: FontStyleUtility.h20(
                                    fontColor: ColorConstant.whitecolor,
                                    family: 'LR',
                                    fontWeight: FWT.regular),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20),

                              child: PinPut(
                                fieldsCount: 6,
                                textStyle: TextStyle(
                                    fontFamily: 'PR',
                                    fontSize: 18,
                                    color: Colors.black),
                                eachFieldHeight: 40,
                                eachFieldWidth: 40,
                                eachFieldMargin:
                                    EdgeInsets.symmetric(horizontal: 1),
                                focusNode: _pinOTPFocus,
                                controller: _pinOTPController,
                                submittedFieldDecoration: pinOTPDecoration,
                                selectedFieldDecoration: pinOTPDecoration,
                                followingFieldDecoration: pinOTPDecoration2,
                                pinAnimationType: PinAnimationType.rotation,
                              ),
                            ),
                            Container(

                              child: Text(
                                'Resend',
                                style: FontStyleUtility.h20(
                                    fontColor: ColorConstant.whitecolor,
                                    family: 'LR',
                                    fontWeight: FWT.regular),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height/10,
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: CommonButton(
                          ontap: () {
                            Get.to(ConfrimVerification());
                          },
                          label: 'Verify',
                          back_color: ColorConstant.buttoncolor,
                          text_color: ColorConstant.whitecolor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
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
