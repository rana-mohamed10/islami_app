import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//observal object
//subject
//provider

class SettingProvider extends ChangeNotifier{
  ThemeMode currentTheme=ThemeMode.light;
  SharedPreferences? preference;
  String currentlocale='en';

  void changeTheme(ThemeMode newMode){
    if (currentTheme==newMode)return;
    currentTheme=newMode;
    SaveTheme(newMode);
    notifyListeners();

  }
  void ChangeLang(locale){
    if (currentlocale==locale)return;
    currentlocale=locale;
    SaveLocale(locale);
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

  Future<void>SaveTheme(ThemeMode theme)async{
    String mode= theme==ThemeMode.dark
        ?'dark'
        :'light';
    await preference?.setString('theme', mode);
  }

  String? getTheme(){
    return preference?.getString('theme');
  }
  Future<void>loadTheme() async{
    preference= await SharedPreferences.getInstance();
    String? theme=getTheme();
    if (theme !=null){
      theme=='dark'
          ?currentTheme=ThemeMode.dark
          :currentTheme=ThemeMode.light;
    }
  }
  Future<void>SaveLocale(String locale)async{
    String lang= locale=='en'
        ?'en'
        :'ar';
    await preference?.setString('language', lang);
  }

  String? getLocale(){
    return preference?.getString('language');
  }
  Future<void>loadLocale() async{
    preference= await SharedPreferences.getInstance();
    String? locale=getLocale();
    if (locale !=null){
      locale=='en'
          ?currentlocale='en'
          :currentlocale='ar';
    }
  }

}