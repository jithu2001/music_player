import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Iconsax.arrow_left, color: Colors.purpleAccent)),
          title: Text('About',
              style: GoogleFonts.lato(
                  textStyle:
                      TextStyle(color: Colors.purpleAccent, fontSize: 24))),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Container(
                color: Colors.black,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 26),
                child: Text('About: ',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 22, color: Colors.purpleAccent))),
              ),
              Container(
                margin: EdgeInsets.only(left: 25),
                child: Text(
                    'Music Player is a simple app developed in flutter.\nThis app was mainly developed for mini project by a group of 5\nYou can see the developersnames below :)',
                    style: GoogleFonts.lato(
                        textStyle:
                            TextStyle(fontSize: 16, color: Colors.white))),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 26),
                child: Text(
                  'Developed by: ',
                  style: GoogleFonts.lato(
                      textStyle:
                          TextStyle(fontSize: 22, color: Colors.purpleAccent)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 26),
                  child: Text(
                      'Jithu\nHarshith\nSai Krishna\nSiva Sai\nBala Murali',
                      style: GoogleFonts.lato(
                          textStyle:
                              TextStyle(fontSize: 16, color: Colors.white)))),
            ],
          ),
        ));
  }
}
