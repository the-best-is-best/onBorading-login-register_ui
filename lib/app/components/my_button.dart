import 'package:flutter/material.dart';
import 'package:on_boarding_login_register_ui/app/extensions.dart';

import '../../core/resources/value_manger.dart';

class MyButton extends StatelessWidget {
  final String text;
  final double borderSize;
  final VoidCallback onPressed;
  final double? width;
  final double? height;

  const MyButton(
      {Key? key,
      required this.text,
      this.borderSize = AppSize.ap12,
      required this.onPressed,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.width,
      height: height ?? 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderSize)),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
