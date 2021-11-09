import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:music_player/albumdetail.dart';
import 'package:music_player/dashboardleftscroll.dart';
//import 'package:musicproject/dashboardpage.dart';
import 'package:music_player/homepage.dart';
import 'package:music_player/pages/about.dart';
import 'package:music_player/pages/downloads.dart';
import 'package:music_player/pages/favourites.dart';
import 'package:music_player/pages/languages_screen.dart';
import 'package:music_player/pages/local.dart';
import 'package:music_player/pages/mymusic.dart';
import 'package:music_player/pages/podcasts.dart';
import 'package:music_player/pages/privacy.dart';
import 'package:music_player/pages/settings.dart';
import 'package:music_player/pages/signin.dart';
//import 'package:musicproject/services/theme_services.dart';
// import 'package:musicproject/Theme_data/theme.dart';
import 'package:music_player/songboxcall.dart';
//import 'Theme_data/Theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      /*Open this for dark mode light mode switch ->theme: ThemeData(backgroundColor: Colors.white,
            primaryColor: Colors.blue,
            brightness: Brightness.light),
        themeMode: ThemeService().theme,
        darkTheme: ThemeData(
            backgroundColor: Colors.black,
            primaryColor: Colors.black,
            brightness: Brightness.dark),*/
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      //home: const SongBoxCall());
      //home: DashBoardPage());
      home: Signin(),
      routes: {
        'mymusic': (context) => MyMusic(),
        'settings': (context) => SettingsScreen(),
        'podcasts': (context) => Podcasts(),
        'languages_screen': (context) => LanguagesScreen(),
        'about': (context) => AboutPage(),
        'privacy': (context) => Privacy(),
        'local': (context) => LocalFiles(),
        'favourites': (context) => FavouritesPage(),
        'downloads': (context) => DownloadsPage()
      },
    );
    //home: DashBoardK(data: Details.podcastsDetails));
  }
}
