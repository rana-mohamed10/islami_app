import 'package:flutter/material.dart';
import 'package:islami_app/MyThemeData.dart';
import 'package:islami_app/Providers/SettingsProvider.dart';
import 'package:provider/provider.dart';


class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settingProvider=Provider.of<SettingProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/radio.png'),
          SizedBox(height: 80,),
          Text('إذاعة القران الكريم',style:
            TextStyle(
                color: settingProvider.currentTheme==ThemeMode.light
            ?MyThemeData.darkprimary
            :Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25),),
          SizedBox(height:30 ,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.skip_previous,
                size: 40,
                color: settingProvider.currentTheme==ThemeMode.light
              ?MyThemeData.lightprimary
                :MyThemeData.darksecondry,)),
              IconButton(onPressed: (){}, icon: Icon(Icons.play_arrow,
                size: 60,
                color: settingProvider.currentTheme==ThemeMode.light
                    ?MyThemeData.lightprimary
                    :MyThemeData.darksecondry,)),
              IconButton(onPressed: (){}, icon: Icon(Icons.skip_next,
                size: 40,
                color: settingProvider.currentTheme==ThemeMode.light
                    ?MyThemeData.lightprimary
                    :MyThemeData.darksecondry,)),


            ],
          )
        ],
      ),
    );
  }
}
