import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/constants.dart';

class FeatureProperty extends StatelessWidget {
  const FeatureProperty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.2, vertical: 50),
      child: Card(
        elevation: 20,
        child: Container(
          color: Colors.black38,
          child: Row(
            children: [
              Image.asset('assets/8.jpg'),
              Expanded(
                child: Container(
                  height: 514,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                        50, 50, 50, 8),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          "High Valley Fields",
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.black38),
                        ),
                        Text(
                          "Real estate is an imperishable asset, ever increasing in \nvalue. It is the most solid security that human ingenuity \nhas devised. It is the basis of all security and about the \nonly indestructible security",
                          style: GoogleFonts.rubik(
                              color: Colors.black38,
                              fontSize: 15,
                              height: 1.5),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 30),
                          child: SizedBox(
                            width: double.infinity,
                            child: Divider(
                              thickness: 0.2,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              color: kSecondaryColor
                                  .withOpacity(0.6),
                              child: Center(
                                child: Text(
                                  "3",
                                  style:
                                  GoogleFonts.rubik(
                                      color: Colors
                                          .white,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets
                                  .symmetric(
                                  horizontal: 16.0),
                              child: Text("Bedroom",
                                  style:
                                  GoogleFonts.rubik(
                                      color: Colors
                                          .black,
                                      fontWeight:
                                      FontWeight
                                          .w500,
                                      fontSize: 15)),
                            ),
                            Container(
                              width: 35,
                              height: 35,
                              color: kSecondaryColor
                                  .withOpacity(0.6),
                              child: Center(
                                child: Text(
                                  "5",
                                  style:
                                  GoogleFonts.rubik(
                                      color: Colors
                                          .white,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets
                                  .symmetric(
                                  horizontal: 16.0),
                              child: Text("Bathroom",
                                  style:
                                  GoogleFonts.rubik(
                                      color: Colors
                                          .black,
                                      fontWeight:
                                      FontWeight
                                          .w500,
                                      fontSize: 15)),
                            ),
                            Container(
                              color: kSecondaryColor
                                  .withOpacity(0.6),
                              child: Center(
                                child: Padding(
                                  padding:
                                  const EdgeInsets
                                      .symmetric(
                                      horizontal:
                                      16.0,
                                      vertical: 8.0),
                                  child: Text(
                                    "1930 Sq Ft",
                                    style:
                                    GoogleFonts.rubik(
                                        color: Colors
                                            .white,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 30),
                          child: SizedBox(
                            width: double.infinity,
                            child: Divider(
                              thickness: 0.2,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                              children: [
                                Text(
                                  "50,00,000",
                                  style:
                                  GoogleFonts.rubik(
                                      fontSize: 35,
                                      fontWeight:
                                      FontWeight
                                          .w500,
                                      color: Colors
                                          .black),
                                ),
                                Text(
                                  "Home for sale",
                                  style:
                                  GoogleFonts.rubik(
                                      fontSize: 15,
                                      color: Colors
                                          .black45),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 32.0),
                              child: Container(
                                color: kSecondaryColor,
                                width: 160,
                                height: 30,
                                child: Center(
                                  child: Text(
                                    "Submit Property",
                                    style:
                                    GoogleFonts.rubik(
                                        fontSize: 15,
                                        color: Colors
                                            .white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FeaturePropertyTablet extends StatelessWidget {
  const FeaturePropertyTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.1, vertical: 50),
      child: Card(
        elevation: 20,
        child: Container(
          color: Colors.black38,
          child: Column(
            children: [
              Image.asset('assets/8.jpg'),
              Container(
                height: 514,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                      50, 50, 50, 8),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        "High Valley Fields",
                        style: GoogleFonts.rubik(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black38),
                      ),
                      Text(
                        "Real estate is an imperishable asset, ever increasing in \nvalue. It is the most solid security that human ingenuity \nhas devised. It is the basis of all security and about the \nonly indestructible security",
                        style: GoogleFonts.rubik(
                            color: Colors.black38,
                            fontSize: 15,
                            height: 1.5),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 30),
                        child: SizedBox(
                          width: double.infinity,
                          child: Divider(
                            thickness: 0.2,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            color: kSecondaryColor
                                .withOpacity(0.6),
                            child: Center(
                              child: Text(
                                "3",
                                style:
                                GoogleFonts.rubik(
                                    color: Colors
                                        .white,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets
                                .symmetric(
                                horizontal: 16.0),
                            child: Text("Bedroom",
                                style:
                                GoogleFonts.rubik(
                                    color: Colors
                                        .black,
                                    fontWeight:
                                    FontWeight
                                        .w500,
                                    fontSize: 15)),
                          ),
                          Container(
                            width: 35,
                            height: 35,
                            color: kSecondaryColor
                                .withOpacity(0.6),
                            child: Center(
                              child: Text(
                                "5",
                                style:
                                GoogleFonts.rubik(
                                    color: Colors
                                        .white,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets
                                .symmetric(
                                horizontal: 16.0),
                            child: Text("Bathroom",
                                style:
                                GoogleFonts.rubik(
                                    color: Colors
                                        .black,
                                    fontWeight:
                                    FontWeight
                                        .w500,
                                    fontSize: 15)),
                          ),
                          Container(
                            color: kSecondaryColor
                                .withOpacity(0.6),
                            child: Center(
                              child: Padding(
                                padding:
                                const EdgeInsets
                                    .symmetric(
                                    horizontal:
                                    16.0,
                                    vertical: 8.0),
                                child: Text(
                                  "1930 Sq Ft",
                                  style:
                                  GoogleFonts.rubik(
                                      color: Colors
                                          .white,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 30),
                        child: SizedBox(
                          width: double.infinity,
                          child: Divider(
                            thickness: 0.2,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                            children: [
                              Text(
                                "50,00,000",
                                style:
                                GoogleFonts.rubik(
                                    fontSize: 35,
                                    fontWeight:
                                    FontWeight
                                        .w500,
                                    color: Colors
                                        .black),
                              ),
                              Text(
                                "Home for sale",
                                style:
                                GoogleFonts.rubik(
                                    fontSize: 15,
                                    color: Colors
                                        .black45),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32.0),
                            child: Container(
                              color: kSecondaryColor,
                              width: 160,
                              height: 30,
                              child: Center(
                                child: Text(
                                  "Submit Property",
                                  style:
                                  GoogleFonts.rubik(
                                      fontSize: 15,
                                      color: Colors
                                          .white),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
