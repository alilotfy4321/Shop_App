import 'package:shop_app/shared_in_app/custom_widgets/Navigation.dart';
import 'package:shop_app/shared_in_app/sharedpref.dart';
import 'package:shop_app/view/login/login.dart';

signOut(context)async{
await  CachHelper.removeCachedDate('token').then((value) {
              navigateAndFinish(context, LoginPage());
            });
}