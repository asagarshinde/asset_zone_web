import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
import 'package:the_asset_zone_web/constants/controllers.dart';
import 'package:the_asset_zone_web/widgets/helper_widgets.dart';
import 'PropertySearchWidgets.dart';

class PropertySearchPanel extends StatelessWidget {
  const PropertySearchPanel({super.key});

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
                    const Expanded(child: SaleOrRent()),
                    const Expanded(child: CityDropDown()),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 30, 15, 5),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12)),
                            child: AutoCompleteTextField()),
                      ), // PropertySearchCardSearchField(),
                    ),
                    const Expanded(child: PropertyTypeDropDown()),
                    const Expanded(child: PropertySubTypeDropDown())
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
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Budget ",
                                style: kTextDefaultStyle,
                              ),
                            ),
                            const PropertySearchCardSearchRangeSliderSelectedValue(
                                select: "start"),
                            const PropertySearchCardSearchRangeSliderSelectedValue(
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
                                  title: "Search",
                                  onTap: () {
                                    propertyController.searchProperty();
                                    GoRouter.of(context).go('/search');
                                  },
                                ),
                              ),
                            ),
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
