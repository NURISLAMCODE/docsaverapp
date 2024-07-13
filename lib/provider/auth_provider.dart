import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLogin = true;
  bool get isLogin => _isLogin;

  void setState() {
    _isLogin = !_isLogin;
    notifyListeners();
  }

  bool _isTroggole = true;
  bool get isTroggole => _isTroggole;
  setTroggole() {
    _isTroggole = !isTroggole;
    notifyListeners();
  }
}
