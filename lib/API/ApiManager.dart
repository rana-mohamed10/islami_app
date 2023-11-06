import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami_app/RadioResponse/RadioResponse.dart';

class ApiManager{
  static const baseUrl='mp3quran.net';
  static Future<RadioResponse> getQuranSources () async{
    var uri=Uri.https(baseUrl,'/api/v3/live-tv');
    var response = await http.get(uri);
    print(response.body);
    var json= jsonDecode(response.body);
    var quranResponse=RadioResponse.fromJson(json);

    return quranResponse;
  }

}