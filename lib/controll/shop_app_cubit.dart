import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shop_app_state.dart';

class ShopAppCubit extends Cubit<ShopAppStates> {
  ShopAppCubit() : super(ShopAppInitialState());
  static ShopAppCubit get(context) => BlocProvider.of(context);
  bool isPasswordLock = false;

  changePasswordLock() {
    isPasswordLock = !isPasswordLock;
    emit(ShopAppChangePasswordLockstate());
  }
}
