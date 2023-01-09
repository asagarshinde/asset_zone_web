import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_asset_zone_web/controllers/home_page_card_controller.dart';
import 'package:the_asset_zone_web/models/property_detail_model.dart';
import 'package:the_asset_zone_web/screens/single_property_page/single_page_property.dart';
import 'package:the_asset_zone_web/search/search_page.dart';
//import 'package:the_asset_zone_web/search_page.dart';

import '../constants/constants.dart';

class MyButton extends StatefulWidget {
  final String title;
  var height;
  var width;

  MyButton({Key? key, required this.title, this.height, this.width})
      : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  List<PropertyDetails> lstPD = [];

  @override
  void initState() {
    fetchRecords();
    super.initState();
  }

  fetchRecords() async {
    var records =
    await FirebaseFirestore.instance.collection('PropertyDetails').get();
    mapRecords(records);
  }

  mapRecords(QuerySnapshot<Map<String, dynamic>> records) {
    try {

      var properties = records.docs.map((docSnapshot) {
        Map out = {};
        out..addAll(docSnapshot.data());
        out["id"] = docSnapshot.id;
        return out;
      }).toList();



      setState(() {
        //lstPD.addAll()
        for (var property in properties) {

          var propertyAbout = PropertyAbout(
              property_type: property["property_about"]["property_type"],
              bathroom: property["property_about"]["bathroom"],
              property_id: property["property_about"]["property_id"],
              property_status: property["property_about"]["property_status"],
              city: property["property_about"]["city"],
              bedrooms: property["property_about"]["bedrooms"],
              price: property["property_about"]["price"],
              property_size: property["property_about"]["property_size"],
              balcony: property["property_about"]["balcony"]);

          List<String> lstGallery = [];
          for(var gallery in property["gallery"]){
            lstGallery.add(gallery);
          }

          var propertyDetails = PropertyDetails(
              property["id"], lstGallery, propertyAbout, property["video"], property["floor_plan"],
              {"lon": property["location"]["lon"], "lat": property["location"]["lat"]});

          lstPD.add(propertyDetails);
        }
        //lstPD = _list;
      });
    } catch (e) {
      print("GettingError: $e");
    }
  }

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
          setState(() {
            // print("video from list : ${lstPD.length}");
          });

          PropertyDetailsFirestore dbservice = PropertyDetailsFirestore();

          List<PropertyDetails> lstPropertyDetails = <PropertyDetails>[];

          lstPropertyDetails.addAll(lstPD);

         /* lstPropertyDetails.add(PropertyDetails(
              "AC3EE99",
              ['assets/3.jpg', 'assets/4.jpg'],
              PropertyAbout(
                  property_type: "House1",
                  bathroom: 1,
                  property_id: "AC3EE90",
                  property_status: "For sale",
                  city: "Pune",
                  bedrooms: 1,
                  price: 1500,
                  property_size: 1500,
                  balcony: 3),
              "ahahdh1",
              "assets/2.jpg",
              {"lon": 22.687591323210615, "lat": 76.43698832653855}));
          lstPropertyDetails.add(PropertyDetails(
              "AC33399",
              ['assets/1.jpg', 'assets/2.jpg'],
              PropertyAbout(
                  property_type: "House2",
                  bathroom: 3,
                  property_id: "AC3EE91",
                  property_status: "For rent",
                  city: "Mumbai",
                  bedrooms: 3,
                  price: 2200,
                  property_size: 2500,
                  balcony: 2),
              "ahahdh2",
              "assets/3.jpg",
              {"lon": 22.687591323210615, "lat": 76.43698832653855}));
          lstPropertyDetails.add(PropertyDetails(
              "AC3aa99",
              ['assets/8.jpg', 'assets/5.jpg'],
              PropertyAbout(
                  property_type: "House3",
                  bathroom: 5,
                  property_id: "AC3EE92",
                  property_status: "For lease",
                  city: "Nasik",
                  bedrooms: 5,
                  price: 4400,
                  property_size: 3500,
                  balcony: 4),
              "ahahdh4",
              "assets/4.jpg",
              {"lon": 22.687591323210615, "lat": 76.43698832653855}));
          lstPropertyDetails.add(PropertyDetails(
              "AC30099",
              ['assets/11.jpg', 'assets/21.jpg'],
              PropertyAbout(
                  property_type: "House4",
                  bathroom: 8,
                  property_id: "AC3EE93",
                  property_status: "For sale",
                  city: "Surat",
                  bedrooms: 2,
                  price: 6600,
                  property_size: 4500,
                  balcony: 7),
              "ahahdh5",
              "assets/5.jpg",
              {"lon": 22.687591323210615, "lat": 76.43698832653855}));*/

          // PropertyAbout propertyAbout = PropertyAbout(property_type: "House", bathroom: 2, property_id: "AC3EE99", property_status: "For sale", city: "Pune", bedrooms: 1, price: 1500, property_size: 1500 , balcony: 3);
          // PropertyDetails propertyDetails = PropertyDetails("AC3EE99", ['assets/3.jpg','assets/4.jpg'], propertyAbout, "ahahdh", "assets/2.jpg", {"lon": 22.687591323210615, "lat": 76.43698832653855});

          //dbservice.addPropertyDetails(propertyDetails);
          //Future<List<Map>> out = dbservice.retrievePropertyDetails();
          //dbservice.getDocs();
          // print(out.toString());
          //PropertiesList pl = PropertiesList();
          // var l = pl.propertyList();
          // print(l);
          // print("Clicked on me who");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  SearchButtonNavigatorPage(
                    propertyDetails: lstPropertyDetails,
                  ),
            ),
          );
        },
        child: Center(
          child: Text(
            widget.title,
            style: buttonStyle,
          ),
        ),
      ),
    );
  }
}