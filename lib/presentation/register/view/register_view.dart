import 'package:flutter/material.dart';
import 'package:on_boarding_login_register_ui/app/components/my_form.dart';
import 'package:on_boarding_login_register_ui/app/extensions.dart';
import 'package:on_boarding_login_register_ui/presentation/login/view/login_view.dart';

import '../../../app/components/my_button.dart';
import '../../../app/components/my_country_code_form.dart';
import '../../../app/components/my_text.dart';
import '../../../app/components/or_login_social.dart';
import '../../../app/components/styles_manger.dart';
import '../../../app/components/text_button_with_icon.dart';
import '../../../core/resources/value_manger.dart';
import '../../../gen/assets.gen.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.ap16),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: context.height * .2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            const $AssetsImagesGen().imageHeader.path)))),
            const SizedBox(
              height: AppSize.ap12,
            ),
            MyText(
                label: 'Welcome To Fashion Daily', textStyle: getLightStyle()),
            const SizedBox(
              height: AppSize.ap12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(label: 'Register', textStyle: getBoldStyle()),
                const TextButtonIcon(text: 'Help'),
              ],
            ),
            const SizedBox(
              height: AppSize.ap12,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    const MyForm(
                        label: 'Email', type: TextInputType.emailAddress),
                    const SizedBox(height: AppSize.ap12),
                    Row(
                      children: const [
                        Expanded(child: MyCountryCodeForm()),
                        Expanded(
                          flex: 2,
                          child: MyForm(
                            type: TextInputType.phone,
                            label: 'Phone Number',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSize.ap12),
                    const MyForm(
                      type: TextInputType.visiblePassword,
                      label: 'Password',
                      isPassword: true,
                      suffixIcon: Icons.remove_red_eye,
                    ),
                    const SizedBox(height: AppSize.ap12),
                    const SizedBox(
                      height: AppSize.ap12,
                    ),
                    MyButton(
                      text: 'Register',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 50),
                    const OrLoginSocial(),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                            label: "Has any account?",
                            textStyle: getRegularStyle()),
                        TextButton(
                            onPressed: () {
                              context.pushReplacement(const LoginView());
                            },
                            child: Text(
                              'Sign in Here',
                              style: getRegularStyle(color: Colors.blue),
                            ))
                      ],
                    ),
                  ],
                )),
          ],
        )),
      ),
    );
  }
}
