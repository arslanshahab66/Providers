import 'package:flutter/cupertino.dart';

class CountProvider with ChangeNotifier {
  int _count = 10;
  int get count => _count;

  Setcount() {
    _count++;
    notifyListeners();
  }
}
