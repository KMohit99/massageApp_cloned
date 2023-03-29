import 'dart:ui';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:massage_app/common_utils/FontUtils.dart';
import 'package:massage_app/common_utils/common_drop.dart';
import 'package:massage_app/common_utils/common_textfeild.dart';

import '../../common_utils/AssetUtils.dart';
import '../../common_utils/Colorconstant.dart';
import '../../common_utils/common_button.dart';
import '../otp_verification.dart';
import 'package:intl/intl.dart';

class TherapistSignup extends StatefulWidget {
  const TherapistSignup({Key? key}) : super(key: key);

  @override
  State<TherapistSignup> createState() => _TherapistSignupState();
}

class _TherapistSignupState extends State<TherapistSignup> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _sexController = TextEditingController();
  TextEditingController _dobController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final List<String> items = [
    'Massage',
    'Massage',
  ];
  String? selectedValue;

  bool _passwordVisible = false;

  selectDoB(BuildContext context) async {
    DateTime? selected;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        double width = MediaQuery.of(context).size.width;
        double height = MediaQuery.of(context).size.height;
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
          child: AlertDialog(
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              elevation: 0.0,
              // title: Center(child: Text("Evaluation our APP")),
              content: StatefulBuilder(
                builder: (context, setModalState) {
                  return Container(
                    decoration: BoxDecoration(
                        // color: Colors.black.withOpacity(0.65),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          // stops: [0.1, 0.5, 0.7, 0.9],
                          colors: [
                            HexColor("#020204").withOpacity(1),
                            HexColor("#36393E").withOpacity(1),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: HexColor('#04060F'),
                              offset: const Offset(-10, 10),
                              blurRadius: 20)
                        ],
                        borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              HexColor("#000000").withOpacity(1),
                              HexColor("#04060F").withOpacity(1),
                              HexColor("#000000").withOpacity(1),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: HexColor('#04060F'),
                                offset: Offset(3, 3),
                                blurRadius: 10)
                          ]),
                      child: Stack(
                        children: [
                          CupertinoTheme(
                            data: CupertinoThemeData(
                              brightness: Brightness.dark,
                              textTheme: CupertinoTextThemeData(
                                  dateTimePickerTextStyle: FontStyleUtility.h16(
                                      fontColor: Colors.white,
                                      family: 'PM',
                                      fontWeight: FWT.regular)),
                            ),
                            child: DefaultTextStyle.merge(
                              style: TextStyle(fontSize: 20),
                              child: CupertinoDatePicker(
                                // use24hFormat: true,
                                mode: CupertinoDatePickerMode.date,
                                onDateTimeChanged: (DateTime value) {
                                  selected = value;
                                  print("${value.hour}:${value.minute}");

                                  if (selected != null) {
                                    final now = DateTime.now();
                                    setModalState(() {
                                      _dobController.text =
                                          DateFormat('MM-dd-yyyy')
                                              .format(selected!)
                                              .toString();
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )),
        );
      },
    );
  }

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
              image: AssetImage(AssetUtils.therapistSignUpIMG),
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
                      child: Container(
                        height: 400,
                        child: SingleChildScrollView(
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
                                labelname: 'Name',
                                hintname: 'Type your name',
                                controller: _nameController,
                                readonly: false,
                              ),
                              SizedBox(
                                height: 15,
                              ),

                              CommonTextfeild(
                                  labelname: 'Sex',
                                  hintname: 'Female',
                                  readonly: false,
                                  controller: _sexController),

                              SizedBox(
                                height: 15,
                              ),
                              CommonTextfeild(
                                  labelname: 'Email',
                                  hintname: 'Type your mail id',
                                  readonly: false,
                                  controller: _emailController),
                              SizedBox(
                                height: 15,
                              ),
                              CommonTextfeild(
                                  labelname: 'Phone no.',
                                  readonly: false,
                                  hintname: 'Type your Contact no.',
                                  controller: _sexController),
                              SizedBox(
                                height: 15,
                              ),
                              CommonTextfeild(
                                  ontap: () {
                                    selectDoB(context);
                                  },
                                  readonly: true,
                                  labelname: 'Date of Birth',
                                  hintname: 'Select date',
                                  controller: _dobController),
                              SizedBox(
                                height: 15,
                              ),
                              CommonTextfeild(
                                  labelname: 'Zip Code',
                                  hintname: '380006',
                                  readonly: false,
                                  controller: _sexController),
                              SizedBox(
                                height: 15,
                              ),
                              CommonTextfeild(
                                  labelname: 'Password',
                                  readonly: false,
                                  hintname: 'Create Password',
                                  controller: _sexController),

                              SizedBox(
                                height: 15,
                              ),
                              CommonDropDown(
                                items: items,
                                selectedValue: selectedValue,
                                labelname: 'I am here for',
                                hintname: 'Select',
                              ),

                              SizedBox(
                                height: 15,
                              ),
                              CommonDropDown(
                                items: items,
                                selectedValue: selectedValue,
                                labelname: 'Height',
                                hintname: 'Select',
                              ),

                              SizedBox(
                                height: 15,
                              ),
                              CommonDropDown(
                                items: items,
                                selectedValue: selectedValue,
                                labelname: 'Weight',
                                hintname: 'Select',
                              ),

                              SizedBox(
                                height: 15,
                              ),
                              CommonDropDown(
                                items: items,
                                selectedValue: selectedValue,
                                labelname: 'Body Type',
                                hintname: 'Select',
                              ),

                              SizedBox(
                                height: 15,
                              ),
                              CommonDropDown(
                                items: items,
                                selectedValue: selectedValue,
                                labelname: 'Education',
                                hintname: 'Select',
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              CommonDropDown(
                                items: items,
                                selectedValue: selectedValue,
                                labelname: 'Do yo smoke?',
                                hintname: 'Select',
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              CommonDropDown(
                                items: items,
                                selectedValue: selectedValue,
                                labelname: 'Do yo Drink?',
                                hintname: 'Select',
                              ),


                              SizedBox(
                                height: MediaQuery.of(context).size.height / 10,
                              )
                            ],
                          ),
                        ),
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
      ],
    );
  }
}
