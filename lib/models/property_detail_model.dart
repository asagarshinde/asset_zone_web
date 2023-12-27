import 'package:cloud_firestore/cloud_firestore.dart';

class PropertyDetails {
  late String id;
  late PropertyAbout propertyAbout;
  late OwnerDetails contactDetails;
  late Timestamp uploadDate;
  late bool isRent;
  late Address address;
  RentDetails? rentDetails;
  SaleDetails? saleDetails;
  late List<dynamic> gallery;
  late PropertyAreaDetails propertyAreaDetails;

  PropertyDetails.fromDocumentSnapshot(DocumentSnapshot<Map> doc)
      : id = doc.id,
        isRent = doc.data()!["isRent"],
        uploadDate = doc.data()!["upload_date"],
        propertyAbout = PropertyAbout.fromMap(doc.data()!["property_about"]),
        contactDetails = OwnerDetails.fromMap(doc.data()!["contactDetails"]),
        address = Address.fromMap(doc.data()!["propertyAddress"]),
        propertyAreaDetails =
            PropertyAreaDetails.fromMap(doc.data()!['PropertyAreaDetails']);

//<editor-fold desc="Data Methods">
  setRentDetails(rentDetails) {
    this.rentDetails = RentDetails.fromMap(rentDetails);
  }

  setSaleDetails(saleDetails) {
    this.saleDetails = SaleDetails.fromMap(saleDetails);
  }

  PropertyDetails(
      {required this.id,
      required this.propertyAbout,
      required this.contactDetails,
      required this.uploadDate,
      required this.address,
      required this.isRent,
      required this.gallery,
      required this.propertyAreaDetails});

  @override
  String toString() {
    return 'PropertyDetails{ '
        'id: $id, '
        'propertyAbout: ${propertyAbout.toString()}, '
        'rentDetails : ${rentDetails.toString()}, '
        'saleDetails : ${saleDetails.toString()}, '
        'contactDetails: ${contactDetails.toString()}, '
        'uploadDate: $uploadDate,'
        'address: ${address.toString()},'
        'gallery: $gallery,'
        'propertyAreaDetails: ${propertyAreaDetails.toString()}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'propertyAbout': propertyAbout.toMap(),
      'contactDetails': contactDetails.toMap(),
      'uploadDate': Timestamp.now(),
      'isRent': isRent,
      'gallery': gallery,
      'address': address.toMap(),
      'propertyAreaDetails': propertyAreaDetails.toMap(),
      'saleDetails': saleDetails?.toMap(),
      'rentDetails': rentDetails?.toMap()
    };
  }

  factory PropertyDetails.fromMap(Map<String, dynamic> map) {
    String id;
    PropertyAbout propertyAbout;
    OwnerDetails contactDetails;
    Timestamp uploadDate;
    Address address;

    try {
      id = map['id'] as String;
    } catch (e) {
      print('Exception occurred in id field: $e');
      id = ''; // Assign a default value or handle the error as needed
    }

    propertyAbout = PropertyAbout.fromMap(map['propertyAbout']);
    contactDetails = OwnerDetails.fromMap(map['contactDetails']);
    try {
      uploadDate = map['uploadDate'] as Timestamp;
    } catch (e) {
      print('Exception occurred in uploadDate field: $e');
      uploadDate = Timestamp(
          0, 0); // Assign a default value or handle the error as needed
    }

    try {
      address = Address.fromMap(map['address']);
    } catch (e) {
      address = Address(
          landmark: "landmark",
          surveyOrGutNo: "surveyOrGutNo",
          plotNo: "plotNo",
          village: 'village',
          city: 'city',
          taluka: 'taluka',
          localityOrArea: 'localityOrArea',
          buildingName: 'buildingName',
          flatNumber: 'flatNumber',
          floorNumber: 'floorNumber',
          district: 'district',
          state: 'state',
          pincode: 425555);
      print('Exception occurred in address field: $e');
    }

    PropertyAreaDetails propertyAreaDetails =
        PropertyAreaDetails.fromMap(map["propertyAreaDetails"]);
    PropertyDetails propertyDetails = PropertyDetails(
        id: id,
        propertyAbout: propertyAbout,
        contactDetails: contactDetails,
        uploadDate: uploadDate,
        isRent: map['isRent'],
        address: address,
        gallery: map['gallery'],
        propertyAreaDetails: propertyAreaDetails);

    if (map["isRent"]) {
      propertyDetails.setRentDetails(map["rentDetails"]);
    } else {
      propertyDetails.setSaleDetails(map["saleDetails"]);
    }
    return propertyDetails;
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
  late String constructionStatus;
  late bool isFeatured;
  late bool inGatedCommunity;

//<editor-fold desc="Data Methods">
  PropertyAbout(
      {required this.terrace,
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
      required this.isFeatured,
      required this.constructionStatus,
      required this.inGatedCommunity});

  @override
  String toString() {
    return 'PropertyAbout{ isFeatured: $isFeatured constructionStatus: $constructionStatus, '
        'terrace: $terrace, balcony: $balcony, bathrooms: $bathrooms, '
        'bedrooms: $bedrooms, parking: $parking, floorNumber: $floorNumber, '
        'totalFloors: $totalFloors, propertyType: $propertyType, '
        'propertySubType: $propertySubType, propertyId: $propertyId, '
        'description: $description'
        'inGatedCommunity: $inGatedCommunity}';
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
      'isFeatured': isFeatured,
      'inGatedCommunity': inGatedCommunity
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
    String constructionStatus;
    bool isFeatured;
    bool inGatedCommunity;
    String parking;
    String floorNumber;

    try {
      parking = map['parking'];
    } catch (e) {
      print('Exception occurred in terrace field: $e');
      parking = '-'; // Assign a default value or handle the error as needed
    }

    try {
      terrace = map['terrace'];
    } catch (e) {
      print('Exception occurred in terrace field: $e');
      terrace = 0; // Assign a default value or handle the error as needed
    }

    try {
      balcony = map['balcony'];
    } catch (e) {
      print('Exception occurred in balcony field: $e');
      balcony = 0; // Assign a default value or handle the error as needed
    }

    try {
      bathrooms = map['bathrooms'];
    } catch (e) {
      print('Exception occurred in bathrooms field: $e');
      bathrooms = 0; // Assign a default value or handle the error as needed
    }

    try {
      bedrooms = map['bedrooms'];
    } catch (e) {
      print('Exception occurred in bedrooms field: $e');
      bedrooms = 0; // Assign a default value or handle the error as needed
    }

    try {
      totalFloors = map['totalFloors'];
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

    try {
      constructionStatus = map.containsKey("constructionStatus")
          ? map["constructionStatus"]
          : "";
    } catch (e) {
      print('Exception occurred in constructionStatus field: $e');
      constructionStatus =
          ''; // Assign a default value or handle the error as needed
    }

    try {
      floorNumber = map['floorNumber'] as String;
    } catch (e) {
      print('Exception occurred in floorNumber field: $e');
      floorNumber = ''; // Assign a default value or handle the error as needed
    }

    try {
      isFeatured = map['isFeatured'] as bool;
    } catch (e) {
      print('Exception occurred in isFeatured field: $e');
      isFeatured =
          false; // Assign a default value or handle the error as needed
    }

    try {
      inGatedCommunity = map['inGatedCommunity'] as bool;
    } catch (e) {
      print('Exception occurred in inGatedCommunity field: $e');
      inGatedCommunity =
          false; // Assign a default value or handle the error as needed
    }

    return PropertyAbout(
        terrace: terrace,
        balcony: balcony,
        bathrooms: bathrooms,
        bedrooms: bedrooms,
        parking: parking,
        floorNumber: floorNumber,
        totalFloors: totalFloors,
        propertyType: propertyType,
        propertySubType: propertySubType,
        propertyId: propertyId,
        description: description,
        constructionStatus: constructionStatus,
        isFeatured: isFeatured,
        inGatedCommunity: inGatedCommunity);
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
      phone: map['phone'] as String,
    );
  }
}

class RentDetails {
  String carpetArea = "";
  late String furnished;
  late int maintenance;
  late String preferredTenant;
  late int rent;
  late int securityDeposit;

  Map<String, dynamic> toMap() {
    return {
      'carpetArea': carpetArea,
      'furnished': furnished,
      'maintenance': maintenance,
      'preferredTenant': preferredTenant,
      'rent': rent,
      'securityDeposit': securityDeposit,
    };
  }

  factory RentDetails.fromMap(Map<String, dynamic> map) {
    return RentDetails(
      furnished: map['furnished'] as String,
      maintenance: map['maintenance'] as int,
      preferredTenant: map['preferredTenant'] as String,
      rent: map['rent'] as int,
      securityDeposit: map['securityDeposit'] as int,
    );
  }

  RentDetails.name(this.carpetArea, this.furnished, this.maintenance,
      this.preferredTenant, this.rent, this.securityDeposit);

  RentDetails(
      {required this.furnished,
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
  late String flatNumber;
  late String floorNumber;
  late String district;
  late String state;
  late int pincode;

//<editor-fold desc="Data Methods">
  Address({
    required this.landmark,
    required this.surveyOrGutNo,
    required this.plotNo,
    required this.village,
    required this.city,
    required this.taluka,
    required this.localityOrArea,
    required this.buildingName,
    required this.flatNumber,
    required this.floorNumber,
    required this.district,
    required this.state,
    required this.pincode,
  });

  @override
  String toString() {
    return 'Address{ landmark: $landmark, surveyOrGutNo: $surveyOrGutNo, plotNo: $plotNo, village: $village, city: $city, taluka: $taluka, localityOrArea: $localityOrArea, buildingName: $buildingName, flatNumber: $flatNumber, floorNumber: $floorNumber, district: $district, state: $state, pincode: $pincode,}';
  }

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
      'flatNumber': flatNumber,
      'floorNumber': floorNumber,
      'district': district,
      'state': state,
      'pincode': pincode,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      landmark: map['landmark'] as String,
      surveyOrGutNo: map['surveyOrGutNo'] as String,
      plotNo: map['plotNo'] as String,
      village: map['village'] as String,
      city: map['city'] as String,
      taluka: map['taluka'] as String,
      localityOrArea: map['localityOrArea'] as String,
      buildingName: map['buildingName'] as String,
      flatNumber: map['flatNumber'] as String,
      floorNumber: map['floorNumber'] as String,
      district: map['district'] as String,
      state: map['state'] as String,
      pincode: map['pincode'] as int,
    );
  }

//</editor-fold>
}

class SaleDetails {
  late String ownership;
  late String constructionStatus;
  late int constructionYear;
  late int salableArea;
  late int builtUpArea;
  late int price;

//<editor-fold desc="Data Methods">
  SaleDetails(
      {required this.ownership,
      required this.constructionStatus,
      required this.constructionYear,
      required this.salableArea,
      required this.builtUpArea,
      required this.price});

  @override
  String toString() {
    return 'SaleDetails{price: $price, ownership: $ownership, constructionStatus: $constructionStatus, constructionYear: $constructionYear, salableArea: $salableArea, builtUpArea: $builtUpArea,}';
  }

  Map<String, dynamic> toMap() {
    return {
      'ownership': ownership,
      'constructionStatus': constructionStatus,
      'constructionYear': constructionYear,
      'salableArea': salableArea,
      'builtUpArea': builtUpArea,
      'price': price
    };
  }

  factory SaleDetails.fromMap(Map<String, dynamic> map) {
    return SaleDetails(
        ownership: map['ownership'] as String,
        constructionStatus: map['constructionStatus'] as String,
        constructionYear: map['constructionYear'] as int,
        salableArea: map['salableArea'] as int,
        builtUpArea: map['builtUpArea'] as int,
        price: map['price'] as int);
  }

//</editor-fold>
}

class PropertyAreaDetails {
  final int salableArea;
  final int carpetArea;
  final int builtUpArea;

//<editor-fold desc="Data Methods">
  const PropertyAreaDetails({
    required this.salableArea,
    required this.carpetArea,
    required this.builtUpArea,
  });

  @override
  String toString() {
    return 'PropertyAreaDetails{ salableArea: $salableArea, carpetArea: $carpetArea, builtUpArea: $builtUpArea,}';
  }

  Map<String, dynamic> toMap() {
    return {
      'salableArea': salableArea,
      'carpetArea': carpetArea,
      'builtUpArea': builtUpArea,
    };
  }

  factory PropertyAreaDetails.fromMap(Map<String, dynamic> map) {
    return PropertyAreaDetails(
      salableArea: map['salableArea'],
      carpetArea: map['carpetArea'],
      builtUpArea: map['builtUpArea'],
    );
  }

//</editor-fold>
}
