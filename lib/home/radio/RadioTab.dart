import 'package:flutter/material.dart';
import 'package:islami_app/RadioResponse/Livetv.dart';
import 'package:islami_app/home/radio/RadioPLayer.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:islami_app/API/ApiManager.dart';

import '../../RadioResponse/RadioResponse.dart';

class RadioTab extends StatelessWidget {
  var audioPlayer = AudioPlayer();
  static int index=0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RadioResponse>( // Specify the type of FutureBuilder
      future: ApiManager.getQuranSources(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                Text(snapshot.error.toString()),
                ElevatedButton(onPressed: () {
                  ApiManager.getQuranSources();
                }, child: Text('Try Again')),
              ],
            ),
          );
        } else {
          List<Livetv>? radios = snapshot.data!.livetv!; // Access the radios list
          return RadioPlayer(radios![index],);

        }
      },
    );
  }
}