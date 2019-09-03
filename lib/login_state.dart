import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginState with ChangeNotifier {


  SharedPreferences _prefs, userEntered, passEntered;
  final _hcuser = 'admin@admin';
  final _hcpwd = 'admin';
  bool _loggedIn = false;
  bool _loading = true;

  LoginState() {
    loginState();
  }
  bool isLoggedIn() => _loggedIn;

  bool isLoading() => _loading;

  bool login(paramUser, paramPwd) {
    _loading = true;
    notifyListeners();

    _loading = false;
    if (_hcuser == paramUser && _hcpwd == paramPwd) {
      _prefs.setBool('isLoggedIn', true);
      _loggedIn = true;
      notifyListeners();
      return false;
    } else {
      _loggedIn = false;
      notifyListeners();
      return true;
    }
  }

  void logout() {
    _prefs.clear();
    _loggedIn = false;
    notifyListeners();
  }



  void loginState() async {
    _prefs = await SharedPreferences.getInstance();
    if (_prefs.containsKey('isLoggedIn')) {
      _loggedIn = userEntered != null;
      _loading = false;
      notifyListeners();
    } else {
      _loading = false;
      notifyListeners();
    }
  }
}