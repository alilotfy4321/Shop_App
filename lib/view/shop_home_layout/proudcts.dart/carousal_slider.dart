import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/model/shop_home_model.dart';

class CustomSlider extends StatelessWidget {
   CustomSlider(this.model,{Key? key}) : super(key: key);
  ShopHomeModel model;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
              items: model.data!.banners!
                  .map(
                    (item) => Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage('${item.image}'),
                            fit: BoxFit.cover,
                          ),
                        )),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 200,
                aspectRatio: 16 / 9,
                viewportFraction: 1.0,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
            );
  }
}
