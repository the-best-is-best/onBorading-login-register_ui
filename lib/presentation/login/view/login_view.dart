import 'package:flutter/material.dart';
import 'package:on_boarding_login_register_ui/app/components/circular_icon.dart';
import 'package:on_boarding_login_register_ui/app/components/my_button.dart';
import 'package:on_boarding_login_register_ui/app/components/my_country_code_form.dart';
import 'package:on_boarding_login_register_ui/app/components/my_text.dart';
import 'package:on_boarding_login_register_ui/app/components/styles_manger.dart';
import 'package:on_boarding_login_register_ui/app/extensions.dart';
import 'package:on_boarding_login_register_ui/core/resources/value_manger.dart';
import 'package:on_boarding_login_register_ui/gen/assets.gen.dart';

import '../../../app/components/my_form.dart';
import '../../../app/components/or_login_social.dart';
import '../../../app/components/text_button_with_icon.dart';
import '../../register/view/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.ap16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: context.height * .4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              const $AssetsImagesGen().imageHeader.path)))),
              const SizedBox(
                height: AppSize.ap12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                      label: 'Welcome To Fashion Daily',
                      textStyle: getLightStyle()),
                  const SizedBox(
                    height: AppSize.ap12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(label: 'Sign In', textStyle: getBoldStyle()),
                      const TextButtonIcon(text: 'Help'),
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.ap12,
                  ),
                  Form(
                    key: _formKey,
                    child: Row(
                      children: const [
                        Expanded(
                          child: MyCountryCodeForm(),
                        ),
                        Expanded(
                          flex: 2,
                          child: MyForm(
                            type: TextInputType.phone,
                            label: 'Phone Number',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.ap12),
              MyButton(
                text: 'Sign In',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
              ),
              const SizedBox(height: AppSize.ap14),
              const OrLoginSocial(),
              const SizedBox(height: AppSize.ap14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                      label: "Doesn't has any account?",
                      textStyle: getRegularStyle()),
                  TextButton(
                      onPressed: () {
                        context.pushReplacement(const RegisterView());
                      },
                      child: Text(
                        'Register here',
                        style: getRegularStyle(color: Colors.blue),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
