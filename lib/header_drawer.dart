import 'package:flutter/material.dart';

class HeaderDrawer extends StatefulWidget {
  final data;
  const HeaderDrawer({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  State<HeaderDrawer> createState() => _HeaderDrawerState();
}

class _HeaderDrawerState extends State<HeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[600],
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage('assets/pitbull.jpg')),
            ),
          ),
          Text(
            '${widget.data["name"]} ' + '${widget.data["lastname"]}',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            widget.data["cedula"],
            style: TextStyle(color: Colors.grey.shade300, fontSize: 14),
          )
        ],
      ),
    );
  }
}
