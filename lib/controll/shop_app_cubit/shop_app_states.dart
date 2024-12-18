part of 'shop_app_cubit.dart';

@immutable
abstract class ShopAppStates {}

class ShopAppCubitInitial extends ShopAppStates {}

class ChangeBottonNaveState extends ShopAppStates {}

class ShopAppLoadingState extends ShopAppStates {}

class ShopAppSuccessState extends ShopAppStates {}

class ShopAppErrorState extends ShopAppStates {
  final error;
  ShopAppErrorState(this.error);
}
