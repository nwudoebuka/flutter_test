import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  String? errorMessage;

  void clearError() {
    errorMessage = null;
  }

  void setError(e, String defaultMsg) {
    final error = e.response?.data ?? {};
    if (error != null) {
      // errorMessage = pick(error, 'message').asStringOrNull();
    }
  }
}
