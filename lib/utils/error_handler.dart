import 'package:flutter_colored_print/flutter_colored_print.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:google_play_shop/utils/api_exception.dart';
import 'package:google_play_shop/utils/helper.dart';
import 'package:google_play_shop/utils/toaster.dart';
import 'package:nb_utils/nb_utils.dart';

class ErrorHandler {
  static Future<String?> handle(error) async {
    if (error is BadRequestException) {
      var message = error.message ?? 'Unprocessable Entity';
      Toaster.showError(context: getContext, text: message);
      return message;
    } else if (error is FetchDataException) {
      var message = error.message ?? 'Unprocessable Entity';
      Toaster.showError(context: getContext, text: message);
      primary("$message\n${error.url}");
      return message;
    } else if (error is ApiNotRespondingException) {
      var message = error.message ?? 'Oops! It took longer to respond.';
      Toaster.showError(context: getContext, text: message);
      return message;
    } else if (error is UnAuthorizedException) {
      var message = error.message ?? 'Unauthorized';
      Toaster.showError(context: getContext, text: message);
      if (!getUserToken().isEmptyOrNull) {
        bool loggedOut = await deleteUserToken();
        if (loggedOut) {
          Future.delayed(Duration.zero, () {
            Phoenix.rebirth(getContext);
          });
        }
      }
      return message;
    } else if (error is NotAuthorizedException) {
      var message = error.message ?? 'Not Authorized To Access';
      Toaster.showError(context: getContext, text: message);
      return message;
    } else if (error is NotFoundException) {
      var message = error.message ?? 'Not Found';
      Toaster.showError(context: getContext, text: message);
      return message;
    } else if (error is SuspendedRequestException) {
      var message = error.message ?? "You maybe suspended";
      Toaster.showError(context: getContext, text: message);
      return message;
    } else if (error is TooManyRequestsException) {
      var message = error.message ?? 'Too Many Attempts';
      Toaster.showError(context: getContext, text: message);
      return message;
    }

    return "Unknown error!";
  }
}
