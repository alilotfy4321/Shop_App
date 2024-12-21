// ignore_for_file: unused_local_variable, unnecessary_string_interpolations, prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/controll/shop_app_register/register_cubit.dart';
import 'package:shop_app/shared_in_app/constants/constant.dart';
import 'package:shop_app/shared_in_app/custom_widgets/Navigation.dart';
import 'package:shop_app/shared_in_app/custom_widgets/customButton.dart';
import 'package:shop_app/shared_in_app/custom_widgets/toastWidget.dart';
import 'package:shop_app/view/login/login.dart';

import 'package:shop_app/view/register/pic_profile_picture.dart';

import '../../shared_in_app/custom_widgets/customTextFormField.dart';
import '../../shared_in_app/custom_widgets/vhSpace.dart';
import '../../shared_in_app/sharedpref.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocConsumer<ShopRegisterCubit, ShopAppRegisterStates>(
      listener: (context, state) async{
        if (state is ShopRegisterSuccesState) {
          if (state.registerModel!.status!) {
            showToast(
              text: '${state.registerModel!.message!}',
              toaststate: ToastState.SUCSSES,
            );
            await CachHelper.saveUserCacheKey(
                    'token', state.registerModel!.data!.token!)
                .then((value) {
              //if you  make sign out you need this becouse app did not pass any token to token in main app from cache
              token = state.registerModel!.data!.token!;
              navigateAndFinish(context, LoginPage());
            });
          } else {
            showToast(
              text: '${state.registerModel!.message!}',
              toaststate: ToastState.ERROR,
            );
          }
        }
      },
      builder: (context, state) {
        var cubit = ShopRegisterCubit.get(context);
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
                      'Register',
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: Colors.black,
                              ),
                      textAlign: TextAlign.start,
                    ),
                    VSpace(),
                    PicprofilePicWidget(),
                    VSpace(),
                    CustomTextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      label: ' name',
                      hint: 'enter name',
                      prefixicon: Icons.person,
                    ),
                    VSpace(),
                    CustomTextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      label: ' phone',
                      hint: 'enter phone',
                      prefixicon: Icons.person,
                    ),
                      VSpace(),
                    CustomTextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      label: ' email',
                      hint: 'enter email',
                      prefixicon: Icons.person,
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
                            cubit.changePasswordVisibility();
                          },
                          icon: (cubit.isPasswordLock)
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility)),
                    ),
                    VSpace(),
                    //ConditionalBuilder(),
                    ConditionalBuilder(
                      condition: state is! ShopRegisterLoadingState,
                      builder: (context) => Center(
                        child: CustomButton(
                          width: 300,
                          height: 50,
                          child: Text('Register',style: Theme.of(context).textTheme.headlineLarge,),
                          color: Colors.blueAccent,
                          function: () {
                            if (_formKey.currentState!.validate()) {
                              cubit.userRegister(//register-----------------------
                                name: nameController.text,
                                phone: phoneController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                image: profilePic!,
                              );
                              nameController.clear();
                              emailController.clear();
                               phoneController.clear();
                              passwordController.clear();

                              //--------
                            }
                          },
                        ),
                      ),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator()),
                    ),
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
