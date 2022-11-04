import 'package:flutter/material.dart';
import 'package:islami/home/provider/settings_provider.dart';
import 'package:islami/theme/my_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ThemeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              settingProvider.changeTheme(ThemeMode.light);
            },
            child:settingProvider.isDark()?unSelectedItem(AppLocalizations.of(context)!.light_theme_title):selectedItem(AppLocalizations.of(context)!.light_theme_title),
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: (){
              settingProvider.changeTheme(ThemeMode.dark);
            },
            child: settingProvider.isDark()?selectedItem(AppLocalizations.of(context)!.dark_theme_title):unSelectedItem(AppLocalizations.of(context)!.dark_theme_title),
          ),
        ],
      ),
    );
  }

  Widget selectedItem(text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: MyTheme.lightTheme.textTheme.bodyText1
              ?.copyWith(color: MyTheme.primaryColor),
        ),
        Icon(
          Icons.check,
          color: MyTheme.primaryColor,
        ),
      ],
    );
  }

  Widget unSelectedItem(text) {
    return Row(
      children: [
        Text(
          text,
          style: MyTheme.lightTheme.textTheme.bodyText1,
        ),
      ],
    );
  }
}
