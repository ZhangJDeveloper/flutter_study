import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:reader_project/core/tools/screen.dart';
import 'package:reader_project/ui/model/home_model.dart';

class BannerView extends StatelessWidget {
  final List<BannerInfo> banners;
  BannerView({Key key, this.banners}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    if (this.banners.length == 0) {
      return SizedBox();
    }
    return Container(
      color: Colors.white,
      height: 180,
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2,
          autoPlay: true,
          height: 180
          // onPageChanged: (int index, CarouselPageChangedReason reason){
          //   print(index);
          // }
        ),
        items: banners.map((banner){
          print(banner.link);
          return Container(
            width: Screen.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            child: GestureDetector(
              child: Image.network(banner.imageUrl ?? ''),
              onTap: (){
                print(banner.link);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
