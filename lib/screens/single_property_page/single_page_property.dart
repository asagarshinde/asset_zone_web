import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
import 'package:the_asset_zone_web/controllers/properties_controller.dart';
import 'package:the_asset_zone_web/responsive.dart';
import 'package:the_asset_zone_web/screens/home/components/navigation_bar.dart';
import 'package:the_asset_zone_web/screens/single_property_page/components/short_detail_card.dart';
import 'package:the_asset_zone_web/screens/single_property_page/components/single_page_property_middle.dart';
import 'package:the_asset_zone_web/screens/single_property_page/components/top_images_view.dart';

class SinglePagePropertyView extends StatelessWidget {
  SinglePagePropertyView(this.propertyDetails, {super.key});

  final ScrollController scrollController = ScrollController();
  final Key singlePropertyKey = const Key("singlePageProperty");
  final propertyDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 70),
              child: SimpleMenuBar() //MyNavigationBar(),
            )
          : AppBar(backgroundColor: kPrimaryColor),
      drawer: const MySimpleDrawer(),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        controller: scrollController,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const TopImagesView(),
                const SizedBox(
                  height: 60,
                ),
                Responsive(
                  key: singlePropertyKey,
                  mobile:
                      ShortDetailCardMobile(propertyDetails: propertyDetails),
                  tablet: ShortDetailCardDesktop(
                    propertyDetails: propertyDetails,
                  ),
                  desktop:
                      ShortDetailCardDesktop(propertyDetails: propertyDetails),
                ),
                const SizedBox(
                  height: 60,
                ),
                Responsive(
                  key: singlePropertyKey,
                  mobile: SinglePagePropertyMiddleMobile(
                    propertyDetails: propertyDetails,
                  ),
                  tablet: SinglePagePropertyMiddleDesktop(
                    propertyDetails: propertyDetails,
                  ),
                  desktop: SinglePagePropertyMiddleDesktop(
                    propertyDetails: propertyDetails,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

getSinglePageProperty({@required propertyId}) {
  PropertyController property = PropertyController();
  var property_details = property.getPropertyFromId(propertyId: propertyId);
}