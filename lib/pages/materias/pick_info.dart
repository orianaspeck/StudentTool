import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:student_tool2/Reusable%20Widgets/reusable_check_sub.dart';
// import 'package:student_tool2/Reusable%20Widgets/reusable_checkbox.dart';

class PickMatsInfo extends StatefulWidget {
  final data;
  final userID;
  const PickMatsInfo({Key? key, this.data, this.userID}) : super(key: key);

  @override
  State<PickMatsInfo> createState() => _PickMatsInfoState();
}

class _PickMatsInfoState extends State<PickMatsInfo> {
  List<Map<String, dynamic>> add = [];
  List sm = List.filled(10, false);
  Map<String, bool> boolmap = {
    "UCAB-00007": false,
    "FING-00018": false,
    "INFO-00020": false,
    "FING-00006": false,
    "UCAB-00001": false, // Termina 1s
    "FING-00001": false,
    "INFO-00038": false,
    "INFO-00037": false,
    "UCAB-00002": false, //Termina 2sS
    "FING-00002": false,
    "FING-00011": false,
    "INFO-00060": false,
    "INFO-00061": false, //s3
    "FING-00003": false,
    "FING-00015": false,
    "FING-00010": false,
    "INFO-00087": false,
    "INFO-00086": false,
    "UCAB-00003": false, //s4
    "FING-00004": false,
    "INFO-00107": false,
    "INFO-00108": false,
    "INFO-00221": false,
    "INFO-00216": false, // s5
    "FING-00005": false,
    "FING-00008": false,
    "INFO-00132": false,
    "INFO-00131": false,
    "INFO-00130": false,
    "INFO-SC002": false, // s6
    "FING-00019": false,
    "INFO-00152": false,
    "INFO-00151": false,
    "INFO-00150": false,
    "FACE-00024": false,
    "INFO-00217": false,
    "INFO-SC004": false, // s7
    "INFO-00220": false,
    "INFO-00191": false,
    "INFO-00222": false,
    "INFO-00173": false,
    "FING-00014": false,
    "INFO-00218": false, //s8
    "INFO-00171": false,
    "INFO-00172": false,
    "UCAB-00008": false,
    "INFO-00219": false,
    "INFO-00192": false, //s9
    "FING-00009": false,
    "INFO-00206": false,
    "INFO-00207": false,
    "INFO-00223": false,
  };
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    var res;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Text("Agregar Materias"),
        actions: <Widget>[
          IconButton(
              onPressed: () async {
                print(widget.userID);
                final doc = db.collection("users").doc(widget.userID);
                doc.update({"courses": add}).then(
                    (value) => print("Document Snapshot updated"));
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.check,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            ReusableCheckBox("Primer Semestre", () {}, sm, 0, boolmap),
            ReusableMatCheckBox("Introducción a la informática", false, add,
                boolmap, "INFO-00020"),
            ReusableMatCheckBox("Geometría Plana y Trigonometría", false, add,
                boolmap, "UCAB-00007"),
            ReusableMatCheckBox("Comprensión y Producción de Textos", false,
                add, boolmap, "FING-00006"),
            ReusableMatCheckBox(
                "Matemática Básica", false, add, boolmap, "FING-00018"),
            ReusableMatCheckBox("Identidad, Liderazgo y Compromiso I", false,
                add, boolmap, "UCAB-00001"),
            ReusableCheckBox("Segundo Semestre", () {}, sm, 1, boolmap),
            ReusableMatCheckBox("Cálculo I", false, add, boolmap, "FING-00001"),
            ReusableMatCheckBox(
                "Lógica Computacional", false, add, boolmap, "INFO-00038"),
            ReusableMatCheckBox("Algoritmos y Programación I", false, add,
                boolmap, "INFO-00037"),
            ReusableMatCheckBox("Identidad, Liderazgo y Compromiso II", false,
                add, boolmap, "UCAB-00002"),
            ReusableCheckBox("Tercer Semestre", () {}, sm, 2, boolmap),
            ReusableMatCheckBox(
                "Cálculo II", false, add, boolmap, "FING-00002"),
            ReusableMatCheckBox(
                "Física General", false, add, boolmap, "FING-00011"),
            ReusableMatCheckBox(
                "Matemáticas Discretas", false, add, boolmap, "INFO-00060"),
            ReusableMatCheckBox("Algoritmos y Programación II", false, add,
                boolmap, "INFO-00061"),
            ReusableCheckBox("Cuarto Semestre", () {}, sm, 3, boolmap),
            ReusableMatCheckBox(
                "Cálculo III", false, add, boolmap, "FING-00003"),
            ReusableMatCheckBox("Laboratorio de Física Eléctrica", false, add,
                boolmap, "FING-00015"),
            ReusableMatCheckBox(
                "Física Eléctrica", false, add, boolmap, "FING-00010"),
            ReusableMatCheckBox(
                "Estructura del Computador", false, add, boolmap, "INFO-00087"),
            ReusableMatCheckBox("Algoritmos y Programación III", false, add,
                boolmap, "INFO-00086"),
            ReusableMatCheckBox("Ecología, Ambiente y Sustentabilidad", false,
                add, boolmap, "UCAB-00003"),
            ReusableCheckBox("Quinto Semestre", () {}, sm, 4, boolmap),
            ReusableMatCheckBox(
                "Cálculo IV", false, add, boolmap, "FING-00004"),
            ReusableMatCheckBox(
                "Circuitos Electrónicos", false, add, boolmap, "INFO-00107"),
            ReusableMatCheckBox(
                "Sistemas de Operación", false, add, boolmap, "INFO-00108"),
            ReusableMatCheckBox(
                "Ingeniería del Software", false, add, boolmap, "INFO-00221"),
            ReusableMatCheckBox("Interacción Humano Computador", false, add,
                boolmap, "INFO-00216"),
            ReusableCheckBox("Sexto Semestre", () {}, sm, 5, boolmap),
            ReusableMatCheckBox(
                "Cálculo Numérico", false, add, boolmap, "FING-00005"),
            ReusableMatCheckBox("Estadística y Probabilidades", false, add,
                boolmap, "FING-00008"),
            ReusableMatCheckBox("Arquitectura del Computador", false, add,
                boolmap, "INFO-00132"),
            ReusableMatCheckBox(
                "Redes de Computadores I", false, add, boolmap, "INFO-00131"),
            ReusableMatCheckBox("Sistemas de Bases de Datos I", false, add,
                boolmap, "INFO-00130"),
            ReusableMatCheckBox("Curso de Servicio Comunitario", false, add,
                boolmap, "INFO-SC002"),
            ReusableCheckBox("Septimo Semestre", () {}, sm, 6, boolmap),
            ReusableMatCheckBox(
                "Programación Lineal", false, add, boolmap, "FING-00019"),
            ReusableMatCheckBox(
                "Redes de Computadores II", false, add, boolmap, "INFO-00152"),
            ReusableMatCheckBox(
                "Metodología del Software", false, add, boolmap, "INFO-00151"),
            ReusableMatCheckBox("Sistemas de Bases de Datos II", false, add,
                boolmap, "INFO-00150"),
            ReusableMatCheckBox(
                "Contabilidad Financiera", false, add, boolmap, "FACE-00024"),
            ReusableMatCheckBox("Inglés I", false, add, boolmap, "INFO-00217"),
            ReusableMatCheckBox(
                "Servicio Comunitario", false, add, boolmap, "INFO-SC004"),
            ReusableCheckBox("Octavo Semestre", () {}, sm, 7, boolmap),
            ReusableMatCheckBox("Investigación de Operaciones", false, add,
                boolmap, "INFO-00220"),
            ReusableMatCheckBox(
                "Redes de Computadores III", false, add, boolmap, "INFO-00191"),
            ReusableMatCheckBox("Seminario de Trabajo de Grado", false, add,
                boolmap, "INFO-00222"),
            ReusableMatCheckBox(
                "Desarrollo de Software", false, add, boolmap, "INFO-00173"),
            ReusableMatCheckBox(
                "Ingeniería Económica", false, add, boolmap, "FING-00014"),
            ReusableMatCheckBox("Inglés II", false, add, boolmap, "INFO-00218"),
            ReusableCheckBox("Noveno Semestre", () {}, sm, 8, boolmap),
            ReusableMatCheckBox(
                "Seguridad Computacional", false, add, boolmap, "INFO-00171"),
            ReusableMatCheckBox(
                "Sistemas Distribuidos", false, add, boolmap, "INFO-00172"),
            ReusableMatCheckBox("Innovación y Emprendimiento", false, add,
                boolmap, "UCAB-00008"),
            ReusableMatCheckBox(
                "Inglés Tecnico", false, add, boolmap, "INFO-00219"),
            ReusableMatCheckBox("Pasantía", false, add, boolmap, "INFO-00192"),
            ReusableCheckBox("Decimo Semestre", () {}, sm, 9, boolmap),
            ReusableMatCheckBox(
                "Ética Profesional", false, add, boolmap, "FING-00009"),
            ReusableMatCheckBox("Evaluación de Sistemas Informáticos", false,
                add, boolmap, "INFO-00206"),
            ReusableMatCheckBox("Gestión de Proyectos de Software", false, add,
                boolmap, "INFO-00207"),
            ReusableMatCheckBox(
                "Trabajo de Grado", false, add, boolmap, "INFO-00223"),
          ],
        ),
      ),
    );
  }

  Widget ReusableCheckBox(String title, Function controller, List list,
      int index, Map<String, bool> boolmap) {
    return CheckboxListTile(
        title: Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700),
        ),
        value: list[index],
        activeColor: Colors.green,
        secondary: const Icon(Icons.school),
        onChanged: (value) => setState(() {
              list[index] = value!;
              if (value) {
                boolmap.forEach((key, value) {
                  boolmap[key] = true;
                });
              } else {
                boolmap.forEach((key, value) {
                  boolmap[key] = false;
                });
              }
            }));
  }

  Widget ReusableMatCheckBox(String title, bool value,
      List<Map<String, dynamic>> add, Map boolmap, String matCode) {
    return CheckboxListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        value: boolmap[matCode],
        onChanged: ((value) => setState(() {
              boolmap[matCode] = value!;
              if (value) {
                add.add({"code": matCode, "pts": 20});
                // print(add);
              } else {
                add.removeWhere((element) => element["code"] == matCode);
                // print(add);
              }
            })));
  }
}
