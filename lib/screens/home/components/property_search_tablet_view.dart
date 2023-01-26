import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
import 'package:the_asset_zone_web/widgets/helper_widgets.dart';
import 'PropertySearchWidgets.dart';


class PropertySearchTabletView extends StatelessWidget {
  const PropertySearchTabletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        print(constraints.maxWidth);
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            margin: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                Row(
                  children: const [
                    Expanded(flex:1, child: PropertySearchCardSearchField()),
                    Expanded(flex:1, child: PropertyTypeDropDown())
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: PropertySubTypeDropDown(),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                "Budget ",
                                style: kTextDefaultStyle,
                              ),
                            ),
                            PropertySearchCardSearchRangeSliderSelectedValue(
                                select: "start"),
                            PropertySearchCardSearchRangeSliderSelectedValue(
                                select: "end"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: PropertySearchCardSearchRangeSlider(),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child:
                              MyButton(title: "Search"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
