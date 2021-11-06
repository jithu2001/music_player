import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:music_player/data/detailmodel.dart';
import 'package:flutter/services.dart' as rootbundle;
import 'package:music_player/pages/player.dart';

class Tophits extends StatefulWidget {
  const Tophits({Key? key}) : super(key: key);

  @override
  _TophitsState createState() => _TophitsState();
}

class _TophitsState extends State<Tophits> {
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
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Iconsax.back_square, color: Colors.purpleAccent),
          ),
          title: Text(
            'TOP HITS',
            style: TextStyle(color: Colors.purpleAccent, fontSize: 24),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Iconsax.profile_circle,
                  color: Colors.purpleAccent,
                ))
          ],
        ),
        body: FutureBuilder(
            future: readjsondata(),
            builder: (context, data) {
              if (data.hasData) {
                var items = data.data as List<Musicdatamodel>;
                return ListView.builder(
                    itemCount: items == null ? 0 : items.length,
                    itemBuilder: (context, int i) {
                      int it = i;
                      var dat = url[i];
                      return Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MusicApp(
                                        index: it,
                                      )),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2,
                                      offset: Offset(0, 0),
                                      color: Colors.grey.withOpacity(0.2),
                                    )
                                  ]),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 150,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: NetworkImage(dat),
                                              fit: BoxFit.fill)),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          items[i].title.toString(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          items[i].name.toString(),
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.grey),
                                        )
                                      ],
                                    ),
                                    Expanded(
                                        child: Container(
                                      alignment: Alignment.centerRight,
                                      child: Icon(
                                        Iconsax.like,
                                        color: Colors.purpleAccent,
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              }
              return Text("errer");
            }));
  }

  Future<List<Musicdatamodel>> readjsondata() async {
    final jsondata =
        await rootbundle.rootBundle.loadString("json/song_detail.json");
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => Musicdatamodel.fromJson(e)).toList();
  }
}
