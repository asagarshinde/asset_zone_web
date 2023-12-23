import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
import 'package:the_asset_zone_web/controllers/properties_controller.dart';
import 'package:the_asset_zone_web/models/property_detail_model.dart';
import 'package:the_asset_zone_web/responsive.dart';
import 'package:the_asset_zone_web/screens/home/components/navigation_bar.dart';
import 'package:the_asset_zone_web/screens/single_property_page/components/short_detail_card.dart';
import 'package:the_asset_zone_web/screens/single_property_page/components/single_page_property_middle.dart';
import 'package:the_asset_zone_web/screens/single_property_page/components/top_images_view.dart';

class SinglePagePropertyView extends StatelessWidget {
  SinglePagePropertyView(this.propertyId, {super.key});

  final ScrollController scrollController = ScrollController();
  final Key singlePropertyKey = const Key("singlePageProperty");
  final String propertyId;

  @override
  Widget build(BuildContext context) {
    PropertyController property = PropertyController();
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 70),
              child: const SimpleMenuBar() //MyNavigationBar(),
              )
          : AppBar(backgroundColor: kPrimaryColor),
      drawer: const MySimpleDrawer(),
      body: FutureBuilder<PropertyDetails>(
        future: property.getPropertyFromId(propertyId: propertyId),
        builder: (context, snapshot) {
          debugPrint("propertyid is $propertyId, snapshot: ");
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            debugPrint("propertyid in error $propertyId, snapshot: ");
            return Center(
                child: Text(
                    'Error: ${snapshot.error}')); // Display an error message if an error occurs
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data available'));
          } else {
            PropertyDetails propertyDetails = snapshot.data!;
            return SingleProperty(
                scrollController: scrollController,
                singlePropertyKey: singlePropertyKey,
                propertyDetails: propertyDetails);
          }
        },
      ),
    );
  }
}

class SingleProperty extends StatelessWidget {
  const SingleProperty({
    super.key,
    required this.scrollController,
    required this.singlePropertyKey,
    required this.propertyDetails,
  });

  final ScrollController scrollController;
  final Key singlePropertyKey;
  final PropertyDetails propertyDetails;

  @override
  Widget build(BuildContext context) {
    debugPrint("Building SingleProperty Widget");
    return CustomScrollView(
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
                mobile: ShortDetailCardMobile(propertyDetails: propertyDetails),
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
    );
  }
}
