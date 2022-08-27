import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/screens/single_property_page/components/short_detail_card_left_column.dart';
import 'package:the_asset_zone_web/screens/single_property_page/components/short_detail_card_right_column.dart';

class ShortDetailCardDesktop extends StatelessWidget {
  ShortDetailCardDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width > 950 ? width * 0.08 : width * 0.08),
      child: Card(
        elevation: 15,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(flex: 5, child: leftColumn()),
              // Expanded(flex: 1, child: Spacer()),
              Expanded(flex: 2, child: rightColumn())
            ],
          ),
        ),
      ),
    );
  }
}

class ShortDetailCardMobile extends StatelessWidget {
  ShortDetailCardMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        elevation: 15,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              leftColumn(),
              SizedBox(
                height: 10,
              ),
              rightColumn()
            ],
          ),
        ),
      ),
    );
  }
}