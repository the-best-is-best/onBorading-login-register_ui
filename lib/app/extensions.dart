import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  void pushReplacement(Widget widget) => Navigator.of(this)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return widget;
      }));
  void push(Widget widget) => Navigator.of(this)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        return widget;
      }));
}
