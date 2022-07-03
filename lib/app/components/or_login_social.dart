import 'package:flutter/material.dart';
import 'package:on_boarding_login_register_ui/app/components/styles_manger.dart';
import 'package:on_boarding_login_register_ui/app/extensions.dart';
import 'package:on_boarding_login_register_ui/core/resources/font_manager.dart';
import 'package:tbib_loading_transition_button_and_social/tbib_loading_transition_button_and_social.dart';

import '../../core/resources/value_manger.dart';
import 'my_text.dart';

class OrLoginSocial extends StatefulWidget {
  const OrLoginSocial({Key? key}) : super(key: key);

  @override
  State<OrLoginSocial> createState() => _OrLoginSocialState();
}

class _OrLoginSocialState extends State<OrLoginSocial> {
  LoadingSignButtonController googleLoginController =
      LoadingSignButtonController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.ap12),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                  child: Divider(
                thickness: 1,
              )),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppSpacing.ap12),
                  child: MyText(label: 'Or', textStyle: getLightStyle())),
              const Expanded(
                child: Divider(
                  thickness: 1,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: AppSize.ap12,
          ),
          LoadingSignButton(
            boarderSize: AppSize.ap8,
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
