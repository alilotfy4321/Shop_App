part of 'shop_app_cubit.dart';

@immutable
abstract class ShopAppStates {}

class ShopAppCubitInitial extends ShopAppStates {}

class ChangeBottonNaveState extends ShopAppStates {}

class ShopAppLoadingState extends ShopAppStates {}
//------------------------------------ home

class ShopAppSuccessState extends ShopAppStates {}

class ShopAppErrorState extends ShopAppStates {
  final error;
  ShopAppErrorState(this.error);
}
//---------------------------------------------categoreis

class ShopAppCategoriesSuccessState extends ShopAppStates {}

class ShopAppCategoriesErrorState extends ShopAppStates {
  final error;
  ShopAppCategoriesErrorState(this.error);
}

//---------------------------------------------postFavorites---
class ShopAppChangeFavoriteColorState extends ShopAppStates {}

class ShopAppFavoritesSuccessState extends ShopAppStates {
  ChangeFavoratesModel? favoreteModel;
  ShopAppFavoritesSuccessState(this.favoreteModel);
}

class ShopAppFavoritesErrorState extends ShopAppStates {
  final error;
  ShopAppFavoritesErrorState(this.error);
}

//---------------------------------------------postFavorites---
class ShopAppGetFavoritesLoadingState extends ShopAppStates {}

class ShopAppGetFavoritesSuccesState extends ShopAppStates {
  GetFavorites? getFavoreteModel;
  ShopAppGetFavoritesSuccesState(this.getFavoreteModel);
}

class ShopAppGetFavoritesErrorState extends ShopAppStates {
  final error;
  ShopAppGetFavoritesErrorState(this.error);
}
