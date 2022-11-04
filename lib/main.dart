import 'package:flutter/material.dart';
import 'package:islami/home/hadeth/hateth_details.dart';
import 'package:islami/home/home_screen.dart';
import 'package:islami/home/provider/settings_provider.dart';
import 'package:islami/home/quran/sura_details.dart';
import 'package:islami/theme/my_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'splash/splash_screen.dart';

void main() {
  runApp(ChangeNotifierProvider<SettingsProvider>(
    create: (_) => SettingsProvider(),
    child: MyApp(),
  ));
}



class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var settingProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: settingProvider.isDark() ? MyTheme.darkTheme : MyTheme.lightTheme,
      themeMode: settingProvider.currentTheme,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
        HatethDetailsScreen.routeName: (_) => HatethDetailsScreen(),
        SplashScreen.route_name: (_) => SplashScreen(),
      },
      initialRoute: SplashScreen.route_name,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingProvider.currentLanguage),
    );
  }
}
