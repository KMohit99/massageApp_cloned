import 'dart:io';

import 'package:flutter/material.dart';
import 'package:massage_app/common_utils/AssetUtils.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class Content {
  final String text;
  final String image;

  Content(
    this.image,
    this.text,
  );
}

class _HomePageScreenState extends State<HomePageScreen> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<String> _names = ["Red", "Blue", "Green", "Yellow", "Orange"];
  List _images = [
    AssetUtils.one,
    AssetUtils.two,
    AssetUtils.three,
    AssetUtils.one,
    AssetUtils.two,
  ];

  @override
  void initState() {
    for (int i = 0; i < _names.length; i++) {
      _swipeItems.add(SwipeItem(

          content: Content(_images[i], _names[i]),
          likeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Liked ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          nopeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Nope ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          superlikeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Superliked ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          }));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  init() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            height: MediaQuery.of(context).size.height-150,

            child: SwipeCards(
              matchEngine: _matchEngine!,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(40)
                  ),
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      _swipeItems[index].content.image,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                    ),
                  ),
                  // color: _swipeItems[index].content.color,
                  // child:
                  // Text(
                  //   _swipeItems[index].content.text,
                  //   style: TextStyle(fontSize: 100),
                  // ),
                );
              },
              onStackFinished: () {
                for (int i = 0; i < _names.length; i++) {
                  _swipeItems.add(SwipeItem(

                      content: Content(_images[i], _names[i]),
                      likeAction: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Liked ${_names[i]}"),
                          duration: Duration(milliseconds: 500),
                        ));
                      },
                      nopeAction: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Nope ${_names[i]}"),
                          duration: Duration(milliseconds: 500),
                        ));
                      },
                      superlikeAction: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Superliked ${_names[i]}"),
                          duration: Duration(milliseconds: 500),
                        ));
                      },
                      onSlideUpdate: (SlideRegion? region) async {
                        print("Region $region");
                      }));
                }

                _matchEngine = MatchEngine(swipeItems: _swipeItems);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Stack Finished"),
                  duration: Duration(milliseconds: 500),
                ));
              },
              itemChanged: (SwipeItem item, int index) {
                print("item: ${item.content.text}, index: $index");
              },
              upSwipeAllowed: true,
              fillSpace: true,

            ),
          ),
        ],
      ),
    );
  }
}
