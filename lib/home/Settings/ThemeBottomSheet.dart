import 'package:flutter/material.dart';
import 'package:islami_app/Providers/SettingsProvider.dart';
import 'package:provider/provider.dart';

import '../../MyThemeData.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingProvider>(context);
    return Container(
      padding: EdgeInsets.all(18),
      color: settingProvider.IsDarkEnabled()? MyThemeData.darktertary : Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                settingProvider.changeTheme(ThemeMode.dark);
              },
              child: settingProvider.IsDarkEnabled()
                  ? getSelectedItem("Dark")
                  : getUnSelectedItem("Dark")),
          InkWell(
              onTap: () {
                settingProvider.changeTheme(ThemeMode.light);
              },
              child: settingProvider.IsDarkEnabled()
                  ? getUnSelectedItem("Light")
                  : getSelectedItem("Light"))
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
    var settingProvider=Provider.of<SettingProvider>(context);
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: settingProvider.IsDarkEnabled() ? Colors.white : Colors.black,
          ),
        ),
      ],
    );
  }
}
