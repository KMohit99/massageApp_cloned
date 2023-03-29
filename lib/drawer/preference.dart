import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:massage_app/common_utils/Colorconstant.dart';

import '../common_utils/FontUtils.dart';
import '../common_utils/Txtutils.dart';

class PreferenceScreen extends StatefulWidget {
  const PreferenceScreen({Key? key}) : super(key: key);

  @override
  State<PreferenceScreen> createState() => _PreferenceScreenState();
}

class _PreferenceScreenState extends State<PreferenceScreen> {
  double _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          // backgroundColor: Colors.bla,
          // Text(
          //   (widget.page == 0
          //       ? 'Dashboard'
          //       : (widget.page == 1
          //           ? "Discover"
          //           : (widget.page == 2 ? "News Feed" : ''))),
          //   style: const TextStyle(
          //       fontSize: 16, color: Colors.white, fontFamily: 'PB'),
          // ),
          leading: Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
              visualDensity: VisualDensity(vertical: -4, horizontal: -4),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          title: Text("Select Preference",
              style: FontStyleUtility.h20(
                  fontColor: Colors.white,
                  family: 'LR',
                  fontWeight: FWT.regular)),
          centerTitle: true,
          // leadingWidth: 100,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Radius(KM)',
                    style: FontStyleUtility.h16(
                        fontColor: Colors.white,
                        family: "LR",
                        fontWeight: FWT.regular),
                  ),
                  Theme(
                    data: ThemeData(
                      visualDensity: VisualDensity(horizontal: -4,vertical: -4),
                        sliderTheme: const SliderThemeData(
                          trackHeight: 1,
                      showValueIndicator: ShowValueIndicator.always,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 8.0),
                      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                      valueIndicatorColor: Colors.redAccent,
                      valueIndicatorTextStyle:
                          TextStyle(color: Colors.white, fontFamily: 'PR'),
                    )),
                    child: Slider(
                      min: 1.0,
                      max: 15.0,
                      activeColor: ColorConstant.buttoncolor,
                      inactiveColor: Colors.white,
                      thumbColor: ColorConstant.buttoncolor,
                      label: '${_value.round()}',
                      value: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                        print("final_ammount ${_value}");
                      },
                    ),
                  )
                ],
              ),
              Text(
                'Service Type',
                style: FontStyleUtility.h16(
                    fontColor: Colors.white,
                    family: "LR",
                    fontWeight: FWT.regular),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
