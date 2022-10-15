import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:student_tool2/Reusable%20Widgets/reusableFirebaseButton.dart';
import 'package:student_tool2/Reusable%20Widgets/reusableTextField.dart';
import 'package:student_tool2/Reusable Widgets/reusable_dropdown.dart';
import 'package:student_tool2/main.dart';
import 'package:toast/toast.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    Map<String, String> careerToId = {
      "Ingenieria Informatica": "FohONcncWgCsv0X4LbyO"
    };
    TextEditingController _passwordTextController = TextEditingController();
    TextEditingController _emailTextController = TextEditingController();
    TextEditingController _userLastNameTextController = TextEditingController();
    TextEditingController _cedulaTextController = TextEditingController();
    TextEditingController _nameTextController = TextEditingController();
    String career = 'Ingenieria Informatica';
    Function setCareer = (String newCareer) => {career = newCareer};
    Size size = MediaQuery.of(context).size;
    final db = FirebaseFirestore.instance;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Text("Student Tool"),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: Column(
              children: <Widget>[
                Text(
                  "Registro",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Crea una nueva cuenta",
                  style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                ),
                const SizedBox(
                  height: 50,
                ),
                reusableTextField("Ingresar Nombre", Icons.person_outline,
                    false, _nameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Ingresar Apellido", Icons.person_outline,
                    false, _userLastNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Ingresar Cedula", Icons.person_outline,
                    false, _cedulaTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Ingresar Email", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                CareerDropdown(change: setCareer),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Ingresar Contraseña", Icons.lock_outlined,
                    true, _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Registrate", () async {
                  Map<String, dynamic> data;
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) => {
                            data = <String, dynamic>{
                              "email": _emailTextController.text,
                              "cedula": _cedulaTextController.text,
                              "name": _nameTextController.text,
                              "lastname": _userLastNameTextController.text,
                              "pass": _passwordTextController.text,
                              "career": careerToId[career]
                            },
                            db
                                .collection("users")
                                .doc(value.user!.uid)
                                .set(data),
                            Toast.show("Registro Exitoso",
                                duration: Toast.lengthLong,
                                gravity: Toast.bottom),
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage(
                                        data: data, userID: value.user!.uid)))
                          })
                      .catchError((e) => {
                            if (e.code == "email-already-in-use")
                              {
                                Toast.show("El Email ya esta en uso",
                                    duration: Toast.lengthLong,
                                    gravity: Toast.bottom)
                              }
                            else if (e.code == "invalid-email")
                              {
                                Toast.show("Email Invalido",
                                    duration: Toast.lengthLong,
                                    gravity: Toast.bottom)
                              }
                            else if (e.code == "weak-password")
                              {
                                Toast.show("Contraseña debil",
                                    duration: Toast.lengthLong,
                                    gravity: Toast.bottom)
                              }
                          });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
