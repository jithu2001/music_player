import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:music_player/Details/dashboardD.dart';
import 'package:music_player/maindashboard.dart';
import 'package:music_player/pages/favourites.dart';
import 'package:music_player/pages/mymusic.dart';
import 'package:music_player/pages/player.dart';
import 'package:music_player/pages/settings.dart';

/// This is the stateful widget that the main application instantiates.
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    MainDashBoard(),
    MusicApp(),
    MyMusic(),
    FavouritesPage(),
    SettingsScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.music_house, color: Colors.purpleAccent),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.music_note_2, color: Colors.purpleAccent),
            label: 'Now Playing',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.music, color: Colors.purpleAccent),
            label: 'My Music',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart, color: Colors.purpleAccent),
            label: 'Favorites',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'Settings',
            backgroundColor: Colors.black,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purpleAccent,
        onTap: _onItemTapped,
      ),
    );
  }

  _appbar2() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black,
      leading: GestureDetector(
        onTap: () {},
        child: Icon(
          Icons.menu_rounded,
          size: 40,
          color: Colors.white,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: CircleAvatar(
            backgroundImage: AssetImage("images/aravinda.jpg"),
          ),
        ),
        SizedBox(
          width: 20,
        )
      ],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DashBoardD.Dtitle,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.purple),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            DashBoardD.Dsubtitle,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
