// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/api/api_comsumer.dart';
import 'package:shop_app/core/api/endPoints.dart';
import 'package:shop_app/core/errors/exeptions.dart';
import 'package:shop_app/model/shop_home_model.dart';
import 'package:shop_app/view/shop_home_layout/categories.dart/categories.dart';
import 'package:shop_app/view/shop_home_layout/favorites.dart/favoriests.dart';
import 'package:shop_app/view/shop_home_layout/proudcts.dart/products.dart';
import 'package:shop_app/view/shop_home_layout/settings.dart/settings.dart';


part 'shop_app_states.dart';

class ShopAppCubit extends Cubit<ShopAppStates> {
  ShopAppCubit(this.api) : super(ShopAppCubitInitial());
//------------api consumer-----
  ApiConsumer api;
  //----------------
  static ShopAppCubit get(context) => BlocProvider.of(context);

  //--------------------bottomnavbar-----

  int currentIndex = 0;
  chaneBottomNaveIndex(int index) {
    currentIndex = index;
    emit(ChangeBottonNaveState());
  }

  List<Widget> bottomNavScreens = [
    ShopProducts(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen()
  ];
  //---------------get Home data
  ShopHomeModel? homeModel;
  getHomeData() async {
    emit(ShopAppLoadingState());
    try {
      final response = await api.get(EndPoint.home );
      homeModel = ShopHomeModel.fromJson(response.data);
      print('home data=${homeModel!.status}');
      print('home data=${homeModel!.data!.banners![0].image}');
      emit(ShopAppSuccessState());
    } on ServerExeptions catch (e) {
      emit(ShopAppErrorState(e.errorModel.errorMessage));
    }
  }
}
