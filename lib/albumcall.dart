import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/Details/songdetails.dart';

import 'package:music_player/songbox.dart';

class AlbumCall extends StatefulWidget {
  final Map data;
  const AlbumCall({Key? key, required this.data}) : super(key: key);

  @override
  _AlbumCallState createState() => _AlbumCallState();
}

class _AlbumCallState extends State<AlbumCall> {
  List details = [
    {0: "Nannaku Prematho", 1: "5 Songs", 2: "images/k/NannakuPrematho.jpg"},
    {0: "Temper", 1: "3 Songs", 2: "images/k/Temper.jpg"},
    {0: "Aravinda Sametha", 1: "4 Songs", 2: "images/k/aravinda.jpg"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  //padding: const EdgeInsets.only(
                  //    left: 10, right: 10, top: 5, bottom: 15),
                  itemCount: widget.data.length - 2,
                  itemBuilder: (BuildContext context, int i) {
                    return Container(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 5, bottom: 15),
                        //margin: EdgeInsets.only(bottom: 10),
                        height: 50,
                        child: SongBox(
                          titled: widget.data[i + 2][0],
                          subtitled: widget.data[i + 2][1],
                          iconname: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.white,
                          ),
                          imageaddress: widget.data[1],
                        ));
                  }),
            ),
          ],
        ),
      ),
    );
  }

  _appbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black,
      leading: /* GestureDetector(
        onTap: () {
          ThemeService().switchTheme();
        },
        child: Icon(
          Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),*/
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 20,
              )),
      title: Text(
        widget.data[0],
        style: GoogleFonts.lato(
          textStyle: TextStyle(
              color: Colors.purpleAccent,
              fontSize: 24,
              fontWeight: FontWeight.w600),
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundImage: AssetImage("images/aravinda.jpg"),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
