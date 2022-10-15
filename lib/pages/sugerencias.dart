import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:student_tool2/pages/Models/suggestions_model.dart';

class SugerenciasPage extends StatefulWidget {
  final data;
  const SugerenciasPage({Key? key, this.data}) : super(key: key);

  @override
  State<SugerenciasPage> createState() => _SugerenciasPageState();
}

class _SugerenciasPageState extends State<SugerenciasPage> {
  List content = [];
  bool notready = true;
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            getSuggestions();
            // sleep(Duration(seconds: 3));
          });
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.update),
      ),
      body: notready
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: ListView.builder(
                          itemCount: content.length,
                          itemBuilder: (context, index) => Container(
                                child: Card(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 10),
                                  child: ListTile(
                                    title: Text(
                                      content[index]["name"],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    subtitle: Text(
                                      'Semestre: ${content[index]["semester"]}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey.shade700),
                                    ),
                                    trailing:
                                        Text("UC: ${content[index]["uc"]}"),
                                  ),
                                ),
                              )))
                ],
              ),
            ),
    );
  }

  getSuggestions() async {
    try {
      var res = await http.post(
        Uri.parse(
            "https://student-tool-backend.herokuapp.com/api/v1/courses/suggested"),
        body: {"uc": "0", "courses": widget.data["courses"].toString()},
      );

      var data = json.decode(res.body);
      content = data["courses"];
      print(content[0]["id"]);
    } catch (e) {
      print(e.toString());
    } finally {
      notready = false;
    }
  }
}
