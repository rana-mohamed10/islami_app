import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/MyThemeData.dart';
import 'package:islami_app/Providers/SettingsProvider.dart';
import 'package:islami_app/chapter_details/VerseWidget.dart';
import 'package:provider/provider.dart';

class ChapterDetailsScreen extends StatefulWidget {
  static const String routeName = 'chapter_details';

  @override
  State<ChapterDetailsScreen> createState() => _ChapterDetailsScreenState();
}

class _ChapterDetailsScreenState extends State<ChapterDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<SettingProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as ChapterDetailsArgs;
    if (verses.isEmpty) loadFile(args.index);
    return Container(
        decoration:  BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  provider.GetBackground(),
                ),
                fit: BoxFit.fill)),
        child: Scaffold(
            appBar: AppBar(
              title: Text(args.name),
            ),
            body: verses.isEmpty
                ? Center(child: CircularProgressIndicator())
                : Card(
                    elevation: 18,
                    margin: EdgeInsets.symmetric(vertical: 64, horizontal: 18),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return VerseWidget(verses[index], index);
                      },
                      separatorBuilder: (context, index) {
                        return Container(
                          height: 2,
                          width: double.infinity,
                          color: Theme.of(context).dividerColor,
                          margin:
                              EdgeInsets.symmetric(horizontal: 64, vertical: 8),
                        );
                      },
                      itemCount: verses.length,
                    ),
                  )));
  }

  List<String> verses = [];

  void loadFile(int index) async {
    String fileContent =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    verses = fileContent.split("\n");
    print(fileContent);
    setState(() {});
  }
}

class ChapterDetailsArgs {
  String name;
  int index;

  ChapterDetailsArgs(this.name, this.index);
}
