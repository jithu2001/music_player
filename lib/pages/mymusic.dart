import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../Homepage.dart';

class MyMusic extends StatelessWidget {
  const MyMusic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.1),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              icon: Icon(Iconsax.arrow_left, color: Colors.purpleAccent)),
          title: Text('MyMusic',
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.purpleAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 28))),
          backgroundColor: Colors.black,
          centerTitle: true,
          elevation: 0.0,
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
                    onTap: () {
                      Navigator.pushNamed(context, 'downloads');
                    },
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
                                onPressed: () {
                                  Navigator.pushNamed(context, 'downloads');
                                },
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
                            leading: Icon(Iconsax.folder,
                                color: Colors.purpleAccent),
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
                ]))));
  }
}
