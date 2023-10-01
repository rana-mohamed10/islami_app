import 'package:flutter/material.dart';
import 'package:islami_app/Hadeth_details/HadethDetailsScreen.dart';
import 'package:islami_app/home/hadeth/Hadeth.dart';

class HadethTitleWidget extends StatelessWidget {
 Hadeth hadeth;

  HadethTitleWidget(this.hadeth);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(HadethDetailsScreen.routeName,
        arguments:hadeth);
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Text(
          hadeth.title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
