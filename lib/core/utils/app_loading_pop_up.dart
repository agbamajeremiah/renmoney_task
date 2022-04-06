import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:injectable/injectable.dart';
import 'package:renmoney_task/core/core.dart';

/// [AppLoadingPopup] is loader that shows when sending or fetching data
@lazySingleton
class AppLoadingPopup {
  Future<dynamic> show(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Center(
            child: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
              child: const Center(
                child: SpinKitThreeBounce(
                  color: AppColors.purple,
                  size: 20,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
