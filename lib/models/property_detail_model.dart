import 'package:cloud_firestore/cloud_firestore.dart';

class PropertyDetails {
  late String id;
  late PropertyAbout propertyAbout;
  late OwnerDetails contactDetails;
  late Timestamp uploadDate;
  late bool isRent;
  late Address address;
  RentDetails? rentDetails;
  late SaleDetails saleDetails;
  late List<String> gallery = [];

  PropertyDetails.fromDocumentSnapshot(DocumentSnapshot<Map> doc)
      : id = doc.id,
        isRent = doc.data()!["isRent"],
        uploadDate = doc.data()!["upload_date"],
        propertyAbout = PropertyAbout.fromMap(doc.data()!["property_about"]),
        contactDetails = OwnerDetails.fromMap(doc.data()!["contactDetails"]),
        address = Address.fromMap(doc.data()!["propertyAddress"]);

//<editor-fold desc="Data Methods">
  setRentDetails(rentDetails) {
    this.rentDetails = RentDetails.fromMap(rentDetails);
  }

  setSaleDetails(saleDetails){
    this.saleDetails = SaleDetails.fromMap(saleDetails);
  }

  PropertyDetails(
      {required this.id,
      required this.propertyAbout,
      required this.contactDetails,
      required this.uploadDate,
      required this.isRent});

  @override
  String toString() {
    return 'PropertyDetails{ id: $id, propertyAbout: $propertyAbout, contactDetails: $contactDetails, uploadDate: $uploadDate,}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'propertyAbout': propertyAbout,
      'contactDetails': contactDetails,
      'uploadDate': uploadDate,
      'isRent': isRent
    };
  }

  factory PropertyDetails.fromMap(Map<String, dynamic> map) {
    String id;
    PropertyAbout propertyAbout;
    OwnerDetails contactDetails;
    Timestamp uploadDate;
    // print(map);
    try {
      id = map['property_about']['propertyId'] as String;
    } catch (e) {
      print('Exception occurred in id field: $e');
      id = ''; // Assign a default value or handle the error as needed
    }
    print("sending gallery to property about frommap ${map['property_about']['gallery']}");
    propertyAbout = PropertyAbout.fromMap(map['property_about']);
    contactDetails = OwnerDetails.fromMap(map['contactDetails']);
    try {
      uploadDate = map['uploadDate'] as Timestamp;
    } catch (e) {
      print('Exception occurred in uploadDate field: $e');
      uploadDate = Timestamp(
          0, 0); // Assign a default value or handle the error as needed
    }

    return PropertyDetails(
        id: id,
        propertyAbout: propertyAbout,
        contactDetails: contactDetails,
        uploadDate: uploadDate,
        isRent: map['isRent']);
  }

//</editor-fold>
}

class PropertyAbout {
  late int terrace;
  late int balcony;
  late int bathrooms;
  late int bedrooms;
  late String parking;
  late String floorNumber;
  late int totalFloors;
  late String propertyType;
  late String propertySubType;
  late String propertyId;
  late String description;
  late String propertyStatus;
  late List<dynamic> gallery;

//<editor-fold desc="Data Methods">
  PropertyAbout({
    required this.terrace,
    required this.balcony,
    required this.bathrooms,
    required this.bedrooms,
    required this.parking,
    required this.floorNumber,
    required this.totalFloors,
    required this.propertyType,
    required this.propertySubType,
    required this.propertyId,
    required this.description,
    required this.propertyStatus,
    required this.gallery,
  });

  @override
  String toString() {
    return 'PropertyAbout{ gallery: $gallery, terrace: $terrace, balcony: $balcony, bathrooms: $bathrooms, bedrooms: $bedrooms, parking: $parking, floorNumber: $floorNumber, totalFloors: $totalFloors, propertyType: $propertyType, propertySubType: $propertySubType, propertyId: $propertyId, description: $description, propertyStatus: $propertyStatus,}';
  }

  Map<String, dynamic> toMap() {
    return {
      'terrace': terrace,
      'balcony': balcony,
      'bathrooms': bathrooms,
      'bedrooms': bedrooms,
      'parking': parking,
      'floorNumber': floorNumber,
      'totalFloors': totalFloors,
      'propertyType': propertyType,
      'propertySubType': propertySubType,
      'propertyId': propertyId,
      'description': description,
      'propertyStatus': propertyStatus,
      'gallery': gallery
    };
  }

  factory PropertyAbout.fromMap(Map<String, dynamic> map) {
    int terrace;
    int balcony;
    int bathrooms;
    int bedrooms;
    int totalFloors;
    String propertyType;
    String propertySubType;
    String propertyId;
    String description;

  print("recieved gallery from property details ${map['gallery']}");
    try {
      terrace = int.parse(map['terrace']);
    } catch (e) {
      print('Exception occurred in terrace field: $e');
      terrace = 0; // Assign a default value or handle the error as needed
    }

    try {
      balcony = int.parse(map['balcony']);
    } catch (e) {
      print('Exception occurred in balcony field: $e');
      balcony = 0; // Assign a default value or handle the error as needed
    }

    try {
      bathrooms = int.parse(map['bathrooms']);
    } catch (e) {
      print('Exception occurred in bathrooms field: $e');
      bathrooms = 0; // Assign a default value or handle the error as needed
    }

    try {
      bedrooms = int.parse(map['bedrooms']);
    } catch (e) {
      print('Exception occurred in bedrooms field: $e');
      bedrooms = 0; // Assign a default value or handle the error as needed
    }

    try {
      totalFloors = int.parse(map['totalFloors']);
    } catch (e) {
      print('Exception occurred in totalFloors field: $e');
      totalFloors = 0; // Assign a default value or handle the error as needed
    }

    try {
      propertyType = map['propertyType'] as String;
    } catch (e) {
      print('Exception occurred in propertyType field: $e');
      propertyType = ''; // Assign a default value or handle the error as needed
    }

    try {
      propertySubType = map['propertySubType'] as String;
    } catch (e) {
      print('Exception occurred in propertySubType field: $e');
      propertySubType =
          ''; // Assign a default value or handle the error as needed
    }

    try {
      propertyId = map['propertyId'] as String;
    } catch (e) {
      print('Exception occurred in propertyId field: $e');
      propertyId = ''; // Assign a default value or handle the error as needed
    }

    try {
      description = map['description'] as String;
    } catch (e) {
      print('Exception occurred in description field: $e');
      description = ''; // Assign a default value or handle the error as needed
    }

    return PropertyAbout(
      terrace: terrace,
      balcony: balcony,
      bathrooms: bathrooms,
      bedrooms: bedrooms,
      parking: "alloted",
      floorNumber: "6",
      totalFloors: totalFloors,
      propertyType: propertyType,
      propertySubType: propertySubType,
      propertyId: propertyId,
      description: description,
      propertyStatus: "", // map['propertyStatus'] as String,
      gallery: map['gallery']
    );
  }

//</editor-fold>
}

class OwnerDetails {
  late String name;
  late String email;
  late String phone;

  OwnerDetails({
    required this.name,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
    };
  }

  factory OwnerDetails.fromMap(Map<String, dynamic> map) {
    return OwnerDetails(
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['mobile'] as String,
    );
  }
}

class RentDetails {
  String carpetArea = "";
  late String furnished;
  late String maintenance;
  late String preferredTenant;
  late String rent;
  late String securityDeposit;

  Map<String, dynamic> toMap() {
    return {
      'carpetArea': this.carpetArea,
      'furnished': this.furnished,
      'maintenance': this.maintenance,
      'preferredTenant': this.preferredTenant,
      'rent': this.rent,
      'securityDeposit': this.securityDeposit,
    };
  }

  factory RentDetails.fromMap(Map<String, dynamic> map) {
    return RentDetails(
      carpetArea: map['carpetArea'] as String,
      furnished: map['furnished'] as String,
      maintenance: map['maintenance'] as String,
      preferredTenant: map['preferredTenant'] as String,
      rent: map['rent'] as String,
      securityDeposit: map['securityDeposit'] as String,
    );
  }

  RentDetails.name(this.carpetArea, this.furnished, this.maintenance,
      this.preferredTenant, this.rent, this.securityDeposit);

  RentDetails(
      {required String carpetArea,
      required this.furnished,
      required this.maintenance,
      required this.preferredTenant,
      required this.rent,
      required this.securityDeposit});
}

class Address {
  late String landmark;
  late String surveyOrGutNo;
  late String plotNo;
  late String village;
  late String city;
  late String taluka;
  late String localityOrArea;
  late String buildingName;

  Address({
    required this.landmark,
    required this.surveyOrGutNo,
    required this.plotNo,
    required this.village,
    required this.city,
    required this.taluka,
    required this.localityOrArea,
    required this.buildingName,
  });

  Map<String, dynamic> toMap() {
    return {
      'landmark': landmark,
      'surveyOrGutNo': surveyOrGutNo,
      'plotNo': plotNo,
      'village': village,
      'city': city,
      'taluka': taluka,
      'localityOrArea': localityOrArea,
      'buildingName': buildingName,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      landmark: (map['landmark'] != null) ? map['landmark'] as String : "",
      surveyOrGutNo:
          (map['surveyOrGutNo'] != null) ? map['surveyOrGutNo'] as String : "",
      plotNo: (map['plotNo'] != null) ? map['plotNo'] as String : "",
      village: (map['village'] != null) ? map['village'] as String : "",
      city: map['city'] as String,
      taluka: (map['taluka'] != null) ? map['taluka'] as String : "",
      localityOrArea: map['localityOrArea'] as String,
      buildingName: map['buildingName'] as String,
    );
  }
}

class SaleDetails {

  late String carpetArea;

  SaleDetails.name(this.carpetArea);

  SaleDetails({
    required this.carpetArea,
  });


  Map<String, dynamic> toMap() {
    return {
      'carpetArea': this.carpetArea,
    };
  }

  factory SaleDetails.fromMap(Map<String, dynamic> map) {
    return SaleDetails(
      carpetArea: map['carpetArea'] as String,
    );
  }
}
