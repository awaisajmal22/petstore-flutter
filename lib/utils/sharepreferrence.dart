import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref extends ChangeNotifier {
  String? user;
  bool? check = false;
  void savePref(String uid) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('user', uid);
    user = pref.getString('user');
    if (user != null) {
      check = true;
      notifyListeners();
    } else if (user == null) {
      check = false;
      notifyListeners();
    }
  }

  void removeData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('user');
    pref.clear();
    user = null;
    check = false;
    print(user);
    print(check);
    notifyListeners();
  }
}
