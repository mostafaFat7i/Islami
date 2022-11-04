import 'package:flutter/material.dart';
import 'package:islami/home/azkar/azkar_tab.dart';
import 'package:islami/home/azkar/single_sourse_tab.dart';
import 'package:islami/home/provider/settings_provider.dart';
import 'package:islami/theme/my_theme.dart';
import 'package:provider/provider.dart';


class SoursesTabs extends StatefulWidget {
  List<Azkar> sourses;

  SoursesTabs(this.sourses);

  @override
  State<SoursesTabs> createState() => _SoursesTabsState();
}

class _SoursesTabsState extends State<SoursesTabs> {

  @override
  Widget build(BuildContext context) {
    var settingProvider=Provider.of<SettingsProvider>(context);

    return DefaultTabController(
      length: widget.sourses.length,
      child: TabBar(
        onTap: (index) {
          setState(() {
            settingProvider.changeTabIndex(index);
          });
        },
        indicatorColor: settingProvider.isDark()?MyTheme.darkTabsColor:MyTheme.lightTabsColor,
        isScrollable: true,
        tabs: widget.sourses.map((sourse) {
          bool isSelected = widget.sourses.indexOf(sourse) == settingProvider.tabIndex;
          return SingleSourseTab(sourse, isSelected);
        }).toList(),
      ),
    );
  }
}
