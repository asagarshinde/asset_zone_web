import 'package:cloud_firestore/cloud_firestore.dart';

class PropertyDetails {
  late String id;
  late List<String> gallery;
  late final PropertyAbout propertyAbout;
  late ContactDetails contactDetails;
  late String video;
  late String floorPlan;
  late Map<String, double> location;
  late Timestamp uploadDate;

  PropertyDetails(this.id, this.gallery, this.propertyAbout, this.video,
      this.floorPlan, this.location, this.uploadDate, this.contactDetails);

  PropertyDetails.fromDocumentSnapshot(DocumentSnapshot<Map> doc)
      : id = doc.id,
        gallery = doc.data()!["gallery"],
        video = doc.data()!["video"],
        floorPlan = doc.data()!["floor_plan"],
        location = doc.data()!["location"],
        uploadDate = doc.data()!["upload_date"],
        propertyAbout = PropertyAbout.fromMap(doc.data()!["property_about"]),
        contactDetails = ContactDetails.fromMap(doc.data()!["contact_details"]);

  PropertyDetails.fromMap(Map propertyMap)
      : gallery = List<String>.from(propertyMap["gallery"]),
        // to avoid expected a value of type List<String>? but got one of the type
        propertyAbout = PropertyAbout.fromMap(propertyMap["property_about"]),
        contactDetails = ContactDetails.fromMap(propertyMap["contact_details"]),
        video = propertyMap["video"],
        floorPlan = propertyMap["floor_plan"],
        location = {
          "lat": propertyMap["location"]["lat"],
          "long": propertyMap["location"]["lat"]
        },
        //{"lat": 23993.00, "long": 34994.4},
        uploadDate = propertyMap["upload_date"];

  Map<String, dynamic> toMap() {
    return {
      'gallery': gallery,
      'property_about': propertyAbout.toMap(),
      'video': video,
      'floor_plan': floorPlan,
      'location': location,
      'upload_date': uploadDate
    };
  }
}

class PropertyAbout {
  late int balcony;
  late int bathrooms;
  late int bedrooms;
  late String city;
  late int price;
  late String propertyStatus;
  late String propertyType;
  late String propertyId;
  late int salableArea;
  late int terrace;
  int securityDeposit = 0;
  late int floorNumber;
  int maintenance = 0;
  late int parking;
  late String address;
  late int halls;

  PropertyAbout(
      {required this.propertyType,
      required this.bathrooms,
      required this.propertyId,
      required this.propertyStatus,
      required this.city,
      required this.bedrooms,
      required this.price,
      required this.balcony,
      required this.salableArea,
      required this.terrace,
      this.securityDeposit = 0,
      required this.floorNumber,
      this.maintenance = 0,
      required this.parking,
      required this.address,
      required this.halls});

  Map<String, dynamic> toMap() {
    return {
      'property_type': propertyType,
      'bathroom': bathrooms,
      'property_id': propertyId,
      'property_status': propertyStatus,
      'city': city,
      'bedrooms': bedrooms,
      'price': price,
      'salable_area': salableArea,
      'balcony': balcony,
      'terrace': terrace,
      'security_deposit': securityDeposit,
      'maintenance': maintenance,
      'parking': parking,
      'address': address,
      'halls': halls,
      'floor_number': floorNumber,
    };
  }

  PropertyAbout.fromMap(Map<String, dynamic> propertyAboutMap) {
    try {
      propertyType = propertyAboutMap["property_type"];
      bathrooms = propertyAboutMap["bathrooms"];
      propertyId = propertyAboutMap["property_id"];
      propertyStatus = propertyAboutMap["property_status"];
      city = propertyAboutMap["city"];
      bedrooms = propertyAboutMap["bedrooms"];
      price = propertyAboutMap["price"];
      salableArea = propertyAboutMap["salable_area"];
      balcony = propertyAboutMap["balcony"];
      terrace = propertyAboutMap["terrace"];
      securityDeposit = propertyAboutMap['security_deposit'];
      maintenance = propertyAboutMap['maintenance'];
      parking = propertyAboutMap['parking'];
      address = propertyAboutMap['address'];
      halls = propertyAboutMap['halls'];
      floorNumber = propertyAboutMap['floor_number'];
    } catch (e) {
      print('Error while parsing PropertyAbout data: $e');
    }
  }
}

class ContactDetails {
  late String name;
  late String email;
  late int phone;
  late String pan;

  ContactDetails(this.name, this.email, this.phone, this.pan);

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'phone': phone, 'pan': pan};
  }

  ContactDetails.fromMap(Map<String, dynamic> contactDetails)
      : name = contactDetails["name"],
        email = contactDetails["email"],
        phone = contactDetails["phone"],
        pan = contactDetails["pan"];
}
