import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_fonts/google_fonts.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyMusic',
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 28,
                    color: Colors.purpleAccent,
                    fontWeight: FontWeight.bold))),
        elevation: 0.0,
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SafeArea(
          child: Container(
              color: Colors.black,
              padding: EdgeInsets.all(20.0),
              child: Column(children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/mymusic.jpg'),
                          fit: BoxFit.fill)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                          title: Text(
                            'Downloads',
                            style: GoogleFonts.lato(
                                textStyle:
                                    TextStyle(color: Colors.purpleAccent)),
                          ),
                          leading:
                              Icon(Iconsax.music, color: Colors.purpleAccent),
                          subtitle: Text('See Your Downloads here',
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(color: Colors.white))),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(Iconsax.arrow_right_1,
                                  color: Colors.purpleAccent)))),
                ),
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'favourites');
                  },
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                          title: Text(
                            'Favourites',
                            style: GoogleFonts.lato(
                                textStyle:
                                    TextStyle(color: Colors.purpleAccent)),
                          ),
                          leading:
                              Icon(Iconsax.heart, color: Colors.purpleAccent),
                          subtitle: Text('Favourites...Here!',
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(color: Colors.white))),
                          trailing: IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'favourites');
                              },
                              icon: Icon(Iconsax.arrow_right_1,
                                  color: Colors.purpleAccent)))),
                ),
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'local');
                  },
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                          title: Text(
                            'Local Storage',
                            style: GoogleFonts.lato(
                                textStyle:
                                    TextStyle(color: Colors.purpleAccent)),
                          ),
                          leading:
                              Icon(Iconsax.folder, color: Colors.purpleAccent),
                          subtitle: Text('Access Your Local mp3 files here',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(color: Colors.white),
                              )),
                          trailing: IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'local');
                              },
                              icon: Icon(Iconsax.arrow_right_1,
                                  color: Colors.purpleAccent)))),
                ),
              ]))),
    );
  }
}
