import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todr/splash.dart';


void main() async {
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' ',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:Splash(),

    );
  }
}
