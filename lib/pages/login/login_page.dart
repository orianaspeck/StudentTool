import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:student_tool2/main.dart';
import 'package:toast/toast.dart';
import '../../Reusable Widgets/reusableFirebaseButton.dart';
import '../../Reusable Widgets/reusableTextField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Text("Student Tool"),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.1,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                    "Bienvenido",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Inicia Sesion en tu cuenta",
                    style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  reusableTextField("User", Icons.person_outline, false,
                      _emailTextController),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Contraseña", Icons.lock_outline, true,
                      _passwordTextController),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  firebaseUIButton(context, "Iniciar Sesión", () {
                    var data;

                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) async => {
                              await db
                                  .collection("users")
                                  .doc(value.user!.uid)
                                  .get()
                                  .then((DocumentSnapshot doc) => {
                                        data =
                                            doc.data() as Map<String, dynamic>,
                                      }),
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => HomePage(
                                            data: data,
                                            userID: value.user!.uid,
                                          ))))
                            })
                        .catchError((e) => {
                              if (e.code == 'user-not-found')
                                {
                                  Toast.show('Usuario no existe',
                                      duration: Toast.lengthLong, gravity: 20)
                                }
                              else if (e.code == 'wrong-password')
                                {
                                  Toast.show('Contraseña Erronea',
                                      duration: Toast.lengthLong, gravity: 20)
                                }
                            });
                  }),
                  SizedBox(
                    height: size.width * 0.08,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "¿No tienes una cuenta? ",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 20,
                          ),
                          children: [
                        TextSpan(
                            text: "Registrate",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 20,
                                fontWeight: FontWeight.bold))
                      ])),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
