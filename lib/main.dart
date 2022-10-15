import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_tool2/header_drawer.dart';
import 'package:student_tool2/pages/home.dart';
import 'package:student_tool2/pages/login/login_page.dart';
import 'package:student_tool2/pages/materias.dart';
import 'package:student_tool2/pages/perfil.dart';
import 'package:student_tool2/pages/planes.dart';
import 'package:student_tool2/pages/sugerencias.dart';
import 'package:student_tool2/stToolComponents/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:toast/toast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final int azul = 0xFF2C1656;
  final int verde = 0xFF423261;
  final int amarillo = 00;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return MaterialApp(
      title: 'Student Tool',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  final userID;
  final data;
  const HomePage({Key? key, this.data, this.userID}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.home;
  @override
  Widget build(BuildContext context) {
    var container;
    switch (currentPage) {
      case DrawerSections.home:
        container = Home();
        break;
      case DrawerSections.perfil:
        container = Perfil(data: widget.data);
        break;
      case DrawerSections.materias:
        container = Materias(data: widget.data, userID: widget.userID);
        break;
      case DrawerSections.sugerencias:
        container = SugerenciasPage(data: widget.data);
        break;
      case DrawerSections.planes:
        container = PlanesPage();
        break;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Text("Materias Sugeridas"),
        actions: <Widget>[
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Toast.show('Sesión Cerrada',
                    duration: Toast.lengthLong, gravity: Toast.bottom);
                Navigator.pop(context);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [HeaderDrawer(data: widget.data), DrawerList()],
            ),
          ),
        ),
      ),
    );
  }

  Widget DrawerList() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        // Show menu drawer list
        children: [
          MenuItem(1, "Home", Icons.home_max_outlined,
              currentPage == DrawerSections.home ? true : false),
          MenuItem(2, "Perfil", Icons.people_outline,
              currentPage == DrawerSections.home ? true : false),
          MenuItem(3, "Materias", Icons.book_outlined,
              currentPage == DrawerSections.home ? true : false),
          MenuItem(4, "Sugerencias", Icons.lightbulb_outlined,
              currentPage == DrawerSections.home ? true : false),
          MenuItem(3, "Planes", Icons.dashboard_outlined,
              currentPage == DrawerSections.home ? true : false),
        ],
      ),
    );
  }

  Widget MenuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            switch (id) {
              case 1:
                currentPage = DrawerSections.home;
                break;
              case 2:
                currentPage = DrawerSections.perfil;
                break;
              case 3:
                currentPage = DrawerSections.materias;
                break;
              case 4:
                currentPage = DrawerSections.sugerencias;
                break;
              case 5:
                currentPage = DrawerSections.sugerencias;
                break;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  title,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections { home, perfil, materias, sugerencias, planes }
