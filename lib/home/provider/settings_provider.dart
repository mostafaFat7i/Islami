import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  String currentLanguage = 'en';
  ThemeMode currentTheme = ThemeMode.light;
  int tabIndex = 0;

  AudioPlayer? audioPlayer;

  SettingsProvider() {
    loadLanguage();
    loadTheme();

  }
  AudioPlayer getAudioPlayer(){

    if(audioPlayer==null)
      audioPlayer=AudioPlayer();

    return audioPlayer!;

  }

  void changeTabIndex(index){
    if (tabIndex == index) return;

    tabIndex=index;
    notifyListeners();

  }

  void changeLanguage(newLang) {
    if (currentLanguage == newLang) return;

    currentLanguage = newLang;
    //getAudioPlayer().stop();
    notifyListeners();
    _changeLangStorage();
  }

  void changeTheme(newTheme) {
    if (currentTheme == newTheme) return;

    currentTheme = newTheme;
    notifyListeners();
    _changeThemeStorage();
  }

  bool isDark() => currentTheme == ThemeMode.dark;

  String getBackground() => isDark()
      ? 'assets/images/background_pattern_dark.png'
      : 'assets/images/background_pattern.png';

  void _changeLangStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('languagekey', currentLanguage);
  }
  void _changeThemeStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('themekey', isDark()?'dark':'light');
  }

  void loadLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = (prefs.getString('languagekey') ?? 'en');
    currentLanguage = lang;
    notifyListeners();
  }
  void loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String theme = (prefs.getString('themekey') ?? 'light');

    currentTheme = theme=='light'?ThemeMode.light:ThemeMode.dark;
    notifyListeners();
  }

}
