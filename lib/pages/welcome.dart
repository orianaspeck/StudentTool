import 'package:flutter/material.dart';
import 'package:student_tool2/pages/WelcomeComponents/welcome_body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WelcomeBody(),
    );
  }
}
