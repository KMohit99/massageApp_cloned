import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massage_app/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSwatch().copyWith(

          primary:  Colors.black,
          // secondary:  Colors.yellow.shade700,

        ),
      ),
      home:  Splashscreen(),
    );
  }
}


