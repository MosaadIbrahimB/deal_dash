import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(
  String msg,
) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: ColorManager.whitGreen,
    textColor: ColorManager.primary,
    fontSize: 16,
  );
}