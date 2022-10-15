import 'package:flutter/material.dart';

Widget ReusableMatCheckBox(String title, bool value, Function change) {
  return CheckboxListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
      value: value,
      onChanged: ((value) => {}));
}
