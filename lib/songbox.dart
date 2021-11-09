import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SongBox extends StatelessWidget {
  final String titled;
  final String subtitled;
  final String? imageaddress;
  final Icon iconname;
  const SongBox(
      {Key? key,
      required this.titled,
      required this.subtitled,
      required this.iconname,
      this.imageaddress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(
          titled,
          style: GoogleFonts.lato(
            textStyle: TextStyle(
                color: Colors.purpleAccent,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ),
        subtitle: Text(
          subtitled,
          style: GoogleFonts.lato(
            textStyle: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        leading: imageaddress == null
            ? SizedBox(
                width: 1,
              )
            : SizedBox(
                height: 40.0,
                width: 40.0, // fixed width and height
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("$imageaddress"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(5)),
                )),
        trailing: InkWell(onTap: () {}, child: iconname),
      ),
    );
  }
}
