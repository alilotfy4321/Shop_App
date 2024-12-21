import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/core/api/api_comsumer.dart';
import 'package:shop_app/core/api/endPoints.dart';
import 'package:shop_app/core/errors/exeptions.dart';
import 'package:shop_app/core/functions/upload_image_to_api.dart';
import 'package:shop_app/model/register_model.dart';

part 'register_state.dart';

class ShopRegisterCubit extends Cubit<ShopAppRegisterStates> {
  ShopRegisterCubit(this.api) : super(RegisterInitial());

  ApiConsumer api;
  static ShopRegisterCubit get(context) => BlocProvider.of(context);
  XFile? profilePic;
  uploadProfilePic(XFile? image) {
    profilePic = image;
    emit(UploadProfilePicState());
  }

  bool isPasswordLock = false;
  void changePasswordVisibility() {
    isPasswordLock = !isPasswordLock;
    emit(ChangePasswordVisibilityState());
  }

//---------ShopRegisterModel
  ShopRegisterModel? registerModel;
  userRegister({required name,required phone,required email,required password, required image}) async {
    emit(ShopRegisterLoadingState());
    try {
      var response = await api.post(
        EndPoint.register,
        data: {
          AppKeys.registerName:name,
          AppKeys.registerPhone:phone,
          AppKeys.registerEmail:email,
          AppKeys.registerPassword:password,
          AppKeys.registerProfilePic:await uploadImageToApi(profilePic!),
          
        },
        isFormData: true,
      );

      registerModel = ShopRegisterModel.fromJson(response.data);

      emit(ShopRegisterSuccesState(registerModel!));
    } on ServerExeptions catch (e) {
      emit(ShopRegisterErrorState(e.errorModel.errorMessage));
    }
  }
}
