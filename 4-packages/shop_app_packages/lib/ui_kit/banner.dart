import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_packages/ui_kit/ui_kit.dart' as U;

class Banner extends StatelessWidget {
  //
  final List<BannerItem> banners;

  const Banner({
    super.key,
    required this.banners,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: banners.map(
        (e) {
          return InkWell(
            onTap: e.onTap,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(U.Theme.r20),
              child: U.Image(
                height: 180,
                width: double.infinity,
                path: e.img,
              ),
            ),
          );
        },
      ).toList(),
      options: CarouselOptions(
        height: 180,
        autoPlay: true,
        enlargeCenterPage: true,
        enlargeFactor: 0.1,
      ),
    );
  }
}

class BannerItem {
//
  final String img;

  final Function() onTap;

  const BannerItem({
    required this.img,
    required this.onTap,
  });
}
