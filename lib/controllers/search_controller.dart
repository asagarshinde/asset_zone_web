import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/constants.dart';

class MySearchController extends GetxController {
  static MySearchController instance = Get.find();
  Key dropDownKey = const ValueKey("propertySearchPanel");

  String searchString = "Search Location".obs();
  var selectedPropertyType = "Property Type".obs;
  var selectedPropertySubType = "Property Sub Type".obs;
  String searchLocation = "".obs();
  var minBudget = 100000.0.obs;
  var maxBudget = 1000000.0.obs;
  List<String> items2 = ["1", "2", "3"].obs;
  var currentRangeValuesPrice = const RangeValues(100000, 1000000).obs;
  List<DropdownMenuItem<String>> propertySubTypeMenu = [
    const DropdownMenuItem<String>(
        value: "Property Sub Type",
        child: Center(child: Text("Property Sub Type")))
  ].obs();

  setSelectedPropertyType(value) {
    selectedPropertyType = value;
  }

  setSelectedPropertySubType(value) {
    selectedPropertySubType.value = value;
  }

  getPropertySubType(String propertyType) {
    print("selected property type received in ${propertyType}");
    List<DropdownMenuItem<String>> menuItems = [];
    List<String>? items = maxRoomsDD[propertyType];
    items?.forEach((element) {
      menuItems.add(DropdownMenuItem(
          value: element,
          child: Center(
            child: Text(element),
          )));
    });
    // propertySubTypeMenu = menuItems;
    propertySubTypeMenu = menuItems;
    print("from get sub menu ${propertySubTypeMenu}");
  }
}

List<DropdownMenuItem<String>> getMenuItems(Map<String, List<String>> myitems) {
  List<DropdownMenuItem<String>> menuItems = [];
  myitems.forEach((key, List<String> value) {
    menuItems.add(DropdownMenuItem(
        value: key,
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            key,
          ),
        )));
    for (int i = 0; i < value.length; i++) {
      menuItems.add(DropdownMenuItem(
          value: value[i], child: Center(child: Text(value[i]))));
    }
  });
  return menuItems;
}

List<DropdownMenuItem<String>> getPropertySubType(String propertyType) {
  List<DropdownMenuItem<String>> menuItems = [];
  List<String>? items = maxRoomsDD[propertyType];
  items?.forEach((element) {
    menuItems.add(DropdownMenuItem(
        value: element,
        child: Center(
            child: Text(
          element,
          textAlign: TextAlign.center,
        ))));
  });
  return menuItems;
}
