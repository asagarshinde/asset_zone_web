import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
import 'package:the_asset_zone_web/constants/controllers.dart';
import 'package:the_asset_zone_web/models/property_detail_model.dart';
import 'package:the_asset_zone_web/screens/property/components/property_photo_carousel.dart';
import 'package:the_asset_zone_web/widgets/helper_widgets.dart';

class PropertyCardGridViewStateless extends StatelessWidget {
  const PropertyCardGridViewStateless({super.key, required this.isQueried});
  final bool isQueried;

  List<Widget> getIconDescriptionRow(index) {
    List<IconData> icons = [
      Icons.bedroom_parent,
      Icons.bathtub,
      Icons.store_mall_directory
    ];
    List<String> texts = ["Bed:", "Bath:", "Area:"];
    List<Widget> row = [];
    PropertyDetails property = propertyController.propertiesList[index];
    List<String> values = [
      property.propertyAbout.bedrooms.toString(),
      property.propertyAbout.bathrooms.toString(),
      "${property.propertyAreaDetails.carpetArea.toString()} sqft"
    ];

    for (int i = 0; i < icons.length; i++) {
      if (i != icons.length) {
        row.add(DescriptionRowElement(
            icon: icons[i], text: texts[i], value: values[i]));
        row.add(
          const SizedBox(
            height: 30,
            child: VerticalDivider(
              color: kSecondaryColor,
              thickness: 2.0,
            ),
          ),
        );
      }
    }
    row.removeAt(row.length - 1);
    return row;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("1. Building PropertyCardGridViewStateless.");
    debugPrint("2. Calling propertyController.setPropertyList();" );
    // if(isQueried){
    //   // propertyController.propertiesList.value = [];
    //   debugPrint("4. is it queried $isQueried");
    //   propertyController.setPropertyList();
    // } else {
    //   // propertyController.setPropertyList();
    //   propertyController.searchProperty();
    // }

    return Obx(
      () => MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeLeft: true,
        removeRight: true,
        child: Column(
          children: [
            AutoSizeText(
              "Properties Listing",
              style:
                  GoogleFonts.rubik(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            const Divider(),
            SizedBox(
              // padding: const EdgeInsets.symmetric(horizontal: 8),
              height: 600,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 500,
                    childAspectRatio: 1.0,
                    mainAxisExtent: 535),
                // mainAxisExtent to fix vertical size
                padding: kDefaultPadding,
                itemCount: propertyController.propertiesList.length,
                itemBuilder: (BuildContext context, int index) {
                  debugPrint("5. length of properties in grid builder is ${propertyController.propertiesList.length} with iter $index .");
                  PropertyDetails property =
                      propertyController.propertiesList[index];
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      return Card(
                        elevation: kElevation,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: PropertyPhotoCarousel(
                                  imageList: propertyController
                                      .propertiesList[index].gallery),
                            ),
                            Expanded(
                              flex: 1,
                              child: Wrap(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 0, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                            (property
                                                .address
                                                .city
                                                .toUpperCase()),
                                            style: kTextDefaultStyle.copyWith(
                                                letterSpacing: 3)),
                                        kDefaultSizedBox,
                                        AutoSizeText(
                                            property.address.buildingName,
                                            style: kTextHeader2Style),
                                        // price
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical:
                                                  kDefaultSizedBoxWidth / 2),
                                          child: AutoSizeText(
                                              ((propertyController
                                                      .propertiesList[index]
                                                      .isRent)
                                                  ? "${property.rentDetails!.rent.toString()} ₹"
                                                  : "${property.saleDetails!.price.toString()} ₹"),
                                              style:
                                                  kTextHeader2Style.copyWith(
                                                      color:
                                                          kSecondaryColor)),
                                        ),
                                        // icon details row
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical:
                                                  kDefaultSizedBoxWidth / 2),
                                          child: IntrinsicHeight(
                                            child: Wrap(
                                              alignment: WrapAlignment.spaceEvenly,
                                              children: getIconDescriptionRow(
                                                  index),
                                            ),
                                          ),
                                        ),
                                        Wrap(
                                          children: [
                                            Text(kDateformat.format(
                                                propertyController
                                                    .propertiesList[index]
                                                    .uploadDate
                                                    .toDate())),
                                            const SizedBox(width: 40),
                                            MyButton(
                                              title: "Details",
                                              height: 30,
                                              onTap: () {
                                                GoRouter.of(context).go(
                                                    '/singleproperty',
                                                    extra: property.toMap());
                                              },
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 100,)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DescriptionRowElement extends StatelessWidget {
  final IconData icon;
  final String text;
  final String value;

  const DescriptionRowElement(
      {super.key, required this.icon, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Icon(icon, color: kSecondaryColor,),
        const SizedBox(width: 5),
        Text(text),
        const SizedBox(width: 5),
        Text(value),
      ],
    );
  }
}
