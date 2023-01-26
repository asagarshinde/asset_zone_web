import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_asset_zone_web/controllers/properties_controller.dart';
import 'package:the_asset_zone_web/responsive.dart';
import 'package:the_asset_zone_web/widgets/helper_widgets.dart';

import '../../home/components/home_screen_widgets.dart';

class leftColumn extends StatelessWidget {
  const leftColumn({Key? key, required this.propertyDetails}) : super(key: key);
  final propertyDetails;

  List<Widget> getFlatDetailsRow(context, bedrooms, halls, area, bathrooms,
      garage) {
    List<String> flatDetails = [
      "Bedrooms",
      "Bathrooms",
      "Halls",
      "Sq ft",
      "Garage"
    ];
    List<String> values = [
      propertyDetails["property_about"]["bedrooms"].toString(),
      propertyDetails["property_about"]["bathroom"].toString(),
      propertyDetails["property_about"]["halls"].toString(),
      propertyDetails["property_about"]["property_size"].toString(),
      propertyDetails["property_about"]["garage"].toString()
    ];
    // List<String> values = [bedrooms, bathrooms, halls, area, garage];
    List<IconData> flatDetailsIcons = [
      Icons.bathtub_rounded,
      Icons.bed_rounded,
      Icons.chair_rounded,
      Icons.square_foot_rounded,
      Icons.garage_rounded
    ];
    List<Widget> children = [];
    for (int i = 0; i < flatDetails.length; i++) {
      Responsive.isMobile(context)
          ? children.add(
        Row(
          children: [
            Icon(
              flatDetailsIcons[i],
              color: const Color(0xFF1c2d3a),

            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: AutoSizeText(values[i]),
            ),
            AutoSizeText(
              flatDetails[i],
              maxFontSize: 14,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF1c2d3a)),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      )
          : children.add(
        Row(
          children: [
            Icon(
              flatDetailsIcons[i],
              color: const Color(0xFF1c2d3a),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: AutoSizeText(values[i]),
            ),
            AutoSizeText(
              flatDetails[i],
              maxFontSize: 14,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF1c2d3a)),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      );
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              AutoSizeText(
                "Orchard House",
                minFontSize: 15,
                style: GoogleFonts.montserrat(
                    fontSize: 30, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                width: 50,
              ),
              MyButton(
                title: "For Sale",
                height: 20,
                width: 80,
              )
            ],
          ),
          AutoSizeText(
            "Mina Road, Bur Dubai, Dubai, United Arab Emirates",
            style: GoogleFonts.montserrat(
                fontSize: 15, color: const Color(0xFF647589)),
          ),
          Responsive.isDesktop(context)
              ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              children:
              getFlatDetailsRow(context,
                  "2",
                  // propertyDetails["property_about"]["bedrooms"].toString(),
                  propertyDetails["property_about"]["bathroom"].toString(),
                  propertyDetails["property_about"]["balcony"].toString(), "2",
                  "0"),
            ),
          )
              : Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Column(
              children:
              getFlatDetailsRow(context, "2", "2", "300", "2", "0"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 100,
                    child: DottedBorder(
                      dashPattern: const [1, 3],
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(Icons.share),
                          ),
                          AutoSizeText("Share")
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 100,
                    child: DottedBorder(
                      dashPattern: const [1, 3],
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(Icons.save_alt),
                          ),
                          AutoSizeText("Save")
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 100,
                    child: DottedBorder(
                      dashPattern: const [1, 3],
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(Icons.print),
                            ),
                          ),
                          AutoSizeText("Print")
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class leftColumnMobile extends StatelessWidget {
  const leftColumnMobile({Key? key}) : super(key: key);

  List<Widget> getFlatDetailsRow(bedrooms, halls, area, bathrooms, garage) {
    List<String> flatDetails = [
      "Bedrooms",
      "Bathrooms",
      "Halls",
      "Sq ft",
      "Garage"
    ];
    List<IconData> flatDetailsIcons = [
      Icons.bathtub_rounded,
      Icons.bed_rounded,
      Icons.chair_rounded,
      Icons.square_foot_rounded,
      Icons.garage_rounded
    ];
    List<Widget> children = [];
    for (int i = 0; i < flatDetails.length; i++) {
      children.add(Icon(flatDetailsIcons[i], color: const Color(0xFF1c2d3a)));
      children.add(AutoSizeText(
        flatDetails[i],
        maxFontSize: 14,
        style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500, color: const Color(0xFF1c2d3a)),
      ));
      children.add(const SizedBox(
        width: 10,
      ));
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              AutoSizeText(textAlign: TextAlign.center,
                "Orchard House",
                minFontSize: 15,
                style: GoogleFonts.montserrat(
                    fontSize: 30, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                width: 50,
              ),
              MyButton(
                title: "For Sale",
                height: 20,
                width: 80,
              )
            ],
          ),
          AutoSizeText(
            "Mina Road, Bur Dubai, Dubai, United Arab Emirates",
            style: GoogleFonts.montserrat(
                fontSize: 15, color: const Color(0xFF647589)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Column(
              children: getFlatDetailsRow("2", "2", "300", "2", "0"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                DottedBorder(
                  dashPattern: const [1, 3],
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(8.0),
                  child: Row(
                    children: const [Icon(Icons.share), AutoSizeText("Share")],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                DottedBorder(
                  dashPattern: const [1, 3],
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(8.0),
                  child: Row(
                    children: const [
                      Icon(Icons.save_alt),
                      AutoSizeText("Save")
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                DottedBorder(
                  dashPattern: const [1, 3],
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(8.0),
                  child: Row(
                    children: const [Icon(Icons.print), AutoSizeText("Print")],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


