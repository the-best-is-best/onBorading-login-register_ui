import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        urlImage: const $AssetsSvgGen().onBoard1.path),
    OnBoarding(
        title: 'Connect with the world',
        description:
            'See All things happening around the world by a click in your phone.',
        urlImage: const $AssetsSvgGen().onboard2.path),
    OnBoarding(
        title: "Let's Get Started",
        description: "Let's see what we get",
        urlImage: const $AssetsSvgGen().onboard3.path),
  ];
  final boardController = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.ap12),
            child: Column(children: [
              Align(
                alignment: Alignment.topRight,
                child: MyButton(
                  text: 'Skip',
                  btnColor: const Color.fromARGB(255, 255, 217, 48),
                  txtColor: Colors.black,
                  borderSize: 50,
                  onPressed: () {
                    context.pushReplacement(const LoginView());
                  },
                  width: 75,
                ),
              ),
              SizedBox(
                child: Image.asset(
                  const $AssetsImagesGen().logo.path,
                  fit: BoxFit.contain,
                  height: 130.h,
                ),
              ),
              SizedBox(
                height: .5.sh,
                child: PageView(
                  allowImplicitScrolling: true,
                  controller: boardController,
                  children: _onBoardingData
                      .map((item) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSpacing.ap20),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    item.urlImage,
                                    fit: BoxFit.contain,
                                    height: .3.sh,
                                  ),
                                  const SizedBox(
                                    height: AppSpacing.ap12,
                                  ),
                                  Text(
                                    item.title,
                                    style: getMediumStyle(),
                                  ),
                                  const SizedBox(
                                    height: AppSpacing.ap12,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: AppSize.ap8),
                                    child: Text(
                                      item.description,
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      style: getRegularStyle(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
              Center(
                child: buildIndicator(
                    boardController: boardController,
                    count: _onBoardingData.length),
              ),
              SizedBox(height: AppSize.ap30.h),
              SizedBox(
                width: context.width,
                child: Center(
                  child: MyButton(
                      text: 'Get Started',
                      onPressed: () {
                        context.pushReplacement(const LoginView());
                      },
                      borderSize: AppSize.ap8,
                      btnColor: Colors.teal),
                ),
              ),
              SizedBox(height: AppSize.ap30.h),
              Center(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
              )
            ]),
          ),
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
            activeDotColor: Color.fromARGB(255, 196, 148, 66),
            dotHeight: AppSpacing.ap12,
            dotWidth: 30,
            spacing: AppSpacing.ap12,
          ),
      count: count,
    );
  }
}
