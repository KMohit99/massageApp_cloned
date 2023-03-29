import 'package:flutter/material.dart';

import '../common_utils/AssetUtils.dart';
import '../common_utils/Colorconstant.dart';
import '../common_utils/FontUtils.dart';

class ConfrimVerification extends StatefulWidget {
  const ConfrimVerification({Key? key}) : super(key: key);

  @override
  State<ConfrimVerification> createState() => _ConfrimVerificationState();
}

class _ConfrimVerificationState extends State<ConfrimVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            // height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetUtils.confirmOtp),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 200),
                  child: Text(
                    'Your Account has been verified!',
                    textAlign: TextAlign.center,
                    style: FontStyleUtility.h40(
                        fontColor: ColorConstant.whitecolor,
                        family: 'LR',
                        fontWeight: FWT.regular),
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
