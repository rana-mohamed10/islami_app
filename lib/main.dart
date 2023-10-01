import 'package:flutter/material.dart';
import 'package:islami_app/MyThemeData.dart';
import 'package:islami_app/Providers/SettingsProvider.dart';
import 'package:islami_app/chapter_details/ChapterDetails.dart';
import 'package:islami_app/home/HomeScreen.dart';
import 'package:islami_app/home/tasbeh/TasbehTab.dart';
import 'package:provider/provider.dart';
import 'Hadeth_details/HadethDetailsScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (BuildContext)=>SettingProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider=Provider.of<SettingProvider>(context);
    return MaterialApp(
      title: 'Islami App',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
         Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: Locale(settingProvider.currentlocale),
      theme: MyThemeData.lighttheme,
      darkTheme: MyThemeData.darktheme,
      themeMode: settingProvider.currentTheme,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        ChapterDetailsScreen.routeName: (_) => ChapterDetailsScreen(),
        HadethDetailsScreen.routeName:(_)=>HadethDetailsScreen(),
        TasbehTab.routeName:(_)=> TasbehTab()
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
