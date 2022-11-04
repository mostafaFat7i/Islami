import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami/api/api_model/RadioResponse.dart';
import 'package:islami/home/provider/settings_provider.dart';
import 'package:provider/provider.dart';

//https://api.mp3quran.net/radios/radio_arabic.json
//https://api.mp3quran.net/radios/radio_english.json

class ApiManager {
  static const String BASE_URI = 'api.mp3quran.net';

  static Future<RadioResponse> getRadioResponse(context) async {
    SettingsProvider settingProvider = Provider.of<SettingsProvider>(context);

    var uri = Uri.https(
        BASE_URI,
        settingProvider.currentLanguage == 'en'
            ? '/radios/radio_english.json'
            : '/radios/radio_arabic.json');
    var response = await http.get(uri);
    var json = jsonDecode(utf8.decode(response.bodyBytes));
    RadioResponse soursesRespons = RadioResponse.fromJson(json);
    return soursesRespons;
  }
}
