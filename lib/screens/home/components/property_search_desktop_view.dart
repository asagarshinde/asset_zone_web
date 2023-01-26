import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
import 'package:the_asset_zone_web/widgets/helper_widgets.dart';
import 'PropertySearchWidgets.dart';


class PropertySearchPanel extends StatelessWidget {
  const PropertySearchPanel({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: 800,
          child: Card(
            color: Colors.white,
            // elevation: 1.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            margin: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: PropertySearchCardSearchField(),
                    ),
                    const Expanded(
                      child: PropertyTypeDropDown(),
                    ),
                    Expanded(
                      child: PropertySubTypeDropDown(),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
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
                      const Expanded(
                        flex: 8,
                        child: PropertySearchCardSearchRangeSlider(),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: MyButton(
                                    title: "Search"

                                ),
                              ),
                            ),
                            // const SizedBox(
                            //   width: 120,
                            // )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
