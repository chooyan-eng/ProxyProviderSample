import 'package:flutter/material.dart';

class AccountNotifier extends ChangeNotifier {
  var _isMember = false;

  bool get isMember => _isMember;
  set isMember(bool value) {
    _isMember = value;
    notifyListeners();
  }
}