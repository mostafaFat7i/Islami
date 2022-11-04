import 'package:flutter/material.dart';
import 'package:islami/theme/my_theme.dart';
import 'package:provider/provider.dart';

import '../provider/settings_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              settingProvider.changeLanguage('en');
            },
            child: settingProvider.currentLanguage == 'en'
                ? selectedItem('English')
                : unSelectedItem('English'),
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              settingProvider.changeLanguage('ar');
            },
            child: settingProvider.currentLanguage == 'ar'
                ? selectedItem('العربيه')
                : unSelectedItem('العربيه'),
          )
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
