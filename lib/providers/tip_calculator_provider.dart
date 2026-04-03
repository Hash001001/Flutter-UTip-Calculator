import 'dart:core';

import 'package:flutter/material.dart';

class TipCalculatorModel extends ChangeNotifier{

  int _personCount = 1;
  double _tipPercentage = 0.0;
  double _billTotal = 0.0;
  
  //getters for retriving these value

  int get personCount  =>  _personCount;

  double get tipPercentage => _tipPercentage;

  double get billTotal => _billTotal;


  void updatePersonCount(int value){
    _personCount = value;
    notifyListeners();
  }

  void updateBillTotal(double value){
    _billTotal = value;
    notifyListeners();
  }

  void updateTipPercentage(double value){
    _tipPercentage = value;
    notifyListeners();
  }

  double get billPerPerson => (_billTotal * _tipPercentage) + (_billTotal) / _personCount;

  


}
