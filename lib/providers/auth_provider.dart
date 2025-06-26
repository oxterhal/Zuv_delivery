import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;
  String? _merchantId;
  String? get token => _token;
  String? get merchantId => _merchantId;

  void setToken(String? val) {
    _token = val;
    notifyListeners();
  }

  void setMerchantId(String? value) {
    _merchantId = value;
    notifyListeners();
  }
}
