import 'package:flutter/material.dart';

import '../../core/resources/font_manager.dart';
import '../../core/resources/value_manger.dart';

class CircularIcon extends StatelessWidget {
  final IconData? icon;
  const CircularIcon({
    Key? key,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: AppSize.ap12,
      child: Icon(
        icon ?? Icons.question_mark_sharp,
        size: FontSize.s18,
        color: Colors.white,
      ),
    );
  }
}
