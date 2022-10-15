import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = AppBar().preferredSize.height + 37.1;

    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: size.width,
              height: (size.height - height) / 3,
              child: Container(
                color: Colors.green,
                child: Expanded(
                  flex: 1,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.book,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Agregar Materias",
                          style: TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: size.width,
              height: (size.height - height) / 3,
              child: Container(
                color: Colors.yellow,
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.lightbulb,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Sugerencias de Materias",
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: size.width,
              height: (size.height - height) / 3,
              child: Container(
                color: Colors.lightBlue,
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.school,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Planes Guardados",
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
