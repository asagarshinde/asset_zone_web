import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_asset_zone_web/models/property_detail_model.dart';

class SinglePagePropertyMiddleAboutContainer1 extends StatelessWidget {
  final PropertyDetails propertyDetails;

  const SinglePagePropertyMiddleAboutContainer1(
      {super.key, required this.propertyDetails});

  @override
  Widget build(BuildContext context) {
    return Text(propertyDetails.id);
  }
}

class SinglePagePropertyMiddleAboutContainer extends StatelessWidget {
  final PropertyDetails propertyDetails;

  const SinglePagePropertyMiddleAboutContainer(
      {super.key, required this.propertyDetails});

  @override
  Widget build(BuildContext context) {
    debugPrint(
        "SinglePagePropertyMiddleAboutContainer: ${propertyDetails.toString()}");
    String propertyType = propertyDetails.propertyAbout.propertyType;
    String price = (propertyDetails.isRent)
        ? propertyDetails.rentDetails!.rent.toString()
        : propertyDetails.saleDetails!.price.toString();
    String propertyId = propertyDetails.id;
    String propertySize =
        propertyDetails.propertyAreaDetails.carpetArea.toString();
    String propertyStatus = "property Status";
    String balcony = propertyDetails.propertyAbout.balcony.toString();
    String city = propertyDetails.address.city;
    String bedrooms = propertyDetails.propertyAbout.bedrooms.toString();
    String bathrooms = propertyDetails.propertyAbout.bathrooms.toString();

    debugPrint(
        "propertyType $propertyType, $price, $propertyId, $propertySize, $propertyStatus, $balcony, $city, $bedrooms, $bathrooms");
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double width = constraints.maxWidth;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: AutoSizeText("Property Details",
                      maxLines: 1,
                      style: GoogleFonts.rubik(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.black))),
              if (width < 600)
                AboutSingleRow(
                    descriptionList: {"Property Type": propertyType}),
              if (width < 600)
                AboutSingleRow(descriptionList: {"price": price}),
              if (width < 600) AboutSingleRow(descriptionList: {"city": city}),
              if (width > 600)
                AboutSingleRow(descriptionList: {
                  "Property Type": propertyType,
                  "price": price,
                  "city": city
                }),
              if (width < 600)
                AboutSingleRow(descriptionList: { "Property ID ": propertyId}),
              if (width < 600)
                AboutSingleRow(descriptionList: {"Property Size ": propertySize}),
              if (width < 600)
                AboutSingleRow(descriptionList: {"Bedrooms": bedrooms}),
              if (width > 600)
              AboutSingleRow(descriptionList: {
                "Property ID ": propertyId,
                "Property Size :": propertySize,
                "Bedrooms": bedrooms
              }),
              if (width < 600)
                AboutSingleRow(descriptionList: {"Property status ": propertyStatus}),
              if (width < 600)
                AboutSingleRow(descriptionList: {"Balcony ": balcony}),
              if (width < 600)
                AboutSingleRow(descriptionList: {"Bathrooms": bathrooms}),
              if (width > 600)
              AboutSingleRow(descriptionList: {
                "Property status ": propertyStatus,
                "Balcony ": balcony,
                "Bathrooms": bathrooms
              }),
            ],
          ),
        );
      },
    );
  }
}

class AboutSingleRow extends StatelessWidget {
  AboutSingleRow({super.key, required this.descriptionList});

  final Map<String, String> descriptionList;
  final rows = [];

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
                      maxLines: 1,
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
  const SinglePagePropertyMiddleFeaturesContainer({super.key});

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
  const SinglePagePropertyMiddleGalleryContainer({super.key});

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
  const SinglePagePropertyMiddleVideoContainer({super.key});

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
  const SinglePagePropertyMiddleFloorPlanContainer({super.key});

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
