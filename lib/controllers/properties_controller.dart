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
  var dummyVar = "".obs;
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
    String city = searchPanelController.selectedCity.value;
    debugPrint("Searching properties $propertyType and $propertySubType from location $searchLocation in city $city");

    var querySnapshot = firestoreDB
        .collection("PropertyDetails")
    .where("address.city", isEqualTo: city)
        .where("address.localityOrArea", isEqualTo: searchLocation)
        .where("propertyAbout.propertySubType", isEqualTo: propertySubType)
        .where("propertyAbout.propertyType", isEqualTo: propertyType)
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
    dummyVar.value = getRandString(5);
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

  Future<PropertyDetails> getPropertyFromId({required propertyId}) async {
    debugPrint("Executing now");
    var snapshot =
        await firestoreDB.collection("PropertyDetails").doc(propertyId).get();
    return PropertyDetails.fromMap(snapshot.data()!);
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
    List<PropertyDetails> properties = await retrieveAllPropertyDetails();
    for (var property in properties) {
      propertiesList.add(property);
    }
  }

  Future<List<PropertyDetails>> retrievePropertyDetails(String propertiesFor,
      {int limit = 3}) async {
    bool isRent = (propertiesFor == "rent") ? true : false;
    if (propertiesFor == "all") {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await firestoreDB.collection("PropertyDetails").limit(limit).get();
      return snapshot.docs.map((docSnapshot) {
        PropertyDetails propertyDetails =
            PropertyDetails.fromMap(docSnapshot.data());
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
          debugPrint("in retrieve property id is ${docSnapshot.data()['id']}");
          PropertyDetails propertyDetails =
              PropertyDetails.fromMap(docSnapshot.data());
          debugPrint(
              "property details from map then id is  ${propertyDetails.id}");
          if (isRent) {
            propertyDetails.setRentDetails(docSnapshot.data()["rentDetails"]);
            debugPrint("rent details are set");
          } else {
            propertyDetails.setSaleDetails(docSnapshot.data()["saleDetails"]);
            debugPrint("sale details are set");
          }
          debugPrint("in retrieve property");

          return propertyDetails;
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
      if (property.isRent) {
        carpetArea = property.rentDetails?.carpetArea;
        propertiesFor = "Rent";
      } else {
        carpetArea = property.propertyAreaDetails.carpetArea.toString();
        propertiesFor = "Sale";
      }
      carpetArea ??= "0";
      debugPrint("in property list loop ${carpetArea}");
      List<String> values = [
        property.propertyAbout.bedrooms.toString(),
        property.propertyAbout.bathrooms.toString(),
        carpetArea
      ];
      debugPrint("arguments for property tile values: $values, propertiesFor : $propertiesFor, gallery: ${property.gallery[0]}");
      try {
        Widget tile = PropertyTile(
            propertyStatus: propertiesFor,
            propertyType: propertiesFor,
            inputImagePath: property.gallery[0],
            price: (property.isRent)
                ? property.rentDetails!.rent.toString()
                : property.saleDetails!.price.toString(),
            values: values,
            propertyDetails: property);
        propertyList.add(tile);
      } catch (e) {
        debugPrint("Error while creating tile checking $e");
        Widget tile = const Text(
            "Error while loading properties, please connect to admin.");
        propertyList.add(tile);
      }
    }
    return propertyList;
  }
}
