import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';

/// [FlushBarNotification] class for displaying notification /messsge to the  user

class FlushBarNotification {
  /// [showErrorMessage] show error message
  static dynamic showErrorMessage({
    required BuildContext context,
    String title = 'Error',
    required String message,
  }) {
    var fh = FlushbarHelper.createError(
      message: message,
      title: title,
      duration: const Duration(
        seconds: 3,
      ),
    );
    fh.show(context);
  }

  /// [showSuccessMessage] show success message
  static dynamic showSuccessMessage({
    required BuildContext context,
    String title = 'Success',
    required String message,
  }) {
    var fh = FlushbarHelper.createSuccess(
      message: message,
      title: title,
      duration: const Duration(
        seconds: 3,
      ),
    );
    fh.show(context);
  }
}
