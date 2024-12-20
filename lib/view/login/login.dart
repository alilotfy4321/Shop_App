// ignore_for_file: unused_local_variable, unused_import, use_key_in_widget_constructors, prefer_const_constructors, unnecessary_string_interpolations

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:shop_app/controll/shop_login/shop_login_cubit.dart';
import 'package:shop_app/core/api/dio_consumer.dart';
import 'package:shop_app/shared_in_app/constants/constant.dart';
import 'package:shop_app/shared_in_app/custom_widgets/Navigation.dart';
import 'package:shop_app/shared_in_app/custom_widgets/customButton.dart';
import 'package:shop_app/shared_in_app/custom_widgets/customTextFormField.dart';
import 'package:shop_app/shared_in_app/custom_widgets/toastWidget.dart';
import 'package:shop_app/shared_in_app/custom_widgets/vhSpace.dart';
import 'package:shop_app/shared_in_app/sharedpref.dart';
import 'package:shop_app/view/shop_home_layout/proudcts.dart/products.dart';
import 'package:shop_app/view/shop_home_layout/shop_home_layout.dart';
import 'package:shop_app/view/register/register_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocConsumer<ShopLoginCubit, ShopLoginStates>(
      listener: (context, state) async {
        if (state is ShopLoginSuccesState) {
          if (state.loginModel!.status!) {
            showToast(
              text: '${state.loginModel!.message!}',
              toaststate: ToastState.SUCSSES,
            );
            await CachHelper.saveUserCacheKey(
                    'token', state.loginModel!.data!.token!)
                .then((value) {
              //if you  make sign out you need this becouse app did not pass any token to token in main app from cache
              token = state.loginModel!.data!.token!;
              navigateAndFinish(context, ShopHomeLayout());
            });
          } else {
            showToast(
              text: '${state.loginModel!.message!}',
              toaststate: ToastState.ERROR,
            );
          }
        }

        if (state is ShopLoginLoadingState) {
          showToast(
            text: '< صلي علي النبي< بيحمل',
            toaststate: ToastState.LOADING,
          );
        }
      },
      builder: (context, state) {
        //---------------------------------------------
        var cubit = ShopLoginCubit.get(context);
        //---------------------------------------
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: Colors.black,
                              ),
                      textAlign: TextAlign.start,
                    ),
                    VSpace(),
                    Text(
                      'Login now to browse our offers',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility)),
                    ),
                    VSpace(),
                    //ConditionalBuilder(),
                    ConditionalBuilder(
                      condition: state is! ShopLoginLoadingState,
                      builder: (context) => Center(
                        child: CustomButton(
                          width: 300,
                          child: Text('LOGIN'),
                          function: () {
                            if (_formKey.currentState!.validate()) {
                              cubit.userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                              emailController.clear();
                              passwordController.clear();

                              //--------
                            }
                          },
                        ),
                      ),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator()),
                    ),

                    VSpace(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account?'),
                        TextButton(
                            onPressed: () {
                              navigateAndFinish(context, RegisterScreen());
                            },
                            child: const Text('Register'))
                      ],
                    ),
                    VSpace(),
                    Divider(
                      height: 1,
                      thickness: 3,
                      color: Colors.grey[300],
                    ),
                    VSpace(),
                    Text(
                      'signUp With',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    VSpace(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            Icons.facebook,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ),
                        HSpace(),
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.google,
                            color: Color.fromARGB(158, 50, 77, 16),
                            size: 30,
                          ),
                        ),
                        HSpace(),
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.linkedin,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
