import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class roomTile extends StatefulWidget {
  const roomTile({Key? key}) : super(key: key);

  @override
  State<roomTile> createState() => _roomTileState();
}

class _roomTileState extends State<roomTile> {
  final CarouselController carouselController = CarouselController();
  int _currentindex=0;
  final List imageAssets = [
    {"id":1,"image_path":'assets/bed1.png'},
    {"id":2,"image_path":'assets/bed2.png'},
  ];
  @override
  Widget build(BuildContext context) {
    final imageSlider = CarouselSlider(
      items: imageAssets.map(
            (item) => Image.asset(
          item['image_path'],
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      )
          .toList(),
      carouselController: carouselController,
      options: CarouselOptions(
          scrollPhysics: const BouncingScrollPhysics(),
          autoPlay: false,
          aspectRatio: 2,
          viewportFraction: 1,
          onPageChanged: (index, reason){
            setState(() {
              _currentindex = index;
            });
          }
      ),
    );
    // return Padding(
    //
    // );
  }
}
