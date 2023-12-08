import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

const kPrimaryColor = Color.fromRGBO(243, 68, 81, 1);
const kSecondaryColor = Color.fromRGBO(243, 93, 67, 1);
const kIconBackgroundColor = Color.fromRGBO(254, 237, 238, 1);
const kTextColor = Color(0xFF586167);
const kAppBarPrimaryColor = Color.fromRGBO(255, 255, 255, 0);
const kAppBarMenuItems = ["home", "property", "project", "services", "city"];
const kDefaultSizedBoxHeight = 10.0;
const kDefaultSizedBoxWidth = 10.0;
const kElevation = 10.0;
const kdropDownTitleStyle = 14.0;
const kformMaxWidth = 900.0;
const kformVerticalDivider = SizedBox(height: 70, child: VerticalDivider(thickness: 2, color: kPrimaryColor,width: 40),);

DateFormat kDateformat = DateFormat('MMMM dd, yyyy');

// ************ Text *****************

TextStyle kTextDefaultStyle = GoogleFonts.montserrat(
    fontSize: kdropDownTitleStyle,
    fontWeight: FontWeight.w500,
    color: kTextColor);

TextStyle kTextKeyStyle =
    kTextDefaultStyle.copyWith(fontWeight: FontWeight.w600);

TextStyle kTextHeader1Style =
    GoogleFonts.montserrat(fontWeight: FontWeight.w700, fontSize: 24);

TextStyle kTextHeader2Style =
GoogleFonts.montserrat(fontWeight: FontWeight.w700, fontSize: 19);

TextStyle kButtonStyle =
    GoogleFonts.montserrat(color: Colors.white, fontSize: 17);

// ************ Padding *****************

const EdgeInsetsGeometry kDefaultPadding = EdgeInsets.all(8.0);

// ************ SizedBox *****************
const kDefaultSizedBox = SizedBox(height: kDefaultSizedBoxHeight);


const menus = {
  "home": [],
  "property": ["New Property", "Resell Properties", "Rental Properties"],
  "project": [""],
  "services": ["Interior Design", "Vastu", "Legal Advisor"],
  "city": ["Nashik", "Igatpuri", "Pune"]
};

const menuList = ["home", "property", "about us", "city"];

const citiesList = { "City": ["Nashik", "Igatpuri", "Pune"]};

const propertySearch = {
  "Property Type": ["Residential", "Commercial", "Plot", "Industrial"]
};

const maxRoomsDD = {
  "Property Type": ["Property Sub Type"],
  "Residential": ["Apartment", "Bunglow", "Row House", "Duplex", "Pent House"],
  "Commercial": ["Shop", "Office", "Showroom"],
  "Plot": ["Agriculture", "Industrial", "NA", "Resort NA", "Amenity"],
  "Industrial": ["Factory", "Shed"]
};
