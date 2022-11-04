import 'package:flutter/material.dart';
import 'package:islami/theme/my_theme.dart';
import 'dart:math' as math;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../provider/settings_provider.dart';

class TasbehTab extends StatefulWidget {
  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab>
    with SingleTickerProviderStateMixin {
  double step = 0;
  int counter = 0;
  List<String> tasbeh = [
    'سبحان الله',
    'الحمد لله',
    'لا اله الا الله',
    'الله اكبر',
    'لا حول ولا قوة الا بالله',
    'اللهم صلي علي محمد'
  ];
  int tasbehIndex = 0;

  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingsProvider>(context);

    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  settingProvider.isDark()
                      ? 'assets/images/dark_head_of_seb7a.png'
                      : 'assets/images/head_of_seb7a.png',
                ),
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.09,
                    ),
                    Transform.rotate(
                      angle: step,
                      child: Image.asset(
                        settingProvider.isDark()
                            ? 'assets/images/dark_body_of_seb7a.png'
                            : 'assets/images/body_of_seb7a.png',
                        height: 220,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            AppLocalizations.of(context)!.counter_title,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 70,
            width: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '$counter',
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                step += 20;
                if (counter < 33) {
                  counter++;
                } else {
                  counter = 0;
                  if (tasbehIndex < tasbeh.length - 1)
                    tasbehIndex++;
                  else
                    tasbehIndex = 0;
                }
              });
            },
            style: ElevatedButton.styleFrom(
              primary: settingProvider.isDark()
                  ? Theme.of(context).secondaryHeaderColor
                  : Theme.of(context).primaryColor,
              textStyle: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: Text(tasbeh[tasbehIndex],
                style: settingProvider.isDark()
                    ? TextStyle(
                        color: Colors.black,
                      )
                    : Theme.of(context).textTheme.headline5),
          ),
        ],
      ),
    );
  }
}
