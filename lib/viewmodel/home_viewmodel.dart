
import 'package:flutter/material.dart';

class HomeIndexViewModel extends ChangeNotifier{
  int _index = 0;

  int get index => _index;

  set index(int val) {
    _index = val;
    notifyListeners();
  }

  void switchIndex(int val){
    _index = val;
    notifyListeners();
  }
}