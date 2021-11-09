import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class Privacy extends StatelessWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Iconsax.arrow_left, color: Colors.purpleAccent),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Privacy & Security',
          style: GoogleFonts.lato(
              textStyle: TextStyle(color: Colors.purpleAccent)),
        ),
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(20),
        alignment: Alignment.topCenter,
        child: Text(
          "We keep your personal information private, safe and secure.\n\n\nProtecting your privacy starts with the world’s most advanced security.\n\n\nYour privacy is protected by responsible data practices.",
          style: GoogleFonts.lato(
              textStyle: TextStyle(color: Colors.purpleAccent, fontSize: 26)),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
