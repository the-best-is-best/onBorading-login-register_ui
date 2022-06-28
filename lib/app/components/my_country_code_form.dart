//import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:on_boarding_login_register_ui/app/components/styles_manger.dart';
import 'package:on_boarding_login_register_ui/core/resources/font_manager.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../../core/resources/value_manger.dart';

class MyPhoneFormForm extends StatelessWidget {
  const MyPhoneFormForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhoneFormField(
      defaultCountry: IsoCode.EG, // default
      initialValue: PhoneNumber.fromRaw('+201277777777'),
      countryCodeStyle: getMediumStyle(),
      decoration: const InputDecoration(
        labelText: 'Phone', // default to null
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: AppSpacing.ap1_5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSpacing.ap8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: AppSpacing.ap1_5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSpacing.ap8),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: AppSpacing.ap1_5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSpacing.ap8),
          ),
        ),
      ),
      validator: PhoneValidator.validMobile(), // default PhoneValidator.valid()
      countrySelectorNavigator: const CountrySelectorNavigator.bottomSheet(),
      showFlagInInput: false, // default
      flagSize: FontSize.s16, // default

      autofillHints: const [AutofillHints.telephoneNumber], // default to null
      enabled: true, // default
      autovalidateMode: AutovalidateMode.disabled, // default
      onSaved: (p) => print('saved $p'), // default null
      onChanged: (p) => print('saved $p'), // default null
    );
  }
}
