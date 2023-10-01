import 'package:flutter/material.dart';
import 'package:islami_app/Providers/SettingsProvider.dart';
import 'package:provider/provider.dart';

import '../../MyThemeData.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Container(
      padding: EdgeInsets.all(18),
      color: provider.IsDarkEnabled() ? MyThemeData.darktertary : Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                provider.ChangeLang("ar");
              },
              child: provider.currentlocale == 'ar'
                  ? getSelectedItem("العربية")
                  : getUnSelectedItem("العربية")),
          InkWell(
              onTap: () {
                provider.ChangeLang('en');
              },
              child: provider.currentlocale == 'en'
                  ? getSelectedItem("English")
                  : getUnSelectedItem("English"))
        ],
      ),
    );
  }

  Widget getSelectedItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).dividerColor,
          ),
        ),
        Icon(
          Icons.check,
          color: Theme.of(context).dividerColor,
        ),
      ],
    );
  }

  Widget getUnSelectedItem(String text) {
    var provider = Provider.of<SettingProvider>(context);

    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: provider.IsDarkEnabled() ? Colors.white : Colors.black,
          ),
        ),
      ],
    );
  }
}
