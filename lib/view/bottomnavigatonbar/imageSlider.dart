import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class imageSlider extends StatelessWidget {
  const imageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          Container(
              height: size.height * 0.15,
              width: size.width,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 150,
                  aspectRatio: 16 / 10,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.2,
                  scrollDirection: Axis.horizontal,
                ),

                // widgets
                items: [
                  Container(
                    child: Image.asset(
                      'assets/images/1.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    child: Image.asset(
                      'assets/images/1.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    child: Image.asset(
                      'assets/images/1.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
