// ignore_for_file: unused_import, unnecessary_import, unused_label

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/model/shop_login_model.dart';
import 'package:shop_app/network/remote(dio)/endPoints.dart';
import 'package:shop_app/network/remote(dio)/shop_dio.dart';

part 'shop_login_state.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());
  static ShopLoginCubit get(context) => BlocProvider.of(context);
  bool isPasswordLock = false;
//----------------------------------
  changePasswordLock() {
    isPasswordLock = !isPasswordLock;
    emit(ShopAppChangePasswordLockstate());
  }

  //--------api-------------
  ShopLoginModel? loginModel;

  //----------------------
  userLogin({required email, required password}) async {
    emit(ShopLoginLoadingState());

    await DioHelper.postData(
      path: LOGIN,
      data: {
        "email": "alilotfy4321@gmail.com",
        "password": "123456",
      },
    ).then((value) {
      print(value.data.toString());
      loginModel = ShopLoginModel.fromJson(value.data);
      print(loginModel!.message);
      emit(ShopLoginSuccesState());
    }).catchError((e) {
      print(e.toString());
      emit(ShopLoginErrorState(e));
    });
  }
  //----------------
}
