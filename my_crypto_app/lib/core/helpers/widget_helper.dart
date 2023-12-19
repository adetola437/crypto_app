import '../core.dart';

abstract class IWidgetHelper {
  Future<dynamic> showModalBottomSheetView(BuildContext context, Widget child);
  void showLoading();
  void hideLoading();
  void showError(String message);
  void showSuccess(String message);
  void showWarning(String message);
}

class WidgetHelper implements IWidgetHelper {

  @override
  Future<dynamic> showModalBottomSheetView(BuildContext context, Widget child, {bool isScrollControlled = true}) async {
    return await showModalBottomSheet(
      context: context,
      isScrollControlled: isScrollControlled,
      builder: (context) => child,
    );
  }

  @override
  void hideLoading() {
    // TODO: implement hideLoading
  }

  @override
  void showError(String message) {
    // TODO: implement showError
  }

  @override
  void showLoading() {
    // TODO: implement showLoading
  }

  @override
  void showSuccess(String message) {
    // TODO: implement showSuccess
  }

  @override
  void showWarning(String message) {
    // TODO: implement showWarning
  }
}
