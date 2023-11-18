import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_asset_zone_web/controllers/properties_controller.dart';
import 'package:the_asset_zone_web/models/property_detail_model.dart';

class SinglePagePropertyMiddleAboutContainer extends StatelessWidget {
  var propertyDetails;

  SinglePagePropertyMiddleAboutContainer(
      {Key? key, required this.propertyDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var propertyAbout = propertyDetails;
    String propertyType = propertyAbout["property_type"].toString();
    String price = propertyAbout["price"].toString();
    String propertyId = propertyAbout["property_id"].toString();
    String propertySize = propertyAbout["carpet_area"].toString();
    String propertyStatus = propertyAbout["property_status"].toString();
    String balcony = propertyAbout["balcony"].toString();
    String city = propertyAbout["city"].toString();
    String bedrooms = propertyAbout["bedrooms"].toString();
    String bathrooms = propertyAbout["bathrooms"].toString();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: AutoSizeText(
              "Property Details",
              style: GoogleFonts.rubik(
                  fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black),
            ),
          ),
          AboutSingleRow(descriptionList: {
            "Property Type": propertyType,
            "price": price,
            "city": city
          }),
          AboutSingleRow(descriptionList: {
            "Property ID ": propertyId,
            "Property Size :": propertySize,
            "Bedrooms": bedrooms
          }),
          AboutSingleRow(descriptionList: {
            "Property status ": propertyStatus,
            "Balcony ": balcony,
            "Bathrooms": bathrooms
          }),
        ],
      ),
    );
  }
}

class AboutSingleRow extends StatelessWidget {
  AboutSingleRow({Key? key, required this.descriptionList}) : super(key: key);

  final Map<String, String> descriptionList;
  var rows = [];

  getRow() {
    descriptionList.forEach(
      (key, value) {
        rows.add(
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: AutoSizeText(
                      "$key :",
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(88, 97, 103, 0.83)),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: AutoSizeText(
                      value,
                      style: GoogleFonts.montserrat(
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [...getRow()],
    );
  }
}

class SinglePagePropertyMiddleFeaturesContainer extends StatelessWidget {
  const SinglePagePropertyMiddleFeaturesContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: AutoSizeText(
        "Features",
        style: GoogleFonts.rubik(
            fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black),
      ),
    );
  }
}

class SinglePagePropertyMiddleGalleryContainer extends StatelessWidget {
  const SinglePagePropertyMiddleGalleryContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: AutoSizeText(
        "Gallery",
        style: GoogleFonts.rubik(
            fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black),
      ),
    );
  }
}

class SinglePagePropertyMiddleVideoContainer extends StatelessWidget {
  const SinglePagePropertyMiddleVideoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: AutoSizeText(
        "Video",
        style: GoogleFonts.rubik(
            fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black),
      ),
    );
  }
}

class SinglePagePropertyMiddleFloorPlanContainer extends StatelessWidget {
  const SinglePagePropertyMiddleFloorPlanContainer({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: AutoSizeText(
        "FloorPlan",
        style: GoogleFonts.rubik(
            fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black),
      ),
    );
  }
}
