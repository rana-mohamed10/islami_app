import 'package:flutter/material.dart';

//observal object
//subject
//provider

class SettingProvider extends ChangeNotifier{
  ThemeMode currentTheme=ThemeMode.light;
  String currentlocale='en';

  void changeTheme(ThemeMode newMode){
    if (currentTheme==newMode)return;
    currentTheme=newMode;
    notifyListeners();

  }
  void ChangeLang(locale){
    if (currentlocale==locale)return;
    currentlocale='ar';
    notifyListeners();
  }
  String GetBackground(){
    return currentTheme==ThemeMode.dark
        ? 'assets/images/bg.png'
        : 'assets/images/main_background.jpg';
  }
  bool IsDarkEnabled(){
    return currentTheme==ThemeMode.dark;
  }

}