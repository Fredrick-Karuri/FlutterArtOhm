// ignore_for_file: prefer_const_constructors

import 'package:artohm/pages/welcome.dart';
import 'package:flutter/material.dart';
// import 'package:splashscreen/splashscreen.dart';
import 'package:splashscreen/splashscreen.dart';

class splashscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      
      navigateAfterSeconds: 
       Scaffold(
          backgroundColor: Colors.grey.shade300,
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Builder(builder: (context) {
              return Welcome();
            }),
          ),
          
        ),
      // title: Text('GeeksForGeeks',textScaleFactor: 2,),
      image: Image.asset('assets/logo.jpg'),
      // image: assets('graphics/background.png'),
      loadingText: Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.blue,
      
    );
  }
}