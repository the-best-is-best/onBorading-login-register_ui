import 'package:flutter/material.dart';
import 'package:on_boarding_login_register_ui/app/components/styles_manger.dart';

import '../../core/resources/value_manger.dart';

class MyForm extends StatelessWidget {
  final String label;
  final String hint;

  final bool isPassword;
  final TextInputType type;
  final VoidCallback? suffixIconPressed;
  final IconData? suffixIcon;

  const MyForm({
    Key? key,
    required this.label,
    this.isPassword = false,
    required this.type,
    this.suffixIcon,
    required this.hint,
    this.suffixIconPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: getRegularStyle(),
        ),
        const SizedBox(height: AppSize.ap12),
        TextFormField(
          keyboardType: type,
          decoration: InputDecoration(
            hintText: hint,
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
            suffixIcon: IconButton(
              icon: Icon(
                suffixIcon,
                color: Colors.black,
              ),
              onPressed: suffixIconPressed,
            ),
          ),
          obscureText: isPassword,
          validator: (String? val) {
            if (val!.isEmpty) {
              return "Can't be empty";
            }
            return null;
          },
        ),
      ],
    );
  }
}
