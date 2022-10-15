import 'package:flutter/material.dart';
import 'package:student_tool2/Values/const.dart';

class PointsEdit extends StatefulWidget {
  final List courses;
  const PointsEdit({Key? key, required this.courses}) : super(key: key);

  @override
  State<PointsEdit> createState() => _PointsEditState();
}

class _PointsEditState extends State<PointsEdit> {
  List mats = [];
  @override
  Widget build(BuildContext context) {
    mats = widget.courses;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Text(
          "Editar Notas",
        ),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.check))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.courses.length,
              itemBuilder: (context, index) => Container(
                height: 70,
                child: Card(
                  child: ListTile(
                    dense: true,
                    visualDensity: VisualDensity(),
                    title: Text(
                      matName['${mats[index]["code"]}']!,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    trailing: Container(
                      width: 40,
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Nota",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              initialValue: '${mats[index]["pts"]}',
                              validator: (value) {
                                if (int.parse(value!) <= 0) {
                                  return "Nota menor a 0";
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
