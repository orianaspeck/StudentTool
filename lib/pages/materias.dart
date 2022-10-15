import 'package:flutter/material.dart';
import 'package:student_tool2/pages/materias/pick_info.dart';
import 'package:student_tool2/Values/const.dart';
import 'package:student_tool2/pages/materias/pick_pts.dart';

class Materias extends StatefulWidget {
  final userID;
  final data;
  const Materias({Key? key, this.data, this.userID}) : super(key: key);

  @override
  State<Materias> createState() => _MateriasState();
}

class _MateriasState extends State<Materias> {
  final int limit = 20;
  List mats = [];
  int page = 0;
  bool isFirstLoadRunning = false;

  @override
  Widget build(BuildContext context) {
    if (widget.data["courses"] != null) {
      mats = widget.data["courses"];
    }
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 270),
        child: Row(
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => PickMatsInfo(
                            data: widget.data, userID: widget.userID))));
              },
              backgroundColor: Colors.green,
              child: Icon(Icons.add),
              elevation: 8,
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PointsEdit(
                              courses: mats,
                            )));
              },
              backgroundColor: Colors.green,
              child: Icon(Icons.edit),
              elevation: 8,
            ),
          ],
        ),
      ),
      body: mats == Null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  itemCount: mats.length,
                  itemBuilder: (context, index) => Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: ListTile(
                      title: Text(
                        matName['${mats[index]["code"]}']!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Text(
                        '${mats[index]["pts"]}',
                        style: TextStyle(
                            fontSize: 16,
                            color: mats[index]["pts"] >= 10
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ))
              ],
            ),
    );
  }
}
