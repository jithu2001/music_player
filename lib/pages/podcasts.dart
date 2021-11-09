import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';

class Podcasts extends StatefulWidget {
  const Podcasts({Key? key}) : super(key: key);

  @override
  _PodcastsState createState() => _PodcastsState();
}

class _PodcastsState extends State<Podcasts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "Podcasts",
          style: TextStyle(
              color: Colors.purpleAccent,
              fontSize: 35,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black,
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/podcasts.jpg'),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Center(
                      child: Text(
                        "Podcasts",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    cardview('society.jpg', 'Society', 'technology.jpg',
                        'Technology'),
                    SizedBox(
                      height: 10,
                    ),
                    cardview(
                        'sports.jpg', 'Sports', 'horror.jpg', 'Technology'),
                    SizedBox(
                      height: 10,
                    ),
                    cardview(
                        'history.jpg', 'History', 'education.jpg', 'Study'),
                    SizedBox(
                      height: 10,
                    ),
                    cardview(
                        'religious.jpg', 'Spiritual', 'stocks.jpg', 'Stocks'),
                    SizedBox(
                      height: 10,
                    ),
                    cardview('society.jpg', 'Society', 'technology.jpg',
                        'Technology'),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

Row cardview(String imagename1, displayText1, imagename2, displayText2) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      InkWell(
        onTap: () {
          print("object");
        },
        child: Container(
            margin: EdgeInsets.all(10),
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
                image: DecorationImage(
                    image: AssetImage('assets/images/$imagename1'),
                    fit: BoxFit.fill)),
            child: Center(
              child: Text('$displayText1',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            )),
      ),
      InkWell(
          child: Container(
              margin: EdgeInsets.all(10),
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                  image: DecorationImage(
                      image: AssetImage('assets/images/$imagename2'),
                      fit: BoxFit.fill)),
              child: Center(
                child: Text('$displayText2',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              )),
          onTap: () {}),
    ],
  );
}
