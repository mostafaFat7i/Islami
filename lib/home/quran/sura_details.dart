import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home/provider/settings_provider.dart';
import 'package:islami/home/quran/verse_widget.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura-details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];
  String fullSura='';

  @override
  void initState() {
    super.initState();
    // how to access context in init state func flutter
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    var settingProvider = Provider.of<SettingsProvider>(context);
    if (verses.isEmpty) readFile(args.index); // non-blocking code
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
            title: Text(args.title),
          ),
          body: verses.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: settingProvider.isDark()
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(24)),
                    child: SingleChildScrollView(
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 6,horizontal: 6),
                          alignment: Alignment.center,
                          child: Text(
                            fullSura,
                            textDirection: TextDirection.rtl,
                            style: Theme.of(context).textTheme.bodyText1,
                          )),
                    ),
                  ),
                ),
        ));
  }

  void readFile(int index) async {
    // how to read file in dart from assets
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines =
        content.split("\n"); // split each line a separate string
    verses = lines;

    for(int i=0;i<verses.length;i++)
      fullSura+='${verses[i].trim()} {${i+1}} ';

    setState(() {});
  }
}

class SuraDetailsArgs {
  int index;
  String title;

  SuraDetailsArgs(this.index, this.title);
}


//ListView.separated(
//                       itemBuilder: (_, index) {
//                         return VerseWidget(index, verses[index]);
//                       },
//                       itemCount: verses.length,
//                       separatorBuilder: (_, index) {
//                         return Container(
//                           margin: EdgeInsets.symmetric(horizontal: 64),
//                           color: Theme.of(context).primaryColor,
//                           width: double.infinity,
//                           height: 2,
//                         );
//                       },
//                     )