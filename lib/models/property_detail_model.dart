import 'package:cloud_firestore/cloud_firestore.dart';

class PropertyDetails {
  late String id;
  late List<String> gallery;
  late final PropertyAbout propertyAbout;
  late OwnerDetails contactDetails;
  late String video;
  late String floorPlan;
  late Map<String, double> location;
  late Timestamp uploadDate;

  PropertyDetails.fromDocumentSnapshot(DocumentSnapshot<Map> doc)
      : id = doc.id,
        gallery = doc.data()!["gallery"],
        video = doc.data()!["video"],
        floorPlan = doc.data()!["floor_plan"],
        location = doc.data()!["location"],
        uploadDate = doc.data()!["upload_date"],
        propertyAbout = PropertyAbout.fromMap(doc.data()!["property_about"]),
        contactDetails = OwnerDetails.fromMap(doc.data()!["contact_details"]);

//<editor-fold desc="Data Methods">
  PropertyDetails({
    required this.id,
    required this.gallery,
    required this.propertyAbout,
    required this.contactDetails,
    required this.video,
    required this.floorPlan,
    required this.location,
    required this.uploadDate,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PropertyDetails &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          gallery == other.gallery &&
          propertyAbout == other.propertyAbout &&
          contactDetails == other.contactDetails &&
          video == other.video &&
          floorPlan == other.floorPlan &&
          location == other.location &&
          uploadDate == other.uploadDate);

  @override
  int get hashCode =>
      id.hashCode ^
      gallery.hashCode ^
      propertyAbout.hashCode ^
      contactDetails.hashCode ^
      video.hashCode ^
      floorPlan.hashCode ^
      location.hashCode ^
      uploadDate.hashCode;

  @override
  String toString() {
    return 'PropertyDetails{ id: $id, gallery: $gallery, propertyAbout: $propertyAbout, contactDetails: $contactDetails, video: $video, floorPlan: $floorPlan, location: $location, uploadDate: $uploadDate,}';
  }

  PropertyDetails copyWith({
    String? id,
    List<String>? gallery,
    PropertyAbout? propertyAbout,
    OwnerDetails? contactDetails,
    String? video,
    String? floorPlan,
    Map<String, double>? location,
    Timestamp? uploadDate,
  }) {
    return PropertyDetails(
      id: id ?? this.id,
      gallery: gallery ?? this.gallery,
      propertyAbout: propertyAbout ?? this.propertyAbout,
      contactDetails: contactDetails ?? this.contactDetails,
      video: video ?? this.video,
      floorPlan: floorPlan ?? this.floorPlan,
      location: location ?? this.location,
      uploadDate: uploadDate ?? this.uploadDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'gallery': gallery,
      'propertyAbout': propertyAbout,
      'contactDetails': contactDetails,
      'video': video,
      'floorPlan': floorPlan,
      'location': location,
      'uploadDate': uploadDate,
    };
  }

  factory PropertyDetails.fromMap(Map<String, dynamic> map) {
    return PropertyDetails(
      id: map['id'] as String,
      gallery: map['gallery'] as List<String>,
      propertyAbout: map['propertyAbout'] as PropertyAbout,
      contactDetails: map['contactDetails'] as OwnerDetails,
      video: map['video'] as String,
      floorPlan: map['floorPlan'] as String,
      location: map['location'] as Map<String, double>,
      uploadDate: map['uploadDate'] as Timestamp,
    );
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
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PropertyAbout &&
          runtimeType == other.runtimeType &&
          terrace == other.terrace &&
          balcony == other.balcony &&
          bathrooms == other.bathrooms &&
          bedrooms == other.bedrooms &&
          parking == other.parking &&
          floorNumber == other.floorNumber &&
          totalFloors == other.totalFloors &&
          propertyType == other.propertyType &&
          propertySubType == other.propertySubType &&
          propertyId == other.propertyId &&
          description == other.description &&
          propertyStatus == other.propertyStatus);

  @override
  int get hashCode =>
      terrace.hashCode ^
      balcony.hashCode ^
      bathrooms.hashCode ^
      bedrooms.hashCode ^
      parking.hashCode ^
      floorNumber.hashCode ^
      totalFloors.hashCode ^
      propertyType.hashCode ^
      propertySubType.hashCode ^
      propertyId.hashCode ^
      description.hashCode ^
      propertyStatus.hashCode;

  @override
  String toString() {
    return 'PropertyAbout{ terrace: $terrace, balcony: $balcony, bathrooms: $bathrooms, bedrooms: $bedrooms, parking: $parking, floorNumber: $floorNumber, totalFloors: $totalFloors, propertyType: $propertyType, propertySubType: $propertySubType, propertyId: $propertyId, description: $description, propertyStatus: $propertyStatus,}';
  }

  PropertyAbout copyWith({
    int? terrace,
    int? balcony,
    int? bathrooms,
    int? bedrooms,
    String? parking,
    String? floorNumber,
    int? totalFloors,
    String? propertyType,
    String? propertySubType,
    String? propertyId,
    String? description,
    String? propertyStatus,
  }) {
    return PropertyAbout(
      terrace: terrace ?? this.terrace,
      balcony: balcony ?? this.balcony,
      bathrooms: bathrooms ?? this.bathrooms,
      bedrooms: bedrooms ?? this.bedrooms,
      parking: parking ?? this.parking,
      floorNumber: floorNumber ?? this.floorNumber,
      totalFloors: totalFloors ?? this.totalFloors,
      propertyType: propertyType ?? this.propertyType,
      propertySubType: propertySubType ?? this.propertySubType,
      propertyId: propertyId ?? this.propertyId,
      description: description ?? this.description,
      propertyStatus: propertyStatus ?? this.propertyStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'terrace': this.terrace,
      'balcony': this.balcony,
      'bathrooms': this.bathrooms,
      'bedrooms': this.bedrooms,
      'parking': this.parking,
      'floorNumber': this.floorNumber,
      'totalFloors': this.totalFloors,
      'propertyType': this.propertyType,
      'propertySubType': this.propertySubType,
      'propertyId': this.propertyId,
      'description': this.description,
      'propertyStatus': this.propertyStatus,
    };
  }

  factory PropertyAbout.fromMap(Map<String, dynamic> map) {
    return PropertyAbout(
      terrace: map['terrace'] as int,
      balcony: map['balcony'] as int,
      bathrooms: map['bathrooms'] as int,
      bedrooms: map['bedrooms'] as int,
      parking: map['parking'] as String,
      floorNumber: map['floorNumber'] as String,
      totalFloors: map['totalFloors'] as int,
      propertyType: map['propertyType'] as String,
      propertySubType: map['propertySubType'] as String,
      propertyId: map['propertyId'] as String,
      description: map['description'] as String,
      propertyStatus: map['propertyStatus'] as String,
    );
  }

//</editor-fold>
}

class OwnerDetails {
  late String name;
  late String email;
  late int phone;

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
      phone: map['phone'] as int,
    );
  }
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
