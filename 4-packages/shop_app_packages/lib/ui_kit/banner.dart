import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_packages/ui_kit/ui_kit.dart' as U;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Banner extends StatefulWidget {
  //
  final List<BannerItem> banners;

  const Banner({
    super.key,
    required this.banners,
  });

  @override
  State<Banner> createState() => _BannerState();
}

class _BannerState extends State<Banner> {
  //
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.banners.map(
            (e) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(U.Theme.r20),
                child: InkWell(
                  onTap: e.onTap,
                  child: U.Image(
                    height: 180,
                    width: double.infinity,
                    path: e.img,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ).toList(),
          options: CarouselOptions(
            aspectRatio: 2800 / 600,
            autoPlay: true,
            enlargeCenterPage: true,
            enlargeFactor: 0.2,
            onPageChanged: (index, reason) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 8),
        AnimatedSmoothIndicator(
          activeIndex: selectedIndex,
          count: widget.banners.length,
          effect: ExpandingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            dotColor: U.Theme.outline,
            activeDotColor: U.Theme.primary,
          ),
        ),
      ],
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
