import 'package:flutter/material.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PropertyPhotoCarousel extends StatefulWidget {
  const PropertyPhotoCarousel({Key? key, double? height, this.imageList})
      : super(key: key);
  final List<String>? imageList;

  @override
  State<PropertyPhotoCarousel> createState() => _PropertyPhotoCarouselState();
}

class _PropertyPhotoCarouselState extends State<PropertyPhotoCarousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    List<String> imageList = [];
    for (String url in widget.imageList!) {
      imageList.add(url);
    }
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: constraints.maxWidth,
              height: 316,
              child: GFCarousel(
                viewportFraction: 1.0,
                autoPlay: true,
                height: 316,
                items: imageList.map<Widget>(
                  (url) {
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 316,
                        child: CachedNetworkImage(
                          imageUrl: url,
                          fit: BoxFit.fill,
                          placeholder: (context, url) => CircularProgressIndicator(), // Optional: Show a loading indicator
                          errorWidget: (context, url, error) => Icon(Icons.error), // Optional: Show an error icon
                        ),
                      ),
                    );
                  },
                ).toList(),
                onPageChanged: (index) {
                  setState(
                    () {
                      _current = index;
                    },
                  );
                },
              ),
            ),
            Positioned(
              top: 280,
              child: Row(
                children: widget.imageList!.map<Widget>(
                  (url) {
                    int index = widget.imageList!.indexOf(url);
                    return Container(
                      margin: const EdgeInsets.all(4.0),
                      width: 16.0,
                      height: 16.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? Colors.red
                            : const Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                    );
                  },
                ).toList(),
              ),
            )
          ],
        );
      },
    );
  }
}
