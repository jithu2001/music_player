import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:settings_ui/settings_ui.dart';

import 'languages_screen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool lockInBackground = true;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: GoogleFonts.lato(
              textStyle: TextStyle(
                  color: Colors.purpleAccent,
                  fontSize: 28,
                  fontWeight: FontWeight.bold)),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: buildSettingsList(),
    );
  }

  Widget buildSettingsList() {
    return SettingsList(
      backgroundColor: Colors.black,
      sections: [
        SettingsSection(
          title: 'Common',
          tiles: [
            SettingsTile(
              title: 'Language',
              titleTextStyle:
                  TextStyle(color: Colors.purpleAccent, fontSize: 18),
              subtitleTextStyle: TextStyle(color: Colors.white),
              subtitle: 'English',
              leading:
                  Icon(Iconsax.language_circle, color: Colors.purpleAccent),
              onPressed: (context) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => LanguagesScreen(),
                ));
              },
            ),
            SettingsTile(
                title: 'Environment',
                subtitle: 'Production',
                titleTextStyle:
                    TextStyle(color: Colors.purpleAccent, fontSize: 18),
                subtitleTextStyle: TextStyle(color: Colors.white),
                leading: Icon(Iconsax.cloud, color: Colors.purpleAccent)),
          ],
        ),
        SettingsSection(
          title: 'Account',
          tiles: [
            SettingsTile(
                title: 'Phone number',
                titleTextStyle:
                    TextStyle(color: Colors.purpleAccent, fontSize: 18),
                subtitleTextStyle: TextStyle(color: Colors.white),
                leading: Icon(Iconsax.call, color: Colors.purpleAccent)),
            SettingsTile(
                title: 'Email',
                titleTextStyle:
                    TextStyle(color: Colors.purpleAccent, fontSize: 18),
                subtitleTextStyle: TextStyle(color: Colors.white),
                leading: Icon(Icons.email, color: Colors.purpleAccent)),
            SettingsTile(
                title: 'Name',
                titleTextStyle:
                    TextStyle(color: Colors.purpleAccent, fontSize: 18),
                subtitleTextStyle: TextStyle(color: Colors.white),
                leading: Icon(Iconsax.text, color: Colors.purpleAccent)),
          ],
        ),
        SettingsSection(
          title: 'Security',
          tiles: [
            SettingsTile.switchTile(
              title: 'Lock app in background',
              titleTextStyle:
                  TextStyle(color: Colors.purpleAccent, fontSize: 18),
              subtitleTextStyle: TextStyle(color: Colors.white),
              leading: Icon(Iconsax.lock_1, color: Colors.purpleAccent),
              switchValue: lockInBackground,
              switchActiveColor: Colors.purpleAccent,
              onToggle: (bool value) {
                setState(() {
                  lockInBackground = value;
                });
              },
            ),
            SettingsTile.switchTile(
              title: 'Enable notifications',
              titleTextStyle:
                  TextStyle(color: Colors.purpleAccent, fontSize: 18),
              subtitleTextStyle: TextStyle(color: Colors.white),
              leading: Icon(Iconsax.notification, color: Colors.purpleAccent),
              switchValue: notificationsEnabled,
              switchActiveColor: Colors.purpleAccent,
              onToggle: (bool value) {
                setState(() {
                  notificationsEnabled = value;
                });
              },
            ),
          ],
        ),
        SettingsSection(
          title: 'Licences',
          tiles: [
            SettingsTile(
                title: 'Terms of Service',
                titleTextStyle:
                    TextStyle(color: Colors.purpleAccent, fontSize: 18),
                subtitleTextStyle: TextStyle(color: Colors.white),
                leading: Icon(
                  Iconsax.document_1,
                  color: Colors.purpleAccent,
                ),
                onPressed: (context) {
                  Navigator.pushNamed(context, 'privacy');
                }),
            SettingsTile(
              title: 'About Us',
              titleTextStyle:
                  TextStyle(color: Colors.purpleAccent, fontSize: 18),
              subtitleTextStyle: TextStyle(color: Colors.white),
              leading: Icon(Iconsax.book_1, color: Colors.purpleAccent),
              onPressed: (context) {
                Navigator.pushNamed(context, 'about');
              },
            ),
          ],
        ),
      ],
    );
  }
}
