import 'package:flutter/material.dart';
import 'package:islami_app/chapter_details/ChapterDetails.dart';

class ChapterNameWidget extends StatelessWidget {
  String name;
  int index;

  ChapterNameWidget(this.name, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(ChapterDetailsScreen.routeName,
            arguments: ChapterDetailsArgs(name, index));
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Text(
          name,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
