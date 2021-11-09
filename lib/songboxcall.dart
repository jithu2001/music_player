import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/Details/songdetails.dart';
import 'package:music_player/songbox.dart';

class SongBoxCall extends StatefulWidget {
  const SongBoxCall({Key? key}) : super(key: key);

  @override
  _SongBoxCallState createState() => _SongBoxCallState();
}

class _SongBoxCallState extends State<SongBoxCall> {
  List details = [
    {0: "Nannaku Prematho", 1: "5 Songs", 2: "images/k/NannakuPrematho.jpg"},
    {0: "Temper", 1: "3 Songs", 2: "images/k/Temper.jpg"},
    {0: "Aravinda Sametha", 1: "4 Songs", 2: "images/k/aravinda.jpg"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                //padding: const EdgeInsets.only(
                //    left: 10, right: 10, top: 5, bottom: 15),
                itemCount: details.length,
                itemBuilder: (BuildContext context, int i) {
                  return Container(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 15),
                      //margin: EdgeInsets.only(bottom: 10),
                      height: 50,
                      child: SongBox(
                        titled: details[i][0],
                        subtitled: details[i][1],
                        iconname: const Icon(Icons.arrow_forward_ios_outlined),
                        imageaddress: details[i][2],
                      ));
                }),
          ),
        ],
      ),
    );
  }

  _appbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        child: Icon(
          Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundImage: AssetImage("images/k/aravinda.jpg"),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
