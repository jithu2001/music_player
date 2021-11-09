import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:settings_ui/settings_ui.dart';

class LanguagesScreen extends StatefulWidget {
  @override
  _LanguagesScreenState createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  int languageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.1),
        appBar: AppBar(
          title: Text(
            'Languages',
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.purpleAccent,
                    fontSize: 28,
                    fontWeight: FontWeight.bold)),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Iconsax.arrow_left, color: Colors.purpleAccent),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.black,
          padding: EdgeInsets.all(20.0),
          child: SettingsList(
            backgroundColor: Colors.black,
            sections: [
              SettingsSection(tiles: [
                SettingsTile(
                  title: "English",
                  titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
                  subtitleTextStyle: TextStyle(color: Colors.white),
                  trailing: trailingWidget(0),
                  switchActiveColor: Colors.black,
                  onPressed: (BuildContext context) {
                    changeLanguage(0);
                  },
                ),
                SettingsTile(
                  title: "Spanish",
                  titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
                  subtitleTextStyle: TextStyle(color: Colors.white),
                  trailing: trailingWidget(1),
                  onPressed: (BuildContext context) {
                    changeLanguage(1);
                  },
                ),
                SettingsTile(
                  title: "Chinese",
                  titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
                  subtitleTextStyle: TextStyle(color: Colors.white),
                  trailing: trailingWidget(2),
                  onPressed: (BuildContext context) {
                    changeLanguage(2);
                  },
                ),
                SettingsTile(
                  title: "German",
                  titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
                  subtitleTextStyle: TextStyle(color: Colors.white),
                  trailing: trailingWidget(3),
                  onPressed: (BuildContext context) {
                    changeLanguage(3);
                  },
                ),
              ]),
            ],
          ),
        ));
  }

  Widget trailingWidget(int index) {
    return (languageIndex == index)
        ? Icon(Iconsax.tick_circle, color: Colors.purpleAccent)
        : Icon(null);
  }

  void changeLanguage(int index) {
    setState(() {
      languageIndex = index;
    });
  }
}
