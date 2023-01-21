import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
// import 'package:the_asset_zone_web/search/propety_screen.dart';
import 'package:the_asset_zone_web/widgets/helper_widgets.dart';
import 'PropertySearchWidgets.dart';

class PropertySearchMobileView extends StatelessWidget {
  PropertySearchMobileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            margin: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                AutoCompleteTextField(),
                // const PropertySearchCardSearchField(),
                const PropertyTypeDropDown(),
                PropertySubTypeDropDown(),
                const PropertySearchCardSearchRangeSlider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Budget ",
                        style: khomePagePropertySearchPanelDDPanel,
                      ),
                    ),
                    PropertySearchCardSearchRangeSliderSelectedValue(
                        select: "start"),
                    PropertySearchCardSearchRangeSliderSelectedValue(
                        select: "end"),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: MyButton(
                    title: "Search",
                    height: 40,
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
