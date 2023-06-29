import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
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

    var querySnapshot = firestoreDB
        .collection("PropertyDetails")
        .where("property_about.locality", isEqualTo: searchLocation)
        .where("property_about.property_type",
        isEqualTo: propertyType.toLowerCase())
        .where("property_about.property_sub_type",
        isEqualTo: propertySubType.toLowerCase())
        .get();

    querySnapshot.then(
          (value) {
        for (var doc in value.docs) {
          tempPropertyList.add(PropertyDetails.fromMap(doc.data()));
          propertiesList.value = tempPropertyList;
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
    List<PropertyDetails> properties = await retrieveAllPropertyDetails();
    for (var property in properties) {
      propertiesList.add(property);
    }
  }

  Future<List<Map>> retrievePropertyDetails(String status,
      {int limit: 3}) async {
    if (status == "all") {
      QuerySnapshot<Map<String, dynamic>> snapshot =
      await firestoreDB.collection("PropertyDetails").limit(limit).get();
      return snapshot.docs.map((docSnapshot) {
        Map out = {};
        out.addAll(docSnapshot.data());
        out["id"] = docSnapshot.id;
        return out;
      }).toList();
    } else {
      QuerySnapshot<Map<String, dynamic>> snapshot = await firestoreDB
          .collection("PropertyDetails")
          .where("property_about.property_status", isEqualTo: status)
          .limit(limit)
          .get();
      return snapshot.docs.map(
            (docSnapshot) {
          Map out = {};
          out.addAll(docSnapshot.data());
          out["id"] = docSnapshot.id;
          return out;
        },
      ).toList();
    }
  }
}

class PropertiesList {
  Future<List<Widget>?> propertyList(propety_for, {limit = 3}) async {
    PropertyController dbservice = PropertyController();
    List<Widget> property_list = [];
    var properties =
    await dbservice.retrievePropertyDetails(propety_for, limit: limit);
    for (var property in properties) {
      // Widget dummy = Text(property.toString());
      List<String> values = [
        property["property_about"]["bedrooms"].toString(),
        property["property_about"]["bathroom"].toString(),
        property["property_about"]["property_size"].toString(),
      ];
      Widget tile = PropertyTile(
          propertyStatus: property["property_about"]["property_status"],
          propertyType: property["property_about"]["property_type"],
          inputImagePath: property["gallery"][0],
          price: property["property_about"]["price"].toString(),
          values: values,
          propertyDetails: property);
      property_list.add(tile);
    }
    return property_list;
  }

  Future<List<Widget>?> propertyListSale() async {
    PropertyController dbservice = PropertyController();
    List<Widget> property_list = [];
    var properties = await dbservice.retrievePropertyDetails("For sale");
    // print(properties);
    for (var property in properties) {
      //print(property);
      Widget dummy = Text(property.toString());
      List<String> values = [
        property["property_about"]["bedrooms"].toString(),
        property["property_about"]["bathroom"].toString(),
        property["property_about"]["property_size"].toString(),
      ];
      Widget tile = PropertyTile(
          propertyStatus: property["property_about"]["property_status"],
          propertyType: property["property_about"]["property_type"],
          inputImagePath: property["gallery"][0],
          price: property["property_about"]["price"].toString(),
          values: values,
          propertyDetails: property);
      property_list.add(tile);
    }
    return property_list;
  }

  Future<List<Widget>?> propertyListBuy() async {
    PropertyController dbservice = PropertyController();
    List<Widget> property_list = [];
    var properties = await dbservice.retrievePropertyDetails("For Buy");
    // print(properties);
    for (var property in properties) {
      //print(property);
      Widget dummy = Text(property.toString());
      List<String> values = [
        property["property_about"]["bedrooms"].toString(),
        property["property_about"]["bathroom"].toString(),
        property["property_about"]["property_size"].toString(),
      ];
      Widget tile = PropertyTile(
          propertyStatus: property["property_about"]["property_status"],
          propertyType: property["property_about"]["property_type"],
          inputImagePath: property["gallery"][0],
          price: property["property_about"]["price"].toString(),
          values: values,
          propertyDetails: property);
      property_list.add(tile);
    }
    return property_list;
  }
}
