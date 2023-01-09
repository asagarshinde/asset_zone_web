import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';

// import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_asset_zone_web/models/property_detail_model.dart';
import 'package:the_asset_zone_web/widgets/helper_widgets.dart';

class WhatAreYouLookingFor extends StatelessWidget {
  WhatAreYouLookingFor({Key? key, required this.propertyDetails})
      : super(key: key);
  final List<PropertyDetails> propertyDetails;

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        controller: scrollController,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 800,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                "Properties Listing",
                                style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(28, 45, 58, 1)),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              height: 700,
                              width: MediaQuery.of(context).size.width,
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5,
                                  crossAxisSpacing: 1,
                                  mainAxisSpacing: 1,
                                ),
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(bottom: 10.0),
                                        // height: 200.0,
                                        // width: 300.0,
                                        child: CarouselSlider(
                                          items: [
                                            Image.asset('assets/1.jpg',
                                                fit: BoxFit.cover),
                                            Image.asset('assets/2.jpg',
                                                fit: BoxFit.cover),
                                            Image.asset('assets/3.jpg',
                                                fit: BoxFit.cover),
                                            Image.asset('assets/4.jpg',
                                                fit: BoxFit.cover),
                                            Image.asset('assets/5.jpg',
                                                fit: BoxFit.cover)
                                          ],
                                          options: CarouselOptions(
                                            height: 300.0,
                                            initialPage: 0,
                                            enlargeCenterPage: true,
                                            autoPlay: true,
                                            reverse: false,
                                            enableInfiniteScroll: true,
                                            autoPlayInterval:
                                                Duration(seconds: 5),
                                            autoPlayAnimationDuration:
                                                Duration(milliseconds: 2000),
                                            scrollDirection: Axis.horizontal,
                                            aspectRatio: 1.0,
                                          ),
                                        ),
                                        // child: Carousel(
                                        //   autoplay: true,
                                        //   dotSize: 6.0,
                                        //   dotSpacing: 15.0,
                                        //   dotPosition: DotPosition.bottomCenter,
                                        //   images: [
                                        //     Image.asset('assets/1.jpg', fit: BoxFit.cover),
                                        //     Image.asset('assets/2.jpg', fit: BoxFit.cover),
                                        //     Image.asset('assets/3.jpg', fit: BoxFit.cover),
                                        //     Image.asset('assets/4.jpg', fit: BoxFit.cover),
                                        //     Image.asset('assets/5.jpg', fit: BoxFit.cover),
                                        //     //Image.asset('assets/images/6.jpg', fit: BoxFit.cover),
                                        //   ],
                                        // ),
                                      ),
                                      // Container(
                                      //   width: 300.0,
                                      //   height: 200.0,
                                      //   padding:
                                      //       const EdgeInsets.fromLTRB(30, 10, 0, 0),
                                      //   child: Column(
                                      //     crossAxisAlignment:
                                      //         CrossAxisAlignment.start,
                                      //     children: [
                                      //       AutoSizeText(
                                      //         ("F R A N C E"),
                                      //         style: GoogleFonts.roboto(
                                      //           fontSize: 14,
                                      //           fontWeight: FontWeight.w500,
                                      //           color: Color.fromRGBO(
                                      //               149, 149, 149, 1),
                                      //         ),
                                      //       ),
                                      //       SizedBox(
                                      //         height: 10,
                                      //       ),
                                      //       AutoSizeText(
                                      //         ("Little Acorn Farm"),
                                      //         style: GoogleFonts.montserrat(
                                      //           fontSize: 19,
                                      //           fontWeight: FontWeight.w700,
                                      //           color: Color.fromRGBO(
                                      //               28, 45, 58, 1),
                                      //         ),
                                      //       ),
                                      //       SizedBox(
                                      //         height: 10,
                                      //       ),
                                      //       AutoSizeText(
                                      //         ("6558.00*"),
                                      //         style: GoogleFonts.montserrat(
                                      //           fontSize: 19,
                                      //           fontWeight: FontWeight.w700,
                                      //           color: Color.fromRGBO(
                                      //               255, 92, 65, 1),
                                      //         ),
                                      //       ),
                                      //       SizedBox(
                                      //         height: 20,
                                      //       ),
                                      //       Row(children: [
                                      //         Container(
                                      //             child: Row(
                                      //           children: [
                                      //             Icon(Icons.bedroom_parent),
                                      //             SizedBox(
                                      //               width: 5,
                                      //             ),
                                      //             Text("Bed:"),
                                      //             SizedBox(
                                      //               width: 5,
                                      //             ),
                                      //             Text(propertyDetails[index]
                                      //                 .property_about
                                      //                 .bedrooms
                                      //                 .toString()),
                                      //           ],
                                      //         )),
                                      //         Divider(
                                      //           thickness: 1,
                                      //           color: Colors.grey,
                                      //         ),
                                      //         SizedBox(
                                      //           width: 5,
                                      //         ),
                                      //         Container(
                                      //             child: Row(
                                      //           children: [
                                      //             Icon(Icons.bathroom),
                                      //             SizedBox(
                                      //               width: 5,
                                      //             ),
                                      //             Text("Bath:"),
                                      //             SizedBox(
                                      //               width: 5,
                                      //             ),
                                      //             Text(propertyDetails[index]
                                      //                 .property_about
                                      //                 .bathroom
                                      //                 .toString()),
                                      //           ],
                                      //         )),
                                      //         SizedBox(
                                      //           width: 5,
                                      //         ),
                                      //         Container(
                                      //             child: Row(
                                      //           children: [
                                      //             Icon(Icons.area_chart),
                                      //             SizedBox(
                                      //               width: 5,
                                      //             ),
                                      //             Text("Sq Ft:"),
                                      //             SizedBox(
                                      //               width: 5,
                                      //             ),
                                      //             Text(propertyDetails[index]
                                      //                 .property_about
                                      //                 .property_size
                                      //                 .toString()),
                                      //           ],
                                      //         )),
                                      //       ]),
                                      //       Row(
                                      //         children: [
                                      //           Container(
                                      //             child: Text("August 4, 2022"),
                                      //           ),
                                      //           SizedBox(
                                      //             width: 40,
                                      //           ),
                                      //           MyButton(
                                      //             title: "Details",
                                      //             height: 40,
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ],
                                      //   ),
                                      // )
                                    ],
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
