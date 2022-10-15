import 'package:flutter/material.dart';

class CareerDropdown extends StatefulWidget {
  final Function change;
  const CareerDropdown({Key? key, required this.change}) : super(key: key);
  @override
  State<CareerDropdown> createState() => CareerDropdownState();
}

class CareerDropdownState extends State<CareerDropdown> {
  List careers = [
    "Ingenieria Informatica",
    "Ingenieria Industrial",
    "Ingenieria Civil"
  ];
  String? Selected = "Ingenieria Informatica";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.person,
            color: Colors.green,
          ),
          filled: true,
          fillColor: Colors.green.withOpacity(0.1),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
        ),
        value: Selected,
        onChanged: (item) => {widget.change(item)},
        items: careers
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
