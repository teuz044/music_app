import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin Loader<T extends StatefulWidget> on State<T> {
  var isOpen = false;

  void showLoader() {
    if (!isOpen) {
      isOpen = true;
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Center(
            child: LoadingAnimationWidget.twistingDots(
            leftDotColor: const Color(0xFF1A1A3F),
            rightDotColor: Colors.grey,
            size: 100,
            ),
          );
        },
      );
    }
  }

  void hideLoader() {
    if (isOpen) {
      isOpen = false;
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  @override
  void dispose() {
    hideLoader();
    super.dispose();
  }
}
