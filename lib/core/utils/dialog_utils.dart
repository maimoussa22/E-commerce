import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoading(BuildContext context, {required String message}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black87,
          content: Row(
            children: [
              const CircularProgressIndicator(color: Colors.white),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  message,
                  style: AppStyles.regular18White,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  static void showMessage({
    required BuildContext context,
    required String message,
    String? title,
    String? posActionName,
    Function? posAction,
    String? negActionName,
    Function? negAction,
  }) {
    List<Widget> actions = [];

    if (posActionName != null) {
      actions.add(TextButton(
        onPressed: () {
          Navigator.pop(context);
          posAction?.call();
        },
        child: Text(
          posActionName,
          style: const TextStyle(color: Colors.blue),
        ),
      ));
    }

    if (negActionName != null) {
      actions.add(TextButton(
        onPressed: () {
          Navigator.pop(context);
          negAction?.call();
        },
        child: Text(
          negActionName,
          style: const TextStyle(color: Colors.red),
        ),
      ));
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: title != null
              ? Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
              : null,
          content: Text(
            message,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
          actions: actions,
        );
      },
    );
  }
}
