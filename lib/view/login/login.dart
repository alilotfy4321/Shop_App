// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/controll/shop_app_cubit.dart';
import 'package:shop_app/custom_widgets/Navigation.dart';
import 'package:shop_app/custom_widgets/customButton.dart';
import 'package:shop_app/custom_widgets/customTextFormField.dart';
import 'package:shop_app/custom_widgets/vhSpace.dart';
import 'package:shop_app/view/signUp/signUP.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocBuilder<ShopAppCubit, ShopAppStates>(
      builder: (context, state) {
        var cubit = ShopAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  VSpace(),
                  Text(
                    'login now to browse our offers',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  VSpace(),
                  CustomTextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    label: ' email',
                    hint: 'enter email',
                    prefixicon: Icons.email,
                  ),
                  VSpace(),
                  CustomTextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    label: ' password',
                    hint: 'password',
                    ispasswordLock: cubit.isPasswordLock,
                    prefixicon: Icons.lock,
                    suffixIcon: IconButton(
                        onPressed: () {
                          cubit.changePasswordLock();
                        },
                        icon: (cubit.isPasswordLock)
                            ? Icon(Icons.remove_red_eye)
                            : Icon(Icons.remove_red_eye_outlined)),
                  ),
                  VSpace(),
                  CustomButton(
                      color: Colors.teal,
                      width: 300,
                      child: Text('login'),
                      function: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('login Succesfully')),
                          );
                        }
                      }),
                  VSpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      TextButton(
                          onPressed: () {
                            navigateTo(context, SignUPScreen());
                          },
                          child: const Text('Register'))
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
