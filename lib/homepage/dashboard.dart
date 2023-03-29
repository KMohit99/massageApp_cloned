import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:massage_app/common_utils/Colorconstant.dart';
import 'package:massage_app/drawer/drawerScreen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../common_utils/AssetUtils.dart';
import 'homepage_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _page = 0;

  Widget? get getPage {
    if (_page == 0) {
      return HomePageScreen();
    } else if (_page == 1) {
      return const HomePageScreen();
    } else if (_page == 2) {
      return const HomePageScreen();
    } else if (_page == 3) {
      return const HomePageScreen();
    }
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit an App'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              ElevatedButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }
  GlobalKey<ScaffoldState>? _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.transparent,
          // Text(
          //   (widget.page == 0
          //       ? 'Dashboard'
          //       : (widget.page == 1
          //           ? "Discover"
          //           : (widget.page == 2 ? "News Feed" : ''))),
          //   style: const TextStyle(
          //       fontSize: 16, color: Colors.white, fontFamily: 'PB'),
          // ),
          title: Container(
            // margin:
            // const EdgeInsets.only(left: 18, top: 0, bottom: 0),
            child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: (Image.asset(
                  AssetUtils.logo_fem,
                  color: Colors.white,
                  height: 50.0,
                  width: 50.0,
                  fit: BoxFit.contain,
                ))),
          ),
          centerTitle: false,
          actions: [
            Row(
              children: [
                InkWell(
                  onTap: () async {

                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, top: 0.0, bottom: 5.0),
                    child: ClipRRect(
                      child: Image.asset(
                        AssetUtils.map,
                        height: 30.0,
                        width: 30.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {

                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, top: 0.0, bottom: 5.0),
                    child: ClipRRect(
                      child: Image.asset(
                        AssetUtils.notification,
                        height: 30.0,
                        width: 30.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
          // leadingWidth: 100,
          leading: Container(
            margin:
            const EdgeInsets.only(left: 16, top: 0, bottom: 0),
            child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  _globalKey!.currentState!.openDrawer();
                },
                icon: (Image.asset(
                  AssetUtils.drawer,
                  color: Colors.white,
                  height: 40.0,
                  width: 40.0,
                  fit: BoxFit.contain,
                ))),
          ),
        ),
      ),
      drawer: DrawerScreen(),
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: getPage!,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: SafeArea(
          child: SizedBox(
            height: 57,
            child: BottomAppBar(
              color: Colors.black,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                  color: ColorConstant.buttoncolor,
                  // gradient: LinearGradient(
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomCenter,
                  //   // stops: [0.1, 0.5, 0.7, 0.9],
                  //   colors: [
                  //     HexColor("#C12265"),
                  //     HexColor("#000000"),
                  //     HexColor("#000000"),
                  //     // HexColor("#FFFFFF").withOpacity(0.67),
                  //   ],
                  // ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      // margin: const EdgeInsets.only(left: 28.0),
                      decoration: BoxDecoration(
                          color:
                              (_page == 0 ? Colors.white : Colors.transparent),
                          borderRadius: BorderRadius.circular(50)),
                      child: IconButton(
                        visualDensity:
                            const VisualDensity(vertical: -4, horizontal: -4),
                        iconSize: 25.0,
                        icon: Icon(
                          MdiIcons.fromString('home'),
                          color: (_page == 0 ? Colors.black : Colors.white),
                        ),
                        // Image.asset(
                        //   AssetUtils.home,
                        //   color:
                        //   (_page == 0 ? Colors.black : Colors.white),
                        //   height: 40,
                        //   width: 40,
                        // ),
                        onPressed: () {
                          setState(() {
                            _page = 0;
                            // _myPage.jumpToPage(0);
                          });
                        },
                      ),
                    ),
                    Container(
                      // margin: const EdgeInsets.only(right: 28.0),
                      decoration: BoxDecoration(
                          color:
                              (_page == 1 ? Colors.white : Colors.transparent),
                          borderRadius: BorderRadius.circular(50)),
                      child: IconButton(
                        visualDensity:
                            const VisualDensity(vertical: -4, horizontal: -4),
                        iconSize: 25.0,
                        icon: Icon(
                          MdiIcons.fromString('forum'),
                          color: (_page == 1 ? Colors.black : Colors.white),
                        ),

                        // Image.asset(
                        //   AssetUtils.chat,
                        //   color:
                        //   (_page == 1 ? Colors.black : Colors.white),
                        //   height: 20,
                        //   width: 20,
                        // ),
                        onPressed: () {
                          setState(() {
                            _page = 1;
                            // _myPage.jumpToPage(1);
                          });
                        },
                      ),
                    ),
                    Container(
                      // margin: const EdgeInsets.only(left: 28.0),
                      decoration: BoxDecoration(
                          color:
                              (_page == 2 ? Colors.white : Colors.transparent),
                          borderRadius: BorderRadius.circular(50)),
                      child: IconButton(
                        visualDensity:
                            const VisualDensity(vertical: -4, horizontal: -4),
                        iconSize: 25.0,
                        icon: Icon(
                          MdiIcons.fromString('heart_plus'),
                          color: (_page == 2 ? Colors.black : Colors.white),
                        ),
                        onPressed: () {
                          setState(() {
                            _page = 2;
                            // _myPage.jumpToPage(2);
                          });
                        },
                      ),
                    ),
                    Container(
                      // margin: const EdgeInsets.only(left: 28.0),
                      decoration: BoxDecoration(
                          color:
                              (_page == 3 ? Colors.white : Colors.transparent),
                          borderRadius: BorderRadius.circular(50)),
                      child: IconButton(
                        visualDensity:
                            const VisualDensity(vertical: -4, horizontal: -4),
                        iconSize: 25.0,
                        icon: Icon(
                          MdiIcons.fromString('heart_plus'),
                          color: (_page == 3 ? Colors.black : Colors.white),
                        ),
                        onPressed: () {
                          setState(() {
                            _page = 3;
                            // _myPage.jumpToPage(2);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
