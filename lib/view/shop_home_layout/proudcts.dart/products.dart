// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/controll/shop_app_cubit/shop_app_cubit.dart';
import 'package:shop_app/model/shop_home_model.dart';

class ShopProducts extends StatelessWidget {
  ShopProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopAppCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.homeModel != null,
          builder: (context) => productsBuilder(cubit.homeModel!),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    ); //cubit.bottomNavScreens[cubit.currentIndex],
  }

  Widget productsBuilder(ShopHomeModel model) {
    return Column(
      children: [
        CarouselSlider(
          items: model.data!.banners!
              .map(
                (item) => Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage('${item.image}'),
                        fit: BoxFit.cover,
                      ),
                    )),
              )
              .toList(),
          options: CarouselOptions(
            height: 200,
            aspectRatio: 16 / 9,
            viewportFraction: 1.0,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}
