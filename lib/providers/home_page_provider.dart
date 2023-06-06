import 'package:flutter/cupertino.dart';

class HomePageProvider with ChangeNotifier {
  bool? isEligible;
  String? eligibiltymessage = '';

  void checkEligibilty(int age) {
    if (age >= 18) {
      isEligible = true;
      eligibiltymessage = 'you are eligible';
      notifyListeners();
    } else {
      
        isEligible = false;
        eligibiltymessage = 'you are not eligible!';
        notifyListeners();
      
    }
  }
}
