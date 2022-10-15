import 'package:flutter/material.dart';

class NumbersDisplay extends StatelessWidget {
  const NumbersDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        BuildSection(text: 'UC', value: 20),
        BuildDivider(),
        BuildSection(text: 'Promedio', value: 18)
      ],
    );
  }

  Widget BuildDivider() => Container(
        height: 24,
        child: VerticalDivider(),
      );

  Widget BuildSection({required String text, required int value}) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            '$value',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 16),
          )
        ],
      );
}
