import 'package:flutter/material.dart';

Widget ReusableCheckBox(String title, Function controller, List list, int index,
    Map<String, bool> boolmap) {
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
      onChanged: (value) => {});
}
