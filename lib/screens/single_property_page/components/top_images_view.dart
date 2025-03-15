import 'package:flutter/cupertino.dart';

class TopImagesView extends StatelessWidget {
  const TopImagesView({super.key});

  Widget drawImageWithConstraints(height, width, image) {
    return SizedBox(
      height: height,
      width: width,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Image.asset(image),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    print("While building Top images height : $height, width: $width");
    return LayoutBuilder(builder: (builder, constraints) {
      return width > 950
          ? Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          drawImageWithConstraints(
              height * 0.8, width / 2, 'assets/4.jpg'),
          Column(
            children: [
              drawImageWithConstraints(
                  height * 0.4, width / 4, 'assets/31.jpg'),
              drawImageWithConstraints(
                  height * 0.4, width / 4, 'assets/21.jpg')
            ],
          ),
          Column(
            children: [
              drawImageWithConstraints(
                  height * 0.4, width / 4, 'assets/11.jpg'),
              drawImageWithConstraints(
                  height * 0.4, width / 4, 'assets/51.jpg')
            ],
          ),
        ],
      )
          : Column(
        children: [
          drawImageWithConstraints(height * 0.4, width, 'assets/4.jpg'),
          Row(
            children: [
              drawImageWithConstraints(
                  height * 0.2, width / 2, 'assets/31.jpg'),
              drawImageWithConstraints(
                  height * 0.2, width / 2, 'assets/21.jpg')
            ],
          ),
          Row(
            children: [
              drawImageWithConstraints(
                  height * 0.2, width / 2, 'assets/11.jpg'),
              drawImageWithConstraints(
                  height * 0.2, width / 2, 'assets/51.jpg')
            ],
          )
        ],
      );
    });
  }
}