import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class DownloadsPage extends StatefulWidget {
  const DownloadsPage({Key? key}) : super(key: key);

  @override
  _DownloadsPageState createState() => _DownloadsPageState();
}

class _DownloadsPageState extends State<DownloadsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Downloads',
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
              Navigator.pop(context);
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
                                image: AssetImage('assets/images/download.jpg'),
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
      Icons.download_done_outlined,
      color: Colors.purpleAccent,
    ),
    leading: Image(image: AssetImage('assets/images/$imagename')),
  );
}
