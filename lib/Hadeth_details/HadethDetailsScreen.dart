import 'package:flutter/material.dart';
import 'package:islami_app/MyThemeData.dart';
import 'package:islami_app/Providers/SettingsProvider.dart';
import 'package:provider/provider.dart';

import '../home/hadeth/Hadeth.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = "hadeth-datails";
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<SettingProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  provider.GetBackground(),
                ),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
            title: Text(args.title),
          ),
          body: Column(
            children: [
              Expanded(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 48, horizontal: 24),
                  child: SingleChildScrollView(
                    child: Text(
                      args.Content,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
