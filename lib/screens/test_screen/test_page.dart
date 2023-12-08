import 'package:flutter/cupertino.dart';
import 'package:getwidget/getwidget.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CarouselTest();
  }
}

class CarouselTest extends StatefulWidget {
  const CarouselTest({Key? key}) : super(key: key);

  @override
  State<CarouselTest> createState() => _CarouselTestState();
}

class _CarouselTestState extends State<CarouselTest> {
  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
      "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
      "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
      "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
      "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
      "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
    ];
    return SizedBox(
      height: 500,
      width: 500,
      child: GFCarousel(
        viewportFraction: 0.9,
        enlargeMainPage: true,
        pagerSize: 3,
        autoPlay: true,
        items: imageList.map(
              (url) {
            return Container(
              margin: EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Image.network(
                    url,
                    fit: BoxFit.cover,
                    width: 1000.0
                ),
              ),
            );
          },
        ).toList(),
        onPageChanged: (index) {
          setState(() {
            index;
          });
        },
      ),
    );
  }
}
