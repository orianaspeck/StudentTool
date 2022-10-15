import 'package:flutter/material.dart';
import 'package:student_tool2/Reusable Widgets/numbers_display.dart';

class Perfil extends StatefulWidget {
  final data;
  const Perfil({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  final double coverHeight = 225;
  final double profileHeight = 145;
  Map<String, String> idToCareer = {
    "FohONcncWgCsv0X4LbyO": "Ingenieria Informatica"
  };
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[BuildTop(), BuildContent(), BuildInfo()]),
    );
  }

  Widget BuildTop() {
    final double top = coverHeight - profileHeight / 2;
    final double bottom = profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: bottom), child: BuildCoverImage()),
        Positioned(top: top, child: BuildProfileImage()),
      ],
    );
  }

  Widget BuildCoverImage() => Container(
        color: Colors.grey,
        child: Image.asset(
          'assets/UcabGuayana.jpg',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

  Widget BuildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: AssetImage('assets/pitbull.jpg'),
      );

  Widget BuildContent() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 8,
          ),
          Text(
            "${widget.data["name"]} " + "${widget.data["lastname"]}",
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            widget.data["cedula"],
            style: TextStyle(fontSize: 20, color: Colors.grey.shade700),
          ),
          SizedBox(
            height: 16,
          ),
          NumbersDisplay(),
          SizedBox(
            height: 15,
          ),
        ],
      );

  Widget BuildInfo() => Container(
        margin: EdgeInsets.only(left: 10, top: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Email',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              widget.data["email"],
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Carrera',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            SizedBox(
              height: 8,
            ),
            Text(
              "Ingenieria Informatica",
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Sobre mi',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            SizedBox(
              height: 8,
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent luctus fermentum mi in consequat. Duis lacinia faucibus nisi et vestibulum. Fusce vitae mauris et turpis accumsan efficitur. Nulla eleifend auctor dui sagittis maximus. Cras scelerisque.",
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
            )
          ],
        ),
      );
}
