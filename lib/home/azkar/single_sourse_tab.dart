import 'package:flutter/material.dart';
import 'package:islami/home/azkar/azkar_tab.dart';
import 'package:islami/home/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class SingleSourseTab extends StatelessWidget {
  Azkar source;
  bool isSelected;

  SingleSourseTab(this.source, this.isSelected);

  @override
  Widget build(BuildContext context) {
    var settingProvider=Provider.of<SettingsProvider>(context);

    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color:
              isSelected ? Theme.of(context).primaryColor : Colors.transparent,
          border: Border.all(color: Theme.of(context).primaryColor, width: 2)),
      child: Text(
        source.title,
        style: TextStyle(
          fontSize: 14,
          color: isSelected ? Colors.white : settingProvider.isDark()?Colors.white54:Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
