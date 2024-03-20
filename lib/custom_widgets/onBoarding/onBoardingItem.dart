import 'package:flutter/cupertino.dart';
import 'package:shop_app/custom_widgets/vhSpace.dart';
import 'package:shop_app/model/onboarding.dart';

Widget CustomOnboardingItem(OnBoardingModel list) =>
    Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Center(
        child: Text(
          list.headTilte!,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      VSpace(),
      Image.asset(list.image!),
      VSpace(),
      Center(
        child: Text(
          list.bodyText!,
          textAlign: TextAlign.center,
        ),
      ),
    ]);
