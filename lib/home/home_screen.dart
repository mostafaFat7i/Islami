import 'package:flutter/material.dart';
import 'package:islami/home/azkar/azkar_tab.dart';
import 'package:islami/home/hadeth/hadeth_tab.dart';
import 'package:islami/home/provider/settings_provider.dart';
import 'package:islami/home/quran/quran_tab.dart';
import 'package:islami/home/radio/radio_tab.dart';
import 'package:islami/home/setting/settings_tab.dart';
import 'package:islami/home/tasbeh/tasbhe_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var settingProvider=Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            settingProvider.getBackground(),
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.app_title,
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Theme.of(context).primaryColor),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/ic_quran.png'),
                ),
                label: AppLocalizations.of(context)!.quran_title,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/ic_hadeth.png'),
                ),
                label: AppLocalizations.of(context)!.hadeth_title,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/ic_sebha.png'),
                ),
                label: AppLocalizations.of(context)!.tasbeh_title,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/prayer_icon.png'),
                ),
                label: AppLocalizations.of(context)!.azkar_title,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/ic_radio.png'),
                ),
                label: AppLocalizations.of(context)!.radio_title,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: AppLocalizations.of(context)!.settings_title,
              ),
            ],
          ),
        ),
        body: tabs[selectedIndex],
      ),
    );
  }

  List<Widget> tabs = [QuranTab(), HadethTab(), TasbehTab(),AzkarTab(), RadioTab(),SettingsTab()];
}
