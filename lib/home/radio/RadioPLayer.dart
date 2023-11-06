import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/MyThemeData.dart';
import 'package:islami_app/Providers/SettingsProvider.dart';
import 'package:islami_app/RadioResponse/Livetv.dart';
import 'package:islami_app/home/radio/RadioTab.dart';
import 'package:provider/provider.dart';

class RadioPlayer extends StatefulWidget {
  Livetv? liveTv;
  RadioPlayer([this.liveTv]);

  @override
  State<RadioPlayer> createState() => _RadioPlayerState();
}

class _RadioPlayerState extends State<RadioPlayer> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying=false;

  @override
  void dispose() {
    audioPlayer.release();
    super.dispose();
  }
  void toggleAudio() async {
    if (isPlaying) {
       audioPlayer.pause();
    } else {
      if (widget.liveTv != null && widget.liveTv!.url != null) {
        print('Ana object');
        print("hello ${widget.liveTv!.url} ${RadioTab.index}");

        if (RadioTab.index == 0) {

          await audioPlayer.play(widget.liveTv!.url!);
          print("Ana IF ${widget.liveTv!.url}");
        }
        else if (RadioTab.index == 1) {
          await audioPlayer.play(widget.liveTv!.url!);
          print("Ana ELSE ${widget.liveTv!.url}");
        }
      }
    }
    setState(() {
      isPlaying = !isPlaying;
      if(RadioTab.index == 0){
        widget.liveTv!.url =
            "https://win.holol.com/live/quran/playlist.m3u8";
        RadioTab.index++;
      }
      else if(RadioTab.index == 1){
        widget.liveTv!.url =
            "https://win.holol.com/live/sunnah/playlist.m3u8";
        RadioTab.index--;
      }
    });
  }

  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/radio.png'),
        SizedBox(height: 80),
        Text(
          'إذاعة القران الكريم',
          style: TextStyle(
            color: settingProvider.currentTheme == ThemeMode.light
                ? MyThemeData.darkprimary
                : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                toggleAudio();
                setState(() {
                  if(RadioTab.index == 0){
                    RadioTab.index++;
                  }
                  else if(RadioTab.index == 1){
                    RadioTab.index--;
                  }
                });
              },
              icon: Icon(
                Icons.skip_previous,
                size: 40,
                color: settingProvider.currentTheme == ThemeMode.light
                    ? MyThemeData.lightprimary
                    : MyThemeData.darksecondry,
              ),
            ),
            IconButton(
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              iconSize: 64,
              onPressed: toggleAudio,
                color: settingProvider.currentTheme == ThemeMode.light
                    ? MyThemeData.lightprimary
                    : MyThemeData.darksecondry,
            ),
            IconButton(
              onPressed: () {
                toggleAudio();
                setState((){
                  if(RadioTab.index == 0){
                    RadioTab.index++;
                  }
                  else if(RadioTab.index == 1){
                    RadioTab.index--;
                  }
                });
              },
              icon: Icon(
                Icons.skip_next,
                size: 40,
                color: settingProvider.currentTheme == ThemeMode.light
                    ? MyThemeData.lightprimary
                    : MyThemeData.darksecondry,
              ),
            ),
          ],
        ),
      ],
    );

  }

}