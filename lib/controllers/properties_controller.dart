import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_asset_zone_web/controllers/search_controller.dart';
import 'package:the_asset_zone_web/models/property_detail_model.dart';
import 'package:the_asset_zone_web/screens/home/components/home_screen_widgets.dart';

class PropertyController extends GetxController {

  static PropertyController instance = Get.find();
  var firestoreDB = FirebaseFirestore.instance;
  var dummy_var = "".obs;
  late final propertiesList = [].obs;

  addPropertyDetails(PropertyDetails propertyDetails) async {
    await firestoreDB
        .collection("PropertyDetails")
        .add(propertyDetails.toMap());
  }

  setInSharedPreferences(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
  getFromSharedPreferences(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint(prefs.getString('auth'));
    return prefs.getString(key);
  }
  String getRandString(int len) {
    var random = Random.secure();
    var values = List<int>.generate(len, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  searchProperty() {
    final tempPropertyList = [];
    final searchPanelController = Get.put(MySearchController());
    String propertySubType =
        searchPanelController.selectedPropertySubType.value;
    String propertyType = searchPanelController.selectedPropertyType.value;
    String searchLocation = searchPanelController.searchLocation;
    debugPrint("Searching properties $propertyType and $propertySubType");
    // var querySnapshot = firestoreDB
    //     .collection("PropertyDetails")
    //     .where("property_about.locality", isEqualTo: searchLocation)
    //     .where("property_about.property_type",
    //     isEqualTo: propertyType.toLowerCase())
    //     .where("property_about.property_sub_type",
    //     isEqualTo: propertySubType.toLowerCase())
    //     .get();

    var querySnapshot = firestoreDB
        .collection("PropertyDetails")
        .where("property_about.property_type",
        isEqualTo: propertyType)
        .where("property_about.property_sub_type",
        isEqualTo: propertySubType)
        .get();

    querySnapshot.then(
          (value) {
        for (var doc in value.docs) {
          debugPrint(doc.data().toString());
          tempPropertyList.add(PropertyDetails.fromMap(doc.data()));
          propertiesList.value = tempPropertyList;
          debugPrint("Searched properties are ${doc}");
        }
      },
    );
    dummy_var.value = getRandString(5);
  }

  updatePropertyDetails(PropertyDetails propertyDetails) async {
    await firestoreDB
        .collection("PropertyDetails")
        .doc(propertyDetails.id)
        .update(propertyDetails.toMap());
  }

  Future<void> deletePropertyDetails(String documentId) async {
    await firestoreDB.collection("PropertyDetails").doc(documentId).delete();
  }

  Future<void> getPropertyFromId({required propertyId}) async {
    await firestoreDB.collection("propertyDetails").doc(propertyId).get();
  }

  Future<List<PropertyDetails>> retrieveAllPropertyDetails() async {
    var snapshot =
    await firestoreDB.collection("PropertyDetails").limit(4).get();
    return snapshot.docs.map((docSnapshot) {
      return PropertyDetails.fromMap(docSnapshot.data());
    }).toList();
  }

  setPropertyList() async {
    propertiesList.clear();
    debugPrint(" ********* \n ${propertiesList.length.toString()} \n *******");
    List<PropertyDetails> properties = await retrieveAllPropertyDetails();
    for (var property in properties) {
      propertiesList.add(property);
    }
  }

  Future<List<PropertyDetails>> retrievePropertyDetails(String propertiesFor,
      {int limit = 3}) async {
    bool isRent = (propertiesFor == "rent" ) ? true : false;
    if (propertiesFor == "all") {
      QuerySnapshot<Map<String, dynamic>> snapshot =
      await firestoreDB.collection("PropertyDetails").limit(limit).get();
      return snapshot.docs.map((docSnapshot) {
        PropertyDetails propertyDetails = PropertyDetails.fromMap(docSnapshot.data());
        // Map out = {};
        // out.addAll(docSnapshot.data());
        // out["id"] = docSnapshot.id;
        // return out;
        return propertyDetails;
      }).toList();
    } else {
      QuerySnapshot<Map<String, dynamic>> snapshot = await firestoreDB
          .collection("PropertyDetails")
          .where("isRent", isEqualTo: isRent)
          .limit(limit)
          .get();
      return snapshot.docs.map(
            (docSnapshot) {
              PropertyDetails propertyDetails = PropertyDetails.fromMap(docSnapshot.data());
              propertyDetails.setRentDetails(docSnapshot.data()["rentDetails"]);
          // Map out = {};
          // out.addAll(docSnapshot.data());
          // out["id"] = docSnapshot.id;
          // print("before");
              return propertyDetails;
          // var d = PropertyDetails.fromMap(docSnapshot.data());
          // return out;
        },
      ).toList();
    }
  }
}

class PropertiesList {
  Future<List<Widget>?> propertyList(propertiesFor, {limit = 3}) async {
    PropertyController dbservice = PropertyController();
    List<Widget> propertyList = [];
    String? carpetArea = "";
    var properties =
    await dbservice.retrievePropertyDetails(propertiesFor, limit: limit);
    // print("retrieved properties ${properties}");
    for (var property in properties) {
      print(property.propertyAbout);
      if (property.isRent){
        carpetArea = property.rentDetails?.carpetArea;
        propertiesFor = "Rent";
      }
      else {
        carpetArea = property.saleDetails.carpetArea;
        propertiesFor = "Sale";
      }
      carpetArea ??= "0";

      List<String> values = [
        property.propertyAbout.bedrooms.toString(),
        property.propertyAbout.bathrooms.toString(),
        carpetArea
      ];

      try {
        Widget tile = PropertyTile(
            propertyStatus: propertiesFor,
            propertyType: propertiesFor,
            inputImagePath: property.propertyAbout.gallery[0],//"https://firebasestorage.googleapis.com/v0/b/assets-zone.appspot.com/o/L11XqsUXddt2PmXX2kUe%2F4dd0af63-54fa-4328-a87a-cfbc54c870c8?alt=media&token=4a037eec-ce1a-4ce4-9649-89df80f191db",
            price: property.rentDetails!.rent,
            values: values,
            propertyDetails: property);
        propertyList.add(tile);
      } catch (e) {
        print("Error while creating tile ${e}");
        Widget tile = Text("abra");
        propertyList.add(tile);
      }



    }
    return propertyList;
  }

  // Future<List<Widget>?> propertyListSale() async {
  //   PropertyController dbservice = PropertyController();
  //   List<Widget> property_list = [];
  //   var properties = await dbservice.retrievePropertyDetails("For sale");
  //   // print(properties);
  //   for (var property in properties) {
  //     //print(property);
  //     List<String> values = [
  //       property["property_about"]["bedrooms"].toString(),
  //       property["property_about"]["bathrooms"].toString(),
  //       property["property_about"]["carpet_area"].toString(),
  //     ];
  //     Widget tile = PropertyTile(
  //         propertyStatus: property["property_about"]["property_status"],
  //         propertyType: property["property_about"]["property_type"],
  //         inputImagePath: property["gallery"][0],
  //         price: property["property_about"]["price"].toString(),
  //         values: values,
  //         propertyDetails: property);
  //     property_list.add(tile);
  //   }
  //   return property_list;
  // }

  // Future<List<Widget>?> propertyListBuy() async {
  //   PropertyController dbservice = PropertyController();
  //   List<Widget> property_list = [];
  //   var properties = await dbservice.retrievePropertyDetails("For Buy");
  //   // print(properties);
  //   for (var property in properties) {
  //     //print(property);
  //     Widget dummy = Text(property.toString());
  //     List<String> values = [
  //       property["property_about"]["bedrooms"].toString(),
  //       property["property_about"]["bathroom"].toString(),
  //       property["property_about"]["property_size"].toString(),
  //     ];
  //     Widget tile = PropertyTile(
  //         propertyStatus: property["property_about"]["property_status"],
  //         propertyType: property["property_about"]["property_type"],
  //         inputImagePath: property["gallery"][0],
  //         price: property["property_about"]["price"].toString(),
  //         values: values,
  //         propertyDetails: property);
  //     property_list.add(tile);
  //   }
  //   return property_list;
  // }
}
