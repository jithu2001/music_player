import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class LocalFiles extends StatelessWidget {
  const LocalFiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LocalFiles',
            style: GoogleFonts.lato(
                textStyle: TextStyle(color: Colors.purpleAccent))),
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Iconsax.arrow_left,
            color: Colors.purpleAccent,
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Text(
            'Uhh Hmm.....\nNo Files Here :(',
            style: GoogleFonts.lato(
                textStyle: TextStyle(color: Colors.purpleAccent, fontSize: 38)),
          ),
        ),
      ),
    );
  }
}
