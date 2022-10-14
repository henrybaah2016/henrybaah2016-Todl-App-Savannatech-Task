import 'dart:async';

import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:todr/list.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);


  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();


    _navigatetohome();
  }

  _navigatetohome()async{
    await Future.delayed(Duration(milliseconds: 3000), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Lists()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff007aeb),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top:220),
              child: Column(
                children: <Widget>[
                  Image.asset('assets/images/todl_logo.png'),

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:240),

              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'todl ',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.mulish(
                      textStyle: TextStyle(
                        color: Color(0xffff9c00),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    'is your quick reminder of relevant things',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.mulish(
                      textStyle: TextStyle(
                        color: Color(0xfff3f3f3),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
