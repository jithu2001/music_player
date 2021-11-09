import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/Details/dashboardD.dart';
import 'package:music_player/albumcall.dart';
import 'package:music_player/albumdetail.dart';
import 'package:music_player/dashboardleftscroll.dart';
import 'package:music_player/songboxcall.dart';

class MainDashBoard extends StatefulWidget {
  const MainDashBoard({Key? key}) : super(key: key);

  @override
  _MainDashBoardState createState() => _MainDashBoardState();
}

class _MainDashBoardState extends State<MainDashBoard> {
  int valued = 0;
  List details = [
    {0: "Nannaku Prematho", 1: "5 Songs", 2: "images/Temper2.jpg"},
    {0: "Temper", 1: "3 Songs", 2: "images/Temper2.jpg"},
    {0: "Aravinda Sametha", 1: "4 Songs", 2: "images/aravinda.jpg"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar2(),
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    DashBoardD.DfirstLine,
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.purple,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                child: ImageSlideshow(
                  width: double.infinity,
                  height: 300,
                  initialPage: 0,
                  indicatorColor: Colors.blue,
                  indicatorBackgroundColor: Colors.grey,
                  isLoop: true,
                  autoPlayInterval: 2000,
                  onPageChanged: (value) {
                    valued = value;
                    print('$value');
                  },
                  children: [
                    Image.asset(
                      "images/RRR.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "images/Temper2.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset("images/aravinda.jpg", fit: BoxFit.cover),
                    Image.asset(
                      "images/RRR2.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "images/pushpa2.jpg",
                      fit: BoxFit.cover,
                    )
                  ],
                ),
                onDoubleTap: () {
                  if (valued == 0) {
                    Get.to(AlbumCall(data: AlbumDetails.RRRDetails));
                  } else if (valued == 1) {
                    Get.to(AlbumCall(data: AlbumDetails.TemperDetails));
                  } else if (valued == 4) {
                    Get.to(() => AlbumCall(data: AlbumDetails.PushpaDetails));
                  } else {
                    print("page 4");
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    DashBoardD.DsecondLine,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Colors.purple,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              LeftScroll(
                data: Details.TopHitMovies,
                togoo: Details.TopHitMoviesDetails,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    DashBoardD.Dthirdline,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Colors.purple,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              LeftScroll(
                data: Details.podcastsDetails,
                togoo: Details.pddetails,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _appbar2() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black,
      leading: GestureDetector(
        onTap: () {},
        child: Icon(
          Icons.menu_rounded,
          size: 40,
          color: Colors.white,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: CircleAvatar(
            backgroundImage: AssetImage("images/aravinda.jpg"),
          ),
        ),
        SizedBox(
          width: 20,
        )
      ],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DashBoardD.Dtitle,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.purple),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            DashBoardD.Dsubtitle,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
