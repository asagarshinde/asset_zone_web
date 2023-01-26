import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_asset_zone_web/controllers/properties_controller.dart';
import 'package:the_asset_zone_web/controllers/search_controller.dart';
import 'package:the_asset_zone_web/models/property_detail_model.dart';
import 'package:the_asset_zone_web/constants/constants.dart';

class MyButton extends StatefulWidget {
  final String title;
  final height;
  final width;
  final onTap;

  const MyButton(
      {Key? key, required this.title, this.height, this.width, this.onTap})
      : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  final propertyDetailsFirestore = Get.put(PropertyController());
  List<PropertyDetails> lstPD = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 100,
      height: widget.height ?? 50,
      decoration: BoxDecoration(
          color: kSecondaryColor, borderRadius: BorderRadius.circular(4)),
      child: InkWell(
        highlightColor: Colors.white38,
        splashColor: Colors.white,
        onTap: () {
          setState(
            () {
              print("are clicked re bho");
              propertyDetailsFirestore.searchProperty();
            },
          );
        },
        child: Center(
          child: Text(
            widget.title,
            style: kButtonStyle,
          ),
        ),
      ),
    );
  }
}

searchProperty(context) async {
  final searchPanelController = Get.put(SearchController());
  final propertyDetailsFirestore = Get.put(PropertyController());
  String propertySubType = searchPanelController.selectedPropertySubType.value;
  String propertyType = searchPanelController.selectedPropertyType.value;
  String searchLocation = searchPanelController.searchLocation;
  print(
      "propertySubType : $propertySubType, propertyType: $propertyType, searchLocation: $searchLocation");
  final querySnapshot = await propertyDetailsFirestore.firestoreDB
      .collection("PropertyDetails")
      .where("property_about.locality", isEqualTo: searchLocation)
      .where("property_about.property_type",
          isEqualTo: propertyType.toLowerCase())
      .where("property_about.property_type",
          isEqualTo: propertySubType.toLowerCase())
      .get();
  var docs_map = querySnapshot.docs.map((docSnapshot) {
    propertyDetailsFirestore.propertiesList.add(docSnapshot);
    print(docSnapshot);
    print(propertyDetailsFirestore.propertiesList);
    // return PropertyDetails.fromMap(docSnapshot.data());
  }).toList();
  docs_map.forEach((element) {
    print(element);
  });
  print(propertyDetailsFirestore.propertiesList);
  // try {
  //   GoRouter.of(context).go('/singleproperty', extra: propertiesList);
  // }
  // catch (e){
  //   return Text("$e");
  // }
}
