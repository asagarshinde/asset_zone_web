import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/models/property_detail_model.dart';
import 'package:the_asset_zone_web/screens/single_property_page/components/short_detail_card_left_column.dart';
import 'package:the_asset_zone_web/screens/single_property_page/components/short_detail_card_right_column.dart';

class ShortDetailCardDesktop extends StatelessWidget {
  const ShortDetailCardDesktop({super.key, required this.propertyDetails});
  final PropertyDetails propertyDetails;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width > 950 ? width * 0.13 : width * 0.08),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(flex: 5, child: LeftColumn(propertyDetails: propertyDetails,)),
              // Expanded(flex: 1, child: Spacer()),
              const Expanded(flex: 2, child: rightColumn())
            ],
          ),
        ),
      ),
    );
  }
}

class ShortDetailCardMobile extends StatelessWidget {
  const ShortDetailCardMobile({super.key, required this.propertyDetails});
  final PropertyDetails propertyDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        elevation: 15,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              LeftColumn(propertyDetails: propertyDetails,),
              SizedBox(
                height: 10,
              ),
              // rightColumn()
            ],
          ),
        ),
      ),
    );
  }
}