import 'package:fluttertoast/fluttertoast.dart';
import 'package:customers_manager/src/presentation/res/AppColors.dart' as colors;
import 'package:customers_manager/src/presentation/res/AppDimens.dart' as dimens;

class CustomToast {
  static void show(String msg) => Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: colors.AppColors.white,
      textColor: colors.AppColors.black,
      fontSize: dimens.AppDimens.toast,
    timeInSecForIosWeb: 1,
  );

  static void cancelAll() => Fluttertoast.cancel();
}
