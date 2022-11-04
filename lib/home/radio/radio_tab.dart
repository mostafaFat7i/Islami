import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami/api/api_manager.dart';
import 'package:islami/api/api_model/RadioResponse.dart';
import 'package:islami/home/provider/settings_provider.dart';
import 'package:islami/theme/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {

  void play(String url,SettingsProvider provider) async {
    await provider.getAudioPlayer().stop();
    await provider.getAudioPlayer().play(UrlSource(url));
  }

  void pause(SettingsProvider provider) async {
    await provider.getAudioPlayer().pause();
  }

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingProvider = Provider.of<SettingsProvider>(context);

    return Column(
      children: [
        SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.15,
        ),
        Expanded(
          child: Image(
            image: AssetImage('assets/images/radio_img.png'),
          ),
        ),
        FutureBuilder<RadioResponse>(
            future: ApiManager.getRadioResponse(context),
            builder: (context, snapshot) {
              if (snapshot.hasError)
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(AppLocalizations.of(context)!.no_internet_title,
                        style: TextStyle(color: Colors.red),),
                ),
              );
              else if (snapshot.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator());

              var data = snapshot.data;

              var results = data;
              return RadioWidget(results!,settingProvider);
            }),

      ],
    );
  }

  Widget RadioWidget(RadioResponse radioResponse,SettingsProvider provider) {
    var radioist = radioResponse.radios ?? [];
    return Expanded(
      child: ListView.builder(
        physics: PageScrollPhysics(),
        itemBuilder: (_, index) {
          return Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Center(
              child: SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.9,
                child: RadioItem(radioist[index],provider),
              ),
            ),
          );
        },
        itemCount: radioist.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget RadioItem(Radios radioist,SettingsProvider provider) {
    return Column(
      children: [
        Text(
          radioist.name ?? '',
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 5,
            ),
            InkWell(
              onTap: () {
                play(radioist.radioUrl!,provider);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade400.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Icon(
                  Icons.play_arrow,
                  size: 55,
                  color: MyTheme.primaryColor,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                pause(provider);
              },
              child: Icon(
                Icons.pause,
                size: 45,
                color: MyTheme.primaryColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}


//child: ListView.builder(
//         controller: _scrollController,
//         physics: PageScrollPhysics(),
//         itemBuilder: (_, index) {
//           return Container(
//             width: MediaQuery.of(context).size.width,
//             child: Center(
//               child: SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.9,
//                 child: RadioItem(radioist[index]),
//               ),
//             ),
//           );
//         },
//         itemCount: radioist.length,
//         scrollDirection: Axis.horizontal,
//       ),