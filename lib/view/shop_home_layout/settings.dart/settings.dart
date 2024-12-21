// ignore_for_file: prefer_const_constructors, unused_local_variable, unnecessary_string_interpolations

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/controll/shop_app_cubit/shop_app_cubit.dart';
import 'package:shop_app/shared_in_app/custom_widgets/customButton.dart';
import 'package:shop_app/shared_in_app/custom_widgets/customTextFormField.dart';
import 'package:shop_app/shared_in_app/custom_widgets/sign_out.dart';
import 'package:shop_app/shared_in_app/custom_widgets/vhSpace.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: BlocConsumer<ShopAppCubit, ShopAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopAppCubit.get(context);
          nameController.text = cubit.getProfile!.data!.name!;
          phoneController.text = cubit.getProfile!.data!.phone!;
          emailController.text = cubit.getProfile!.data!.email!;
          return ConditionalBuilder(
              condition: cubit.getProfile != null,
              builder: (cotext) => SingleChildScrollView(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage:
                              NetworkImage('${cubit.getProfile!.data!.image!}'),
                        ),
                        VSpace(),
                        CustomTextFormField(
                          controller: nameController,
                          prefixicon: Icons.person,
                          label: 'name',
                          hint: 'Enter yourname',
                        ),
                        VSpace(),
                        CustomTextFormField(
                          controller: phoneController,
                        ),
                        VSpace(),
                        CustomTextFormField(
                          controller: emailController,
                          prefixicon: Icons.email,
                          label: 'email',
                          hint: 'Enter email',
                        ),
                        VSpace(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButton(
                              width: 150.0,
                              height: 50.0,
                              radius: 15.0,
                              color: Colors.blueAccent,
                              child: Text(
                                'Update profile',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              function: () {},
                            ),
                            CustomButton(
                              width: 150.0,
                              height: 50.0,
                              radius: 15.0,
                              color: Colors.blueAccent,
                              child: Text(
                                'Sign out',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              function: () {
                                signOut(context);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              fallback: (context) => Center(child: CircularProgressIndicator()));
        },
      ),
    ); //kill token
  }
}
