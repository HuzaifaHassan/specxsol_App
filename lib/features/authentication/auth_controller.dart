import 'package:flutter/material.dart';

class AuthController with ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  Future<void> login(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    if (email == 'test@example.com' && password == 'password') {
      _isLoggedIn = true;
    } else {
      _isLoggedIn = false;
    }
    notifyListeners();
  }

  Future<void> register(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    // Assume registration is always successful for now
    _isLoggedIn = true;
    notifyListeners();
  }

  Future<void> forgotPassword(String email) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    // Assume password reset email sent successfully
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}
