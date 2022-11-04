import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home/hadeth/ahadeth_widget.dart';
import 'package:provider/provider.dart';

import '../provider/settings_provider.dart';

class HatethDetailsScreen extends StatefulWidget {
  static const String routeName = 'hadeth-details';

  @override
  State<HatethDetailsScreen> createState() => _HatethDetailsScreenState();
}

class _HatethDetailsScreenState extends State<HatethDetailsScreen> {
  List<String> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as AhadethDetailsArgs;
    var settingProvider = Provider.of<SettingsProvider>(context);
    if (ahadeth.isEmpty) readFile(args.index);
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
          body: ahadeth.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Center(
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: settingProvider.isDark()
                              ? Theme.of(context).primaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(24)),
                      child: AhadethWidget(args.index, ahadeth[args.index])),
                ),
        ));
  }

  void readFile(int index) async {
    // how to read file in dart from assets
    String content = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> lines =
        content.split("#"); // split each line a separate string
    ahadeth = lines;
    setState(() {});
  }
}

class AhadethDetailsArgs {
  int index;
  String title;

  AhadethDetailsArgs(this.index, this.title);
}
