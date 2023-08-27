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
  const PropertyCardGridViewStateless({Key? key}) : super(key: key);

  List<Widget> getIconDescriptionRow(index) {
    List<IconData> icons = [
      Icons.bedroom_parent,
      Icons.bathroom,
      Icons.area_chart
    ];
    List<String> texts = ["Bed:", "Bath:", "Sq Ft:"];
    List<Widget> row = [];
    PropertyDetails property = propertyController.propertiesList[index];
    List<String> values = [
      property.propertyAbout.bedrooms.toString(),
      property.propertyAbout.bathroom.toString(),
      property.propertyAbout.propertySize.toString()
    ];

    for (int i = 0; i < icons.length; i++) {
      if (i != icons.length) {
        row.add(DescriptionRowElement(
            icon: icons[i], text: texts[i], value: values[i]));
        row.add(const VerticalDivider(
          color: Colors.black,
          thickness: 2.0,
        ));
      }
    }
    row.removeAt(row.length - 1);
    return row;
  }

  @override
  Widget build(BuildContext context) {
    propertyController.setPropertyList();
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
            Container(
              padding: const EdgeInsets.all(8),
              height: 800,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 700,
                    childAspectRatio: 1.3,
                    mainAxisExtent: 535),
                // mainAxisExtent to fix vertical size
                padding: kDefaultPadding,
                itemCount: propertyController.propertiesList.length,
                itemBuilder: (BuildContext context, int index) {
                  PropertyDetails property =
                  propertyController.propertiesList[index];
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      return SizedBox(
                        width: 250,
                        child: Card(
                          elevation: kElevation,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
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
                                          30, 10, 0, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                              (propertyController
                                                  .propertiesList[index]
                                                  .propertyAbout
                                                  .city
                                                  .toUpperCase()),
                                              style: kTextDefaultStyle.copyWith(
                                                  letterSpacing: 3)),
                                          kDefaultSizedBox,
                                          AutoSizeText("Little Acorn Farm",
                                              style: kTextHeader2Style),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical:
                                                kDefaultSizedBoxWidth / 2),
                                            child: AutoSizeText(
                                                (propertyController
                                                    .propertiesList[index]
                                                    .propertyAbout
                                                    .price
                                                    .toString()),
                                                style:
                                                kTextHeader2Style.copyWith(
                                                    color:
                                                    kSecondaryColor)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical:
                                                kDefaultSizedBoxWidth / 2),
                                            child: IntrinsicHeight(
                                              child: Wrap(
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
                                                onTap: (){
                                              print("i dont know how come ontap tapped. ");
                                              GoRouter.of(context).go('/singleproperty', extra: property.toMap());
                                              },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
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
      {Key? key, required this.icon, required this.text, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Icon(icon),
        const SizedBox(width: 5),
        Text(text),
        const SizedBox(width: 5),
        Text(value),
      ],
    );
  }
}
