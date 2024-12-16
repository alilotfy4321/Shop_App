part of 'shop_login_cubit.dart';

@immutable
abstract class ShopLoginStates {}

class ShopLoginInitialState extends ShopLoginStates {}

class ShopLoginLoadingState extends ShopLoginStates {}

class ShopLoginSuccesState extends ShopLoginStates {
  final ShopLoginModel loginModel;
  ShopLoginSuccesState(this.loginModel);

}

class ShopLoginErrorState extends ShopLoginStates {
  final error;
  ShopLoginErrorState(this.error);
}

class ShopAppChangePasswordLockstate extends ShopLoginStates {}
