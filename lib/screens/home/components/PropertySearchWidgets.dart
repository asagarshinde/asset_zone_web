import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_asset_zone_web/constants/controllers.dart';
import '../../../constants/constants.dart';
import '../../../controllers/search_controller.dart';

class AutoCompleteTextField extends StatefulWidget {
  AutoCompleteTextField({super.key});

  static Set<String> _kOption = <String>{"rajiv nagar", "sapana nagar"};
  final _searchPanelController = Get.put(MySearchController());

  @override
  State<AutoCompleteTextField> createState() => _AutoCompleteTextFieldState();
}

class _AutoCompleteTextFieldState extends State<AutoCompleteTextField> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: propertyController
          .getLocalityList(searchPanelController.selectedCity.value),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          AutoCompleteTextField._kOption = {...snapshot.data!};
          debugPrint("autocomplete snapshot ${snapshot.data.toString()}");
          return Autocomplete<String>(
            // initialValue: const TextEditingValue(text: "Enter the search area"),
            fieldViewBuilder:
                (context, controller, focusNode, onEditingComplete) {
              return TextField(
                controller: controller,
                focusNode: focusNode,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    // Clear initial value when the user starts typing
                    setState(() {
                      widget._searchPanelController.searchLocation = "null";
                    });
                  }
                },
                decoration: const InputDecoration(
                  hintText: 'Start typing area...',
                ),
                onEditingComplete: onEditingComplete,
              );
            },
            optionsViewBuilder:
                (BuildContext context, var onSelected, Iterable options) {
              return Align(
                alignment: Alignment.topLeft,
                child: Material(
                  child: Container(
                    width: 300,
                    color: kSecondaryColor,
                    child: ListView.builder(
                      itemCount: options.length,
                      itemBuilder: (BuildContext context, int index) {
                        final option = options.elementAt(index);
                        return GestureDetector(
                          onTap: () {
                            onSelected(option);
                          },
                          child: ListTile(
                            title: Text(
                              option,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == "") {
                return const Iterable<String>.empty();
              }
              return AutoCompleteTextField._kOption.where((option) {
                return option.contains(textEditingValue.text.toLowerCase());
              });
            },
            onSelected: (String selection) {
              widget._searchPanelController.searchLocation = selection;
              debugPrint('You just selected $selection');
            },
          );
        } else {
          return Text(snapshot.error.toString());
        }
      },
    );
  }
}

class PropertySearchCardSearchField extends StatefulWidget {
  const PropertySearchCardSearchField({super.key});

  @override
  State<PropertySearchCardSearchField> createState() =>
      _PropertySearchCardSearchFieldState();
}

class _PropertySearchCardSearchFieldState
    extends State<PropertySearchCardSearchField> {
  final _searchPanelController = Get.put(MySearchController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 30, 15, 5),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(width: 1.0, color: Colors.black12),
        ),
        child: TextFormField(
          onChanged: (value) {
            setState(() {
              _searchPanelController.searchLocation = value;
            });
          },
          onSaved: (value) {
            setState(() {
              _searchPanelController.searchLocation = value!;
            });
          },
          decoration: const InputDecoration(
              // contentPadding: EdgeInsets.symmetric(horizontal: 40.0),
              border: InputBorder.none),
          initialValue: "Search Location",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class PropertySearchCardSearchRangeSlider extends StatefulWidget {
  const PropertySearchCardSearchRangeSlider({super.key});

  @override
  State<PropertySearchCardSearchRangeSlider> createState() =>
      _PropertySearchCardSearchRangeSliderState();
}

class _PropertySearchCardSearchRangeSliderState
    extends State<PropertySearchCardSearchRangeSlider> {
  final _searchPanelController = Get.put(MySearchController());

  @override // const SizedBox(
  //   width: 120,
  // )
  Widget build(BuildContext context) {
    return RangeSlider(
      values: _searchPanelController.currentRangeValuesPrice.value,
      max: _searchPanelController.maxBudget.value,
      divisions: 1000,
      activeColor: kPrimaryColor,
      inactiveColor: Colors.black12,
      labels: RangeLabels(
        _searchPanelController.currentRangeValuesPrice.value.start
            .round()
            .toString(),
        _searchPanelController.currentRangeValuesPrice.value.end
            .round()
            .toString(),
      ),
      onChanged: (RangeValues values) {
        setState(
          () {
            _searchPanelController.currentRangeValuesPrice.value = values;
          },
        );
      },
    );
  }
}

class PropertySearchCardSearchRangeSliderSelectedValue extends StatelessWidget {
  const PropertySearchCardSearchRangeSliderSelectedValue(
      {super.key, required this.select});

  final String select;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final searchPanelController = Get.put(MySearchController());
      var myselect = select == "end"
          ? searchPanelController.currentRangeValuesPrice.value.end
          : searchPanelController.currentRangeValuesPrice.value.start;
      return AutoSizeText(
        overflow: TextOverflow.clip,
        select == "end" ? "${myselect / 1000}K" : "${myselect / 1000}K - ",
        // "${_currentRangeValuesPrice.end.toInt()}",
        style: kTextDefaultStyle,
      );
    });
  }
}

class PropertyTypeDropDown extends StatefulWidget {
  const PropertyTypeDropDown({super.key});

  @override
  State<PropertyTypeDropDown> createState() => _PropertyTypeDropDownState();
}

class _PropertyTypeDropDownState extends State<PropertyTypeDropDown> {
  @override
  Widget build(BuildContext context) {
    final searchPanelController = Get.put(MySearchController());
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 30, 15, 5),
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(width: 1.0, color: Colors.black12),
        ),
        child: DropdownButtonHideUnderline(
          // key: _searchPanelController.dropDownKey,
          child: DropdownButton<String>(
            isExpanded: true,
            alignment: AlignmentDirectional.center,
            value: searchPanelController.selectedPropertyType.value,
            items: getMenuItems(propertySearch),
            onChanged: (String? value) {
              setState(() {
                if (value != null) {
                  searchPanelController.selectedPropertyType.value =
                      value.toString();
                  searchPanelController.selectedPropertySubType.value =
                      maxRoomsDD[
                          searchPanelController.selectedPropertyType.value]![0];
                  searchPanelController.getPropertySubType(value);
                }
              });
            },
          ),
        ),
      ),
    );
  }
}

class PropertySubTypeDropDown extends StatefulWidget {
  const PropertySubTypeDropDown({super.key});

  @override
  State<PropertySubTypeDropDown> createState() =>
      _PropertySubTypeDropDownState();
}

class _PropertySubTypeDropDownState extends State<PropertySubTypeDropDown> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final searchPanelController = Get.put(MySearchController());
        return DropdownButtonHideUnderline(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 30, 15, 5),
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 1.0, color: Colors.black12),
              ),
              child: DropdownButton(
                isExpanded: true,
                alignment: AlignmentDirectional.center,
                value: searchPanelController.selectedPropertySubType.value,
                // items: searchPanelController.setItems(),
                // hint: Center(child: const Text("Property Sub Type")),
                items: searchPanelController.propertySubTypeMenu,
                onChanged: (value) {
                  setState(
                    () {
                      searchPanelController.selectedPropertySubType.value =
                          value.toString();
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class SaleOrRent extends StatefulWidget {
  const SaleOrRent({super.key});

  @override
  State<SaleOrRent> createState() => _SaleOrRentState();
}

class _SaleOrRentState extends State<SaleOrRent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 30, 15, 5),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Rent",
              style: kTextDefaultStyle,
            ),
            Switch(
              value: searchPanelController.selectedPropertyFor.value,
              onChanged: (value) {
                setState(
                  () {
                    searchPanelController.selectedPropertyFor.value = value;
                  },
                );
              },
            ),
            Text(
              "Sale",
              style: kTextDefaultStyle,
            )
          ]),
    );
  }
}

class CityDropDown extends StatefulWidget {
  const CityDropDown({super.key});

  @override
  State<CityDropDown> createState() => _CityDropDownState();
}

class _CityDropDownState extends State<CityDropDown> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final searchPanelController = Get.put(MySearchController());
        return DropdownButtonHideUnderline(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 30, 15, 5),
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 1.0, color: Colors.black12),
              ),
              child: DropdownButton(
                isExpanded: true,
                alignment: AlignmentDirectional.center,
                value: searchPanelController.selectedCity.value,
                items: getMenuItems(citiesList),
                onChanged: (value) {
                  setState(
                    () {
                      searchPanelController.selectedCity.value =
                          value.toString();
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
