import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home/hadeth/Hadeth.dart';
import 'package:islami_app/home/hadeth/HadethTitleWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  @override
  Widget build(BuildContext context) {
    if (allAhadeth.isEmpty)
      LoadHadethFile();

    return Column(
      children: [
        Expanded(flex: 1, child: Image.asset('assets/images/ahadeth.png')),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 8),
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 2,
          ))),
          child: Text(
            AppLocalizations.of(context)!.hadeth_number,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
          ),
        ),
        Expanded(
          flex: 3,
          child: allAhadeth.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.separated(
                  itemBuilder: ((context, index) {
                    return HadethTitleWidget(allAhadeth[index]);
                  }),
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 2,
                      width: double.infinity,
                      color: Theme.of(context).dividerColor,
                      margin: EdgeInsets.symmetric(horizontal: 64),
                    );
                  },
                  itemCount: allAhadeth.length),
        )
      ],
    );
  }

  List<Hadeth> allAhadeth = [];
  void LoadHadethFile() async {
    var FileContent = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> HadethList = FileContent.trim().split('#');
    for (int i = 0; i < HadethList.length; i++) {
      String singleHadeth = HadethList[i];
      List<String> HadethLine = singleHadeth.trim().split('\n');
      String title = HadethLine[0];
      HadethLine.remove(0);
      String Content = HadethLine.join('\n');
      Hadeth hadeth = Hadeth(title, Content);
      allAhadeth.add(hadeth);
    }
    setState(() {});
  }
}
