import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:on_boarding_login_register_ui/app/components/my_text.dart';
import 'package:on_boarding_login_register_ui/app/components/styles_manger.dart';
import 'package:on_boarding_login_register_ui/app/extensions.dart';
import 'package:on_boarding_login_register_ui/gen/assets.gen.dart';
import 'package:on_boarding_login_register_ui/presentation/register/view/register_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../app/components/my_button.dart';
import '../../../core/resources/value_manger.dart';
import '../../../domain/model/on_boarding_model.dart';
import '../../login/view/login_view.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final List<OnBoarding> _onBoardingData = [
    OnBoarding(
        title: 'Welcome to Food Store',
        description: 'Food Store is one the way to serve you',
        urlImage: const $AssetsSvgGen().aircraft.path),
    OnBoarding(
        title: 'Connect with the world',
        description:
            'See All things happening around the world by a click in your phone.',
        urlImage: const $AssetsSvgGen().travailing.path),
    OnBoarding(
        title: "Let's Get Started",
        description: "Let's see what we get",
        urlImage: const $AssetsSvgGen().buying.path),
  ];
  final boardController = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: context.height,
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.ap12),
                child: SingleChildScrollView(
                  child: Column(children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: MyButton(
                        text: 'Skip',
                        borderSize: 50,
                        onPressed: () {
                          context.pushReplacement(const LoginView());
                        },
                        width: 75,
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.ap12,
                    ),
                    Image.asset(
                      const $AssetsImagesGen().logo.path,
                      height: 140,
                    ),
                    SizedBox(
                      height: context.height * .5,
                      child: PageView(
                        allowImplicitScrolling: true,
                        controller: boardController,
                        children: _onBoardingData
                            .map((item) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppSpacing.ap20),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          item.title,
                                        ),
                                        const SizedBox(
                                          height: AppSize.ap12,
                                        ),
                                        SvgPicture.asset(
                                          item.urlImage,
                                          height: .3 * context.height,
                                          fit: BoxFit.cover,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .90,
                                        ),
                                        const SizedBox(
                                          height: AppSpacing.ap12,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text(
                                            item.description,
                                            textAlign: TextAlign.center,
                                            softWrap: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            Positioned(
              bottom: 150,
              child: SizedBox(
                width: context.width,
                child: Center(
                  child: buildIndicator(
                      boardController: boardController,
                      count: _onBoardingData.length),
                ),
              ),
            ),
            Positioned(
              bottom: 80,
              left: 20,
              right: 20,
              child: SizedBox(
                width: context.width,
                child: Center(
                  child: MyButton(
                    text: 'Get Start',
                    onPressed: () {
                      context.pushReplacement(const LoginView());
                    },
                    borderSize: AppSize.ap8,
                    width: context.width - 40,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 30,
              right: 30,
              child: SizedBox(
                child: Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                            label: "Don't have any account?",
                            textStyle: getRegularStyle()),
                        TextButton(
                            onPressed: () {
                              context.push(const RegisterView());
                            },
                            child: Text(
                              'Sign Up',
                              style: getLightStyle(color: Colors.teal),
                            ))
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SmoothPageIndicator buildIndicator(
      {required PageController boardController,
      required int count,
      dynamic indicatorEffect}) {
    return SmoothPageIndicator(
      controller: boardController,
      effect: indicatorEffect ??
          const WormEffect(
            dotColor: Colors.grey,
            activeDotColor: Colors.teal,
            dotHeight: AppSpacing.ap12,
            dotWidth: AppSpacing.ap12,
            spacing: AppSpacing.ap12,
          ),
      count: count,
    );
  }
}
