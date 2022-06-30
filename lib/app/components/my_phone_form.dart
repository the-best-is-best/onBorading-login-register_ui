//import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:on_boarding_login_register_ui/app/components/styles_manger.dart';
import 'package:on_boarding_login_register_ui/core/resources/font_manager.dart';
import 'package:tbib_phone_form_field/tbib_phone_form_field.dart';

import '../../core/resources/value_manger.dart';
import 'my_text.dart';

class MyPhoneFormForm extends StatelessWidget {
  const MyPhoneFormForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          label: 'Phone',
          textStyle: getRegularStyle(),
        ),
        const SizedBox(height: AppSize.ap12),
        PhoneFormField(
          defaultCountry: IsoCode.EG,
          showDropDownIcon: true,
          dropDownIcon: Icons.arrow_drop_down,
          dropDownIconSize: FontSize.s40,
          countryCodeStyle: getMediumStyle(),
          decoration: const InputDecoration(
            hintText: 'Eg.812345678',
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
          validator: PhoneValidator.compose([
            PhoneValidator.required(),
            PhoneValidator.validMobile(),
          ]), // default PhoneValidator.valid()
          countrySelectorNavigator:
              const CountrySelectorNavigator.bottomSheet(),
          showFlagInInput: false,
          flagSize: FontSize.s16,

          autofillHints: const [
            AutofillHints.telephoneNumber
          ], // default to null
          enabled: true, // default
          autovalidateMode: AutovalidateMode.disabled, // default
          onSaved: (p) => print('saved $p'), // default null
          onChanged: (p) => print('saved $p'), // default null
        ),
      ],
    );
  }
}
