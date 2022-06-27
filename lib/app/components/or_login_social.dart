import 'package:flutter/material.dart';
import 'package:on_boarding_login_register_ui/app/components/styles_manger.dart';
import 'package:on_boarding_login_register_ui/app/extensions.dart';
import 'package:on_boarding_login_register_ui/core/resources/font_manager.dart';
import 'package:tbib_loading_transition_button_and_social/tbib_loading_transition_button_and_social.dart';

import '../../core/resources/value_manger.dart';
import '../../tbib_loading_button/tbib_social_loading_button.dart';
import 'my_text.dart';

class OrLoginSocial extends StatefulWidget {
  const OrLoginSocial({Key? key}) : super(key: key);

  @override
  State<OrLoginSocial> createState() => _OrLoginSocialState();
}

class _OrLoginSocialState extends State<OrLoginSocial> {
  CustomLoadingSignButtonController googleLoginController =
      CustomLoadingSignButtonController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.ap12),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                  flex: 6,
                  child: Divider(
                    thickness: 1,
                  )),
              Expanded(
                  child: Center(
                      child: MyText(label: 'Or', textStyle: getLightStyle()))),
              const Expanded(
                flex: 6,
                child: Divider(
                  thickness: 1,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: AppSize.ap12,
          ),
          CustomLoadingSignButton(
            controller: googleLoginController,
            buttonType: ButtonType.google,
            onSubmit: () {
              print('click');
            },
            fontSize: FontSize.s18,
            imageSize: FontSize.s24,
            width: context.width,
            height: 52,
          )
        ],
      ),
    );
  }
}
