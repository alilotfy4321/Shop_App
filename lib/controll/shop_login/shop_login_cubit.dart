// ignore_for_file: unused_import, unnecessary_import, unused_label

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/core/api/api_comsumer.dart';
import 'package:shop_app/core/api/api_interceptor.dart';
import 'package:shop_app/core/api/endPoints.dart';
import 'package:shop_app/core/errors/exeptions.dart';
import 'package:shop_app/shared_in_app/custom_widgets/Navigation.dart';
import 'package:shop_app/model/shop_login_model.dart';
import 'package:shop_app/shared_in_app/sharedpref.dart';
import 'package:shop_app/view/login/login.dart';

part 'shop_login_state.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit(this.api) : super(ShopLoginInitialState());
  //--------------------------
  ApiConsumer api;
  //--------------
  static ShopLoginCubit get(context) => BlocProvider.of(context);
  bool isPasswordLock = false;
//----------------------------------
  changePasswordLock() {
    isPasswordLock = !isPasswordLock;
    emit(ShopAppChangePasswordLockstate());
  }

  //------------------------------api login -------------
  ShopLoginModel? loginModel;
  
  userLogin({required email, required password}) async {
    emit(ShopLoginLoadingState());
    try {
      var response = await api.post(
        EndPoint.login,
        data: {
          AppKeys.signInEmail: email,
          AppKeys.signInPassword: password,
        },
      );
      
      loginModel = ShopLoginModel.fromJson(response.data);
      
      emit(ShopLoginSuccesState(loginModel));
    } on ServerExeptions catch (e) {
      emit(ShopLoginErrorState(e.errorModel.errorMessage));
    }
  }
}
