import 'package:flutter/material.dart';

import '../../core/resources/value_manger.dart';

class MyForm extends StatelessWidget {
  final String label;
  final bool isPassword;
  final TextInputType type;
  final bool enabledBorder;

  final IconData? suffixIcon;

  const MyForm(
      {Key? key,
      required this.label,
      this.isPassword = false,
      required this.type,
      this.suffixIcon,
      this.enabledBorder = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      decoration: InputDecoration(
          label: Text(label),
          enabledBorder: enabledBorder
              ? const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: AppSpacing.ap1_5,
                  ),
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppSpacing.ap8)))
              : null,
          suffixIcon: Icon(
            suffixIcon,
            color: Colors.black,
          )),
      obscureText: isPassword,
    );
  }
}
