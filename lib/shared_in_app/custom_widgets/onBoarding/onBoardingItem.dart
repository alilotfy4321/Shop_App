// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:shop_app/shared_in_app/custom_widgets/vhSpace.dart';
import 'package:shop_app/view/onBording/onboarding.dart';

Widget CustomOnboardingItem(OnBoardingModel list) =>
    Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Center(
        child: Text(
          list.headTilte!,
          style: const TextStyle(
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
