import 'package:flutter/cupertino.dart';

class ExampleOneProvider with ChangeNotifier {
  double _value = 1.0;
  double get value => _value;

  void Setvalue(double val) {
    _value = val;
    notifyListeners();
  }
}
