part of 'register_cubit.dart';

@immutable
abstract class ShopAppRegisterStates {}

class RegisterInitial extends ShopAppRegisterStates {}
class ShopRegisterLoadingState extends ShopAppRegisterStates {}
//---------------------------picture
class UploadProfilePicState extends ShopAppRegisterStates {}
//-----------------visiblity------------

class ChangePasswordVisibilityState extends ShopAppRegisterStates {}
class ShopAppRegisterChangePasswordLockstate extends ShopAppRegisterStates {}
//--sig up-----------------------------------------------
class ShopRegisterSuccesState extends ShopAppRegisterStates {
  ShopRegisterModel? registerModel;
 ShopRegisterSuccesState(this.registerModel);

}

class ShopRegisterErrorState extends ShopAppRegisterStates {
  final error;
  ShopRegisterErrorState(this.error);
}

