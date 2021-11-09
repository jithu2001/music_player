import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/albumcall.dart';

class LeftScroll extends StatefulWidget {
  final Map data;
  final Map togoo;
  const LeftScroll({Key? key, required this.data, required this.togoo})
      : super(key: key);

  @override
  _LeftScrollState createState() => _LeftScrollState();
}

class _LeftScrollState extends State<LeftScroll> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Row(
            children: List.generate(widget.data[0].length, (index) {
              return Padding(
                padding: EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () {
                    int valuedd = index;
                    Get.to(AlbumCall(data: widget.togoo[valuedd]));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 170,
                        width: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(widget.data[1][index]),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.data[0][index],
                            style: TextStyle(
                                color: Colors.purpleAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
