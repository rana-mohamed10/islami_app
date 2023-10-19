import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islami_app/Providers/SettingsProvider.dart';
import 'package:islami_app/home/HomeScreen.dart';
import 'package:provider/provider.dart';


class SplashScreen extends StatelessWidget {
  static const String routeName = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingProvider>(context);
    return FutureBuilder(
      future: settingProvider.loadTheme(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show loading indicator while waiting
        } else {
          String? theme = settingProvider.getTheme();
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).pushNamed(HomeScreen.routeName);
          });
          return Scaffold(
            body: Image(
              fit: BoxFit.fill,
              width: double.infinity,
              image: theme == 'light'
                  ? AssetImage('assets/images/splash.png')
                  : AssetImage('assets/images/splash – 1.png'),
            ),
          );
        }
      },
    );
  }


}