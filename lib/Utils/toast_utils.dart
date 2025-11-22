import 'package:evently/Utils/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static void showToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.primaryLight,
      textColor: AppColors.whiteColor,
      fontSize: 16.0,
    );
  }
}
