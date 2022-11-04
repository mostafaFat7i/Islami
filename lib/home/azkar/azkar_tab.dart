import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home/azkar/sourses_tabs.dart';
import 'package:islami/home/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class AzkarTab extends StatefulWidget {
  const AzkarTab({Key? key}) : super(key: key);

  @override
  State<AzkarTab> createState() => _AzkarTabState();
}

class _AzkarTabState extends State<AzkarTab> {
  List<Azkar> azkarList = [];

  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingsProvider>(context);

    if (azkarList.isEmpty) readAzkarFile();

    return Column(
      children: [
        SoursesTabs(azkarList),
        azkarList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Expanded(
                flex: 5,
                child: Center(
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.65,
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: settingProvider.isDark()
                              ? Theme.of(context).primaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(24)),
                      child: SingleChildScrollView(
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 6),
                            alignment: Alignment.center,
                            child: Text(
                              '${azkarList[settingProvider.tabIndex].content}',
                              textDirection: TextDirection.rtl,
                              style: Theme.of(context).textTheme.bodyText1,
                            )),
                      )),
                ),
              ),
      ],
    );
  }

  void readAzkarFile() async {
    String fileContent = await rootBundle.loadString('assets/files/azkar.txt');
    // trim -> remove leading and trailing ' ' '\n' '\t'
    List<Azkar> azkarOfFile = [];
    List<String> allHadeth = fileContent.trim().split("#");
    for (int i = 0; i < allHadeth.length; i++) {
      List<String> hadethLines = allHadeth[i].trim().split('\n');
      String title = hadethLines[0];
      if (title.isEmpty) continue;
      hadethLines.removeAt(0);
      String content = hadethLines.join('\n');
      Azkar h = Azkar(title, content);
      azkarOfFile.add(h);
    }

    azkarList = azkarOfFile;
    setState(() {});
  }
}

class Azkar {
  String title;
  String content;

  Azkar(this.title, this.content);
}
