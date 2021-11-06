import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:music_player/pages/signin.dart';
//import 'package:music_player/pages/player.dart';

//import 'package:music_player/pages/top_hits.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primaryColor: Colors.black, backgroundColor: Colors.black),
      home: Signin(),
    );
  }
}
