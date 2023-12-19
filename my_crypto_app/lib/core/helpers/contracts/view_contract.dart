import '../../../core/core.dart';

abstract class BaseViewContract {
  Widget build(BuildContext context);
}

abstract class StatusViewContract  {
  void showLoading();
  void hideLoading();
  void showError(String message);
  void showSuccess(String message);
  void showWarning(String message);
}
