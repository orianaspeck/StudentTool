import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_tool2/stToolComponents/splash.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  int azul = 0xFF2C1656;
  int verde = 0xFF423261;
  int amarillo = 00;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false, home: new SplashScreen());
  }
}
