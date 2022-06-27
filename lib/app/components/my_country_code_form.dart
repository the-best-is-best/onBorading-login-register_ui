import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class MyCountryCodeForm extends StatelessWidget {
  const MyCountryCodeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      onChanged: print,
      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
      initialSelection: 'EG',
      // optional. Shows only country name and flag
      showCountryOnly: false,
      // optional. Shows only country name and flag when popup is closed.
      showOnlyCountryWhenClosed: false,
      // optional. aligns the flag and the Text left
      alignLeft: false,
    );
  }
}
