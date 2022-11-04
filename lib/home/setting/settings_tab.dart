import 'package:flutter/material.dart';
import 'package:islami/home/provider/settings_provider.dart';
import 'package:islami/home/setting/language_bottom_sheet.dart';
import 'package:islami/home/setting/theme_bottom_sheet.dart';
import 'package:islami/theme/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.language_title,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                showLanguageBottomSheat();
              },
              child: Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Text(
                  settingProvider.currentLanguage == 'en'
                      ? 'English'
                      : 'العربيه',
                  style: MyTheme.lightTheme.textTheme.headline5,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              AppLocalizations.of(context)!.theme_title,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                showThemeBottomSheat();
              },
              child: Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: MyTheme.primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Text(
                  settingProvider.isDark()
                      ? AppLocalizations.of(context)!.dark_theme_title
                      : AppLocalizations.of(context)!.light_theme_title,
                  style: MyTheme.lightTheme.textTheme.headline5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showThemeBottomSheat() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(height: MediaQuery.of(context).size.height*0.4,child: ThemeBottomSheet());
        });
  }

  void showLanguageBottomSheat() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(height:MediaQuery.of(context).size.height*0.4,child: LanguageBottomSheet());
        });
  }
}
