import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_tool2/pages/WelcomeComponents/background.dart';
import 'package:student_tool2/pages/WelcomeComponents/rounded_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_tool2/pages/login/login_page.dart';
import 'package:student_tool2/pages/register.dart';
import 'package:student_tool2/pages/signup/singup_page.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Bienvenido a Student Tool',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.03),
          SvgPicture.asset(
            "assets/stlogo_adobe_express.svg",
            height: size.height * 0.25,
          ),
          SizedBox(height: size.height * 0.03),
          RoundedButton(
              text: 'Iniciar Sesion',
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              }),
          RoundedButton(
              text: 'Registrate',
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              })
        ],
      ),
    ));
  }
}
