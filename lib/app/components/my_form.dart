import 'package:flutter/material.dart';

import '../../core/resources/value_manger.dart';

class MyForm extends StatelessWidget {
  final String label;
  final bool isPassword;
  final TextInputType type;

  final IconData? suffixIcon;

  const MyForm({
    Key? key,
    required this.label,
    this.isPassword = false,
    required this.type,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      decoration: InputDecoration(
          label: Text(label),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: AppSpacing.ap1_5,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(AppSpacing.ap8),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: AppSpacing.ap1_5,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(AppSpacing.ap8),
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: AppSpacing.ap1_5,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(AppSpacing.ap8),
            ),
          ),
          suffixIcon: Icon(
            suffixIcon,
            color: Colors.black,
          )),
      obscureText: isPassword,
      validator: (String? val) {
        if (val!.isEmpty) {
          return "Can't be empty";
        }
        return null;
      },
    );
  }
}
