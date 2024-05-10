// ignore_for_file: use_key_in_widget_constructors, unused_import, unused_local_variable, prefer_initializing_formals, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:shop_app/constants/onboardingList.dart';
import 'package:shop_app/controll/shop_login/shop_login_cubit.dart';
import 'package:shop_app/custom_widgets/Navigation.dart';
import 'package:shop_app/custom_widgets/onBoarding/onBoardingItem.dart';
import 'package:shop_app/custom_widgets/vhSpace.dart';
import 'package:shop_app/network/local(sharedPref)/sharedpref.dart';
import 'package:shop_app/view/login/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class OnBoardingScreen extends StatelessWidget {
  bool isLast = false;
  void submitOnboardingPref(context) {
    CachHelper.SaveUserKey('onboarding', true).then((value) {
      if (value) {
        navigateAndFinish(context, LoginPage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var onboarderController = PageController();

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                submitOnboardingPref(context);
              },
              child: const Text('skip')),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: onboarderController,
              itemBuilder: ((context, index) =>
                  CustomOnboardingItem(onBoardingList[index])),
              itemCount: onBoardingList.length,
              onPageChanged: (i) {
                if (i == onBoardingList.length - 1) {
                  print('last');
                  isLast = true;
                } else {
                  print(i);
                  isLast = false;
                }
              },
            ),
          ),
          Row(
            children: [
              SmoothPageIndicator(
                controller: onboarderController,
                count: onBoardingList.length,
                effect: SwapEffect(),
                //  const ExpandingDotsEffect(
                //   expansionFactor: 4,
                //   dotWidth: 10,
                //   spacing: 5,
                // ),
              ),
              Spacer(),
              FloatingActionButton(
                onPressed: () {
                  if (isLast) {
                    submitOnboardingPref(context);
                  } else {
                    onboarderController.nextPage(
                        duration: const Duration(
                          seconds: 1,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn);
                  }
                },
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
