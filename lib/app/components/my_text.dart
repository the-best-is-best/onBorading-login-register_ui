import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String label;
  final TextStyle textStyle;
  const MyText({Key? key, required this.label, required this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: textStyle,
    );
  }
}
