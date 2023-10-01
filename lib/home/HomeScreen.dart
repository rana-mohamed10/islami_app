import 'package:flutter/material.dart';
import 'package:islami_app/MyThemeData.dart';
import 'package:islami_app/home/hadeth/HadethTab.dart';
import 'package:islami_app/home/quran/QuranTab.dart';
import 'package:islami_app/home/radio/RadioTab.dart';
import 'package:islami_app/home/tasbeh/TasbehTab.dart';
import 'package:islami_app/home/Settings/SettingsTab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../Providers/SettingsProvider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<SettingProvider>(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                provider.GetBackground(),
              ),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              AppLocalizations.of(context)!.app_name),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              selectedTabIndex = index;
            });
          },
          currentIndex: selectedTabIndex,
          items: [
            BottomNavigationBarItem(
                backgroundColor: provider.IsDarkEnabled()
                    ? MyThemeData.darkprimary
                    : MyThemeData.lightprimary,
                icon: ImageIcon(AssetImage('assets/images/ic_quran.png')),
                label: AppLocalizations.of(context)!.quran),
            BottomNavigationBarItem(
                backgroundColor: provider.IsDarkEnabled()
                    ? MyThemeData.darkprimary
                    : MyThemeData.lightprimary,
                icon: ImageIcon(AssetImage('assets/images/ic_hadeth.png')),
                label: AppLocalizations.of(context)!.hadeth),
            BottomNavigationBarItem(
                backgroundColor: provider.IsDarkEnabled()
                    ? MyThemeData.darkprimary
                    : MyThemeData.lightprimary,
                icon: ImageIcon(AssetImage('assets/images/ic_sebha.png')),
                label: AppLocalizations.of(context)!.tasbeh),
            BottomNavigationBarItem(
                backgroundColor: provider.IsDarkEnabled()
                    ? MyThemeData.darkprimary
                    : MyThemeData.lightprimary,
                icon: ImageIcon(AssetImage('assets/images/ic_radio.png')),
                label: AppLocalizations.of(context)!.radio),
            BottomNavigationBarItem(
                backgroundColor: provider.IsDarkEnabled()
                    ? MyThemeData.darkprimary
                    : MyThemeData.lightprimary,
                icon: Icon(Icons.settings),
                label: AppLocalizations.of(context)!.settings)
          ],
        ),
        body: tabs[selectedTabIndex],
      ),
    );
  }

  var tabs = [QuranTab(), HadethTab(), TasbehTab(), RadioTab(), SettingsTab()];
}
