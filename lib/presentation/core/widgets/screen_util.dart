import 'package:flutter/material.dart';
import 'package:posts_app/presentation/core/widgets/loading.dart';

abstract class ScreenUtil {
  bool loading = false;
  void showLoading(BuildContext context) {
    loading = true;
    showDialog(
        context: context,
        builder: (context) => WillPopScope(
            child: const LoadingWidget(), onWillPop: () => Future.value(false)),
        barrierDismissible: false);
  }

  void stopLoading(BuildContext context) {
    if (loading) {
      Navigator.pop(context);
      loading = false;
    }
  }

  void showErrorFlushMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(getSnackBar(false, message));
  }

  void showSuccessFlushMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(getSnackBar(true, message));
  }
}

SnackBar getSnackBar(bool success, String message) {
  return SnackBar(
    behavior: SnackBarBehavior.fixed,
    padding: const EdgeInsets.only(left: 20, top: 2, right: 2, bottom: 2),
    backgroundColor: success ? Colors.green : Colors.red,
    content: ListTile(
      contentPadding: const EdgeInsets.all(2),
      title: Text(
        success ? "Success" : "Fail",
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      subtitle: Text(
        message,
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
      tileColor: success ? Colors.green : Colors.red,
    ),
  );
}
