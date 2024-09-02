import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class Toaster {

  static bool _isToastShowing = false;
  static const Duration _duration = Duration(seconds: 3);

  //show toast
  static void show({required BuildContext context, required String text, ToastType type = ToastType.normal}) async {
    if(!_isToastShowing) {
      _isToastShowing = true;
      FToast fToast = FToast();
      fToast.init(context);

      Color color = Theme.of(context).primaryColor;
      IconData icon = Icons.info_outline_rounded;

      switch(type) {
        case ToastType.success:
          color = Colors.green;
          icon = Icons.check;
          break;
        case ToastType.error:
          color = Colors.redAccent;
          icon = Icons.close;
          break;
        case ToastType.warning:
          color = const Color.fromRGBO(204, 204, 0, 1.0);
          icon = Icons.warning_amber_outlined;
          break;
        default:
          break;
      }

      Widget toast = Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),

            12.width,
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
      fToast.showToast(
        child: toast,
        toastDuration: _duration,
        gravity: ToastGravity.BOTTOM,
      );
      await Future.delayed(_duration);
      _isToastShowing = false;
    }
  }

  static void showError({required BuildContext context, required String text,}){
    return show(context: context, text: text , type: ToastType.error);
  }

  static void showSuccess({required BuildContext context, required String text,}){
    return show(context: context, text: text , type: ToastType.success);
  }
}

enum ToastType{
  normal,
  success,
  error,
  warning
}