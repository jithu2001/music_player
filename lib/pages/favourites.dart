import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:music_player/Homepage.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Favourites',
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.purpleAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 28)),
          ),
          backgroundColor: Colors.black,
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Iconsax.arrow_left, color: Colors.purpleAccent),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          )),
      body: SafeArea(
          child: Container(
              color: Colors.black,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: double.infinity,
                        height: 250,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: AssetImage('assets/images/music.jpg'),
                                fit: BoxFit.cover))),
                    SizedBox(
                      height: 20,
                    ),
                    favouriteTile('Ignite', 'Alan Walker', 'ignite.jpg'),
                    SizedBox(
                      height: 15,
                    ),
                    favouriteTile('Dosthi', 'RRR', 'ignite.jpg'),
                    SizedBox(
                      height: 15,
                    ),
                    favouriteTile('Dakko dakko Meka', 'Phushpa', 'ignite.jpg'),
                    SizedBox(
                      height: 15,
                    ),
                    favouriteTile(
                        'Choolenge Aasama', 'Alan Walker', 'ignite.jpg'),
                    SizedBox(
                      height: 15,
                    ),
                    favouriteTile('Legend Title Song', 'Legend', 'ignite.jpg'),
                    SizedBox(
                      height: 15,
                    ),
                    favouriteTile('SriValli', 'Phushpa', 'ignite.jpg'),
                  ],
                ),
              ))),
    );
  }
}

ListTile favouriteTile(String title, subtitle, imagename) {
  return ListTile(
    title: Text('$title',
        style: GoogleFonts.lato(
            textStyle: TextStyle(color: Colors.purpleAccent, fontSize: 24))),
    subtitle: Text('$subtitle',
        style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.white))),
    trailing: Icon(
      Icons.favorite_outline_outlined,
      color: Colors.purpleAccent,
    ),
    leading: Image(image: AssetImage('assets/images/$imagename')),
  );
}
