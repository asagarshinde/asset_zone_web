import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_asset_zone_web/widgets/helper_widgets.dart';

class testinominal extends StatefulWidget {
  const testinominal({Key? key, required String title}) : super(key: key);

  @override
  State<testinominal> createState() => _testinominalState();
}

class _testinominalState extends State<testinominal> {
  Container getCarouselContainer(description) {
    return Container(
      height: 100,
      width: 800,
      padding: EdgeInsets.all(60),
      color: Colors.white.withOpacity(0.2),
      child: Column(
        children: [
          Text(
            description,
            style: GoogleFonts.montserrat(
                fontSize: 17, fontWeight: FontWeight.w300, color: Colors.white),
          ),
          SizedBox(height: 20,),
          Text(
            "REAL ESTATE",
            style: GoogleFonts.montserrat(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white,letterSpacing: 16),
          ),
          SizedBox(height: 20,),
          RatingBar.builder(
            itemSize: 20.0,
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          MyButton(title: "Sagar",),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 1000,
            child: Image.asset(
              'assets/image.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    //border: Border.all(color: Colors.black, width: 4),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.purple,
                      ),
                    ],
                  ),
                  child: Center(
                      child: Text("Our",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold))),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                child: Text(
                  "Happy Clients",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              CarouselSlider(
                items: [
                  getCarouselContainer(
                      "The Landscaping Professionals were quick, courteous and very helpful. They helped me restore my lawn and gardens completely after putting in my deck.")
                ],
                options: CarouselOptions(
                  height: 300.0,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  reverse: false,
                  enableInfiniteScroll: true,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayAnimationDuration: Duration(milliseconds: 2000),
                  scrollDirection: Axis.horizontal,
                  aspectRatio: 1.0,
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}

/*class testinominal extends StatelessWidget {
  const testinominal({Key? key, required String title}) : super(key: key);

  final images = [
    Image.asset('images/burger_1.png'),
    Image.asset('images/burger_3.png'),
    Image.asset('images/burger_2.png'),
    Image.asset('images/burger_4.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 1000,
            child: Image.asset(
              'assets/building.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    //border: Border.all(color: Colors.black, width: 4),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      new BoxShadow(color: Colors.purple,),
                    ],
                  ),
                  child: Center(child: Text("Our", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold))),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                child: Text("Happy Clients",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.redAccent),),
              ),
              const SizedBox(
                height: 50,
              ),
              CarouselSlider(items: images, options: CarouselOptions(
                aspectRatio: 1.0,
                scrollDirection: Axis.horizontal,
                autoPlay: true,
              ),)
            ],
          ),
        ],
      ),
    );
  }
}*/
