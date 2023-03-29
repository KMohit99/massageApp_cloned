import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:massage_app/common_utils/Colorconstant.dart';
import 'package:massage_app/common_utils/FontUtils.dart';
import 'package:massage_app/common_utils/Txtutils.dart';
import 'package:massage_app/drawer/my_profile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../common_utils/AssetUtils.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width / 1.35,
      margin: const EdgeInsets.only(top: 0, left: 0, bottom: 0),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(100), bottomRight: Radius.circular(100)),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.white),
              child: Drawer(
                // backgroundColor: Colors.grey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        // color: Colors.red,
                        height: screenSize.height / 7,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: screenSize.height / 7,
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(left: 20, top: 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  AssetUtils.user_image,
                                  // height: screenSize.height/5,
                                  // width: screenSize.width/3,
                                  // width: 150,
                                  // color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              alignment: Alignment.centerLeft,
                              // color: Colors.white,
                              child: Text(TxtUtils.user,
                                  style: FontStyleUtility.h20(
                                      fontColor: Colors.black,
                                      family: 'LR',
                                      fontWeight: FWT.regular)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      drawerItem(
                        itemIcon: Icons.person,
                        itemName: TxtUtils.my_profile,
                        onTap: () {
                          Get.to(MyProfileScreen());
                          // gotoSalesListScreen(context);
                        },
                      ),
                      drawerItem(
                        itemIcon: Icons.calendar_month,
                        itemName: TxtUtils.bookings,
                        onTap: () {
                          Navigator.pop(context);
                          // gotoSalesListScreen(context);
                        },
                      ),
                      drawerItem(
                        itemIcon: Icons.settings,
                        itemName: TxtUtils.settings,
                        onTap: () {
                          Navigator.pop(context);
                          // gotoSalesListScreen(context);
                        },
                      ),
                      drawerItem(
                        itemIcon: Icons.currency_exchange,
                        itemName: TxtUtils.payment,
                        onTap: () {
                          Navigator.pop(context);
                          // gotoSalesListScreen(context);
                        },
                      ),
                      drawerItem(
                        itemIcon: Icons.error_outline,
                        itemName: TxtUtils.about,
                        onTap: () {
                          Navigator.pop(context);
                          // gotoSalesListScreen(context);
                        },
                      ),
                      drawerItem(
                        itemIcon: Icons.logout,
                        itemName: TxtUtils.logout,
                        onTap: () {
                          Navigator.pop(context);
                          // gotoSalesListScreen(context);
                        },
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }

  InkWell drawerItem({
    required IconData itemIcon,
    required String itemName,
    Color? text_color,
    void Function()? onTap,
  }) {
    return InkWell(
        onTap: onTap!,
        child: ListTile(
          contentPadding: const EdgeInsets.only(
              left: 40.0, right: 0.0, top: 0.0, bottom: 0.0),
          visualDensity: const VisualDensity(vertical: 0.0, horizontal: 0.0),
          leading: SizedBox(
            height: 15.0,
            width: 15.0,
            child: Icon(
              itemIcon,
              color: Colors.black,
            ),
          ),
          title: Text(
            itemName.toString(),
            style: FontStyleUtility.h18(
                fontColor: Colors.black, family: 'LR', fontWeight: FWT.regular),
          ),
        ));
  }
}
