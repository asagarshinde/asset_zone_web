import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DeveloperWorkWithUs extends StatefulWidget {
  const DeveloperWorkWithUs({super.key});

  @override
  State<DeveloperWorkWithUs> createState() => _DeveloperWorkWithUsState();
}

class _DeveloperWorkWithUsState extends State<DeveloperWorkWithUs> {
  @override
  Widget build(BuildContext context) {
    List<Widget> getItems() {
      List<Widget> individualDeveloperContainersList = [];
      List<String> images = [
        "assets/img6.png",
        "assets/img7.png",
        "assets/img8.png",
        "assets/img9.png",
        "assets/img10.png",
        "assets/img11.png"
      ];
      for (String image in images) {
        individualDeveloperContainersList.add(
          IndividualDeveloperContainer(image: image),
        );
      }
      return individualDeveloperContainersList;
    }
    return CarouselSlider(
      items: getItems(),
      options: CarouselOptions(
        height: 120.0,
        scrollPhysics: const BouncingScrollPhysics(),
        enlargeCenterPage: false,
        autoPlay: true,
        aspectRatio: 0.8,
        autoPlayCurve: Curves.easeInOut,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 400),
        viewportFraction: 0.15,
      ),
    );
  }
}

class IndividualDeveloperContainer extends StatelessWidget {
  const IndividualDeveloperContainer({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage(image),
          // fit: BoxFit.fitH,
        ),
      ),
    );
  }
}
