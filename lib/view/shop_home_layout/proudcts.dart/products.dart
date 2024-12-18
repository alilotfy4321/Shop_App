// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/controll/shop_app_cubit/shop_app_cubit.dart';
import 'package:shop_app/view/shop_home_layout/proudcts.dart/products_builder.dart';


class ShopProducts extends StatelessWidget {
  const ShopProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopAppCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.homeModel != null,
          builder: (context) => ProductsBuilder(cubit.homeModel!, context),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    ); 
  }

}
