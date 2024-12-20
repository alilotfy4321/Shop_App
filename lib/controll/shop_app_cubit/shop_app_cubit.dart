// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/api/api_comsumer.dart';
import 'package:shop_app/core/api/endPoints.dart';
import 'package:shop_app/core/errors/exeptions.dart';
import 'package:shop_app/model/change_favorite_model.dart';
import 'package:shop_app/model/get_favorites.dart';
import 'package:shop_app/model/shop_categories_model.dart';
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
  //------------------appBar
  List<String> appBarTitles = ['Home', 'Categories', 'Favoriets', 'Settings'];

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
  Map<num?, bool?> favorites = {};
  getHomeData() async {
    emit(ShopAppLoadingState());
    try {
      final response = await api.get(EndPoint.home);
      homeModel = ShopHomeModel.fromJson(response.data);
      homeModel!.data!.products!.forEach((element) {
        favorites.addAll({element.id: element.inFavorites});
      });
      print('====================favorate data=${favorites.toString()}');
      print('====================home data=${homeModel!.status}');

      emit(ShopAppSuccessState());
    } on ServerExeptions catch (e) {
      emit(ShopAppErrorState(e.errorModel.errorMessage));
    }
  }

  //--------------getCategory Data
  ShopCategoriesModel? categoriesModel;
  getCategoriesData() async {
    emit(ShopAppLoadingState());
    try {
      final response = await api.get(EndPoint.categories);
      categoriesModel = ShopCategoriesModel.fromJson(response.data);
      print(
          '==========================category status=${categoriesModel!.status}');
      print(
          '==========================category data=${categoriesModel!.data!.data[0].image}');
      emit(ShopAppCategoriesSuccessState());
    } on ServerExeptions catch (e) {
      emit(ShopAppCategoriesErrorState(e.errorModel.errorMessage));
    }
  }

//------------------(add or delete)post favorite item------
  ChangeFavoratesModel? favoratesModel;
  changeFavoriteItems(productId) async {
    try {
      favorites[productId] = !favorites[productId]!;
      emit(ShopAppChangeFavoriteColorState());
      final response = await api.post(EndPoint.postFavorites, data: {
        'product_id': productId,
      });
      favoratesModel = ChangeFavoratesModel.fromJson(response.data);
      if (!favoratesModel!.status!) {
        //if some thing wrong return to previse color.
        favorites[productId] = !favorites[productId]!;
      } else {
        getFavoritesItems(); //get the new data to show in screen
      }
      emit(ShopAppFavoritesSuccessState(favoratesModel));
    } on ServerExeptions catch (e) {
      emit(ShopAppFavoritesErrorState(e.errorModel.errorMessage));
    }
  }

//--------getFavorites--------
  GetFavorites? getFavorites;
  getFavoritesItems() async {
    try {
      emit(ShopAppGetFavoritesLoadingState());
      await api.get(EndPoint.getFavorites).then((value) {
        getFavorites = GetFavorites.fromJson(value.data);
        print('get favoriteeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee=${getFavorites.toString()}');
        emit(ShopAppGetFavoritesSuccesState(getFavorites));
      });
    } on ServerExeptions catch (e) {
      emit(ShopAppGetFavoritesErrorState(e.errorModel.errorMessage));
    }
  }
}
