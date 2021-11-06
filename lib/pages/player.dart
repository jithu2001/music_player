// @dart=2.9
import 'dart:convert';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/data/detailmodel.dart';
import 'package:flutter/services.dart' as rootbundle;

class MusicApp extends StatefulWidget {
  final int index;
  const MusicApp({Key key, @required this.index}) : super(key: key);

  @override
  _MusicAppState createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
  //we will need some variables
  bool playing = false; // at the begining we are not playing any song
  IconData playBtn = Icons.play_arrow; // the main state of the play button icon

  //Now let's start by creating our music player
  //first let's declare some object
  AudioPlayer _player;
  AudioCache cache;

  Duration position = new Duration();
  Duration musicLength = new Duration();

  //we will create a custom slider

  Widget slider() {
    return Container(
      width: 300.0,
      child: Slider.adaptive(
          activeColor: Colors.blue[800],
          inactiveColor: Colors.grey[350],
          value: position.inSeconds.toDouble(),
          max: musicLength.inSeconds.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

  //let's create the seek function that will allow us to go to a certain position of the music
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  //Now let's initialize our player
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);

    //now let's handle the audioplayer time

    //this function will allow you to get the music duration
    _player.durationHandler = (d) {
      setState(() {
        musicLength = d;
      });
    };

    //this function will allow us to move the cursor of the slider while we are playing the song
    _player.positionHandler = (p) {
      setState(() {
        position = p;
      });
    };
  }

  var url = [
    "https://i.ytimg.com/vi/a5YN-X4vP_k/maxresdefault.jpg",
    "https://i.ytimg.com/vi/uo4Okolu9C8/maxresdefault.jpg",
    "https://i.ytimg.com/vi/yPWCFWKAgRA/maxresdefault.jpg",
    "https://i.ytimg.com/vi/z6NpXw6KAMc/maxresdefault.jpg",
    "https://i.ytimg.com/vi/1j_XvebOg4c/maxresdefault.jpg",
    "https://i.ytimg.com/vi/Pv6PXsAsG8o/maxresdefault.jpg",
    "https://cdn.smehost.net/rcarecordscom-usrcaprod/wp-content/uploads/2020/06/NBT_RLS-scaled.jpg",
    "https://i.ytimg.com/vi/jm21Flj-dHE/mqdefault.jpg",
    "https://i.ytimg.com/vi/KjqG8VjJARo/maxresdefault.jpg",
    "https://a10.gaanacdn.com/gn_img/albums/w4MKPDOKoj/MKPg6yZObo/size_xxl_1610698963.webp"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //let's start by creating the main UI of the app
      body: FutureBuilder(
          future: readjsondata(),
          builder: (context, data) {
            if (data.hasData) {
              var items = data.data as List<Musicdatamodel>;
              var dat = url[widget.index];
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.black,
                        Colors.black38,
                      ]),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 48.0,
                  ),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_back_ios_new_sharp,
                              color: Colors.purple,
                            )),
                        //Let's add some text title
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            "Music Player",
                            style: TextStyle(
                              color: Colors.purpleAccent,
                              fontSize: 38.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12.0),
                          child: Text(
                            "Listen to your favorite Music",
                            style: TextStyle(
                              color: Colors.purpleAccent,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        //Let's add the music cover
                        Center(
                          child: Container(
                            width: 280.0,
                            height: 280.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                image: DecorationImage(
                                  image: NetworkImage(dat),
                                )),
                          ),
                        ),

                        SizedBox(
                          height: 12.0,
                        ),
                        Center(
                          child: Text(
                            items[widget.index].title.toString(),
                            style: TextStyle(
                              color: Colors.purpleAccent,
                              fontSize: 32.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //Let's start by adding the controller
                                //let's add the time indicator text

                                Container(
                                  width: 500.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      slider(),
                                      Text(
                                        "${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      iconSize: 45.0,
                                      color: Colors.deepPurpleAccent,
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.skip_previous,
                                      ),
                                    ),
                                    IconButton(
                                      iconSize: 62.0,
                                      color: Colors.deepPurple,
                                      onPressed: () {
                                        //here we will add the functionality of the play button
                                        if (!playing) {
                                          //now let's play the song
                                          cache.play("TeraGhata.mp3");
                                          setState(() {
                                            playBtn = Icons.pause;
                                            playing = true;
                                          });
                                        } else {
                                          _player.pause();
                                          setState(() {
                                            playBtn = Icons.play_arrow;
                                            playing = false;
                                          });
                                        }
                                      },
                                      icon: Icon(
                                        playBtn,
                                      ),
                                    ),
                                    IconButton(
                                      iconSize: 45.0,
                                      color: Colors.deepPurple,
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.skip_next,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}

Future<List<Musicdatamodel>> readjsondata() async {
  final jsondata =
      await rootbundle.rootBundle.loadString("json/song_detail.json");
  final list = json.decode(jsondata) as List<dynamic>;

  return list.map((e) => Musicdatamodel.fromJson(e)).toList();
}
