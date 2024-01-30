import '../core/dialog.dart';
import 'api_constants.dart';
import 'app_exceptions.dart';

class BaseController {
  static void handleError(error) {
    hideLoading();
    if (error is BadRequestException) {
      var message = error.message;
      DialogHelper.showErrorDialog(description: message);
    } else if (error is FetchDataException) {
      var message = error.message;
      DialogHelper.showErrorDialog(description: message);
    } else if (error is ApiNotRespondingException) {
      DialogHelper.showErrorDialog(description: ApiConstants.notRespondingMessage);
    }  else if (error is UnAuthorizedException) {
      var message = error.message;
      DialogHelper.showErrorDialog(description: message);
    }
  }

  static showLoading([String? message]) {
    DialogHelper.showLoading(message);
  }

  static hideLoading() {
    DialogHelper.hideLoading();
  }
}