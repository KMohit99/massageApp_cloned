import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massage_app/common_utils/Colorconstant.dart';
import 'package:massage_app/drawer/preference.dart';

import '../common_utils/AssetUtils.dart';
import '../common_utils/FontUtils.dart';
import '../common_utils/Txtutils.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned(
          bottom: 10,
          child: Image.asset(
            AssetUtils.wave,
            // color: Colors.white,
            // height: 50.0,
            width: screenSize.width,
            fit: BoxFit.contain,
          ),
        ),
        Scaffold(
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
              title: Container(
                // margin:
                // const EdgeInsets.only(left: 18, top: 0, bottom: 0),
                child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Image.asset(
                      AssetUtils.logo_fem,
                      color: Colors.white,
                      height: 50.0,
                      width: 50.0,
                      fit: BoxFit.contain,
                    )),
              ),
              centerTitle: false,
              actions: [
                Row(
                  children: [
                    InkWell(
                      onTap: () async {},
                      child: Padding(
                          padding: const EdgeInsets.only(
                              right: 0.0, top: 0.0, bottom: 5.0),
                          child: Icon(
                            Icons.mode_edit_outline_outlined,
                            color: Colors.white,
                          )),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "Edit",
                          style: FontStyleUtility.h16(
                              fontColor: Colors.white,
                              family: 'LR',
                              fontWeight: FWT.regular),
                        ),
                      ),
                    ),
                  ],
                )
              ],
              // leadingWidth: 100,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            AssetUtils.user_image,
                            height: screenSize.height / 5,
                            // width: screenSize.width/3,
                            // width: 150,
                            // color: Colors.black,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorConstant.lightPink,
                                borderRadius: BorderRadius.circular(100)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    // margin: EdgeInsets.only(left: 15),
                    alignment: Alignment.center,
                    child: Text(TxtUtils.user,
                        style: FontStyleUtility.h20(
                            fontColor: Colors.white,
                            family: 'LR',
                            fontWeight: FWT.regular)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () {},
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                        visualDensity:
                        const VisualDensity(vertical: 0.0, horizontal: -4.0),
                        leading: SizedBox(
                          height: 15.0,
                          width: 15.0,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          "Upload Images",
                          style: FontStyleUtility.h18(
                              fontColor: Colors.white,
                              family: 'LR',
                              fontWeight: FWT.regular),
                        ),
                      )),
                  InkWell(
                      onTap: () {},
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                        visualDensity:
                        const VisualDensity(vertical: 0.0, horizontal: -4.0),
                        leading: SizedBox(
                          height: 15.0,
                          width: 15.0,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          "User Name ",
                          style: FontStyleUtility.h18(
                              fontColor: Colors.white,
                              family: 'LR',
                              fontWeight: FWT.regular),
                        ),
                      )),
                  InkWell(
                      onTap: () {
                        Get.to(PreferenceScreen());
                      },
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                        visualDensity:
                        const VisualDensity(vertical: 0.0, horizontal: -4.0),
                        leading: SizedBox(
                          height: 15.0,
                          width: 15.0,
                          child: Icon(
                            Icons.check_circle_outline,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          "Select Preference",
                          style: FontStyleUtility.h18(
                              fontColor: Colors.white,
                              family: 'LR',
                              fontWeight: FWT.regular),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
