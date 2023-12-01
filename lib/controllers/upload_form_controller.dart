import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_asset_zone_web/models/property_detail_model.dart';
import 'package:the_asset_zone_web/screens/add_property/validators.dart';
import 'package:uuid/uuid.dart';

class UploadFormController extends GetxController {
  // https://gist.github.com/eduardoflorence/e49780ab232fa8ad7767bbdbf8389f1e
  // https://stackoverflow.com/questions/65912295/how-to-retrieve-a-texteditingcontroller-inside-a-controller-layer-with-getx
  static UploadFormController get i => Get.find();
  final uploadFormKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  RxBool isRent = false.obs;
  RxBool inGatedCommunity = true.obs;
  RxBool imageAvailable = false.obs;
  RxString bathrooms = "1".obs;
  RxString terrace = "0".obs;
  RxString balcony = "0".obs;
  RxString bedrooms = "0".obs;
  RxString parking = "-".obs;
  List<String> parkingList = ["-", "Open", "Cover", "Allotted", "Common"];
  RxString selectedOwnership = "-".obs;
  List<String> ownershipList = ["-", "Freehold", "Leasehold", "CHS"];
  RxBool isFeatured = false.obs;
  RxString selectedCity = "Nashik".obs;
  List<String> citiesList = ["Nashik", "Pune", "Igatapuri"];
  RxString selectedConstructionStatus = "Ready to Move".obs;
  List<String> constructionStatusList = ["Ready to Move", "Under Construction"];
  RxString selectedPropertyType = "Residential".obs;
  List<String> propetyTypesList = [
    "Residential",
    "Commercial",
    "Land",
    "Farm House",
    "Industrial"
  ];
  RxString selectedPropertySubType = "Apartment".obs;
  List<String> propertiesSubTypeList = [
    "Apartment",
    "Bungalow / Villa",
    "Twin Villa",
    "Row House",
    "Duplex",
    "Pent House",
    "Shop",
    "Office",
    "Showroom",
    "Hotel",
    "Agriculture",
    "N.A. Land",
    "Resort N.A.",
    "Studio Apt.",
    "Villa",
    "Factory",
    "Shed",
    "Open Plot"
  ];
  RxString selectedPreferredTenants = "-".obs;
  List<String> preferredTenantsList = [
    "-",
    "Family",
    "Company",
    "Office",
    "Bachelor Men",
    "Bachelor Women"
  ];
  RxString selectedFurniture = "-".obs;
  List<String> furnitureList = [
    "-",
    "Unfurnished",
    "Furnished",
    "Semi-Furnished"
  ];

  List<String> selectNumbers = ['0', '1', '2', '3', '4', '5'];

  late RxList<Uint8List> imageFiles = <Uint8List>[].obs;
  FirebaseStorage firestoreStorageInstance = FirebaseStorage.instance;
  late final imagesUrlList = [].obs;

  // Controllers
  // PropertyAbout
  TextEditingController totalFloorsController = TextEditingController();
  TextEditingController propertySizeController = TextEditingController();
  TextEditingController galleryController = TextEditingController();
  TextEditingController videoController = TextEditingController();
  TextEditingController propertyIdController = TextEditingController();
  TextEditingController builderNameController = TextEditingController();

  // PropertyAddress
  TextEditingController landmarkController = TextEditingController();
  TextEditingController surveyOrGutNumberController = TextEditingController();
  TextEditingController plotNumberController = TextEditingController();
  TextEditingController villageController = TextEditingController();
  TextEditingController talukaController = TextEditingController();
  TextEditingController locationOrAreaController = TextEditingController();
  TextEditingController buildingNameController = TextEditingController();
  TextEditingController flatNumberController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController floorController = TextEditingController();

  // Rent
  TextEditingController securityDepositController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController maintenanceController = TextEditingController();
  TextEditingController rentController = TextEditingController();


  // PropertyAreaDetails
  TextEditingController salableAreaController = TextEditingController();
  TextEditingController carpetAreaController = TextEditingController();
  TextEditingController builtUpAreaController = TextEditingController();

  // ContactDetails
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  // PropertyDetails
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  // Sale
  TextEditingController constructionYearController = TextEditingController();


  static UploadFormController instance = Get.find();

  Map getAreaFormFields() {
    final Map areaFormFields = {};
    return areaFormFields;
  }

  Map getFormFields() {
    final Map formFields = {
      "name": {
        "controller": nameController, //formController.nameController,
        "hintText": "Enter your full name",
        "label": "Name",
        "validator": defaultTextValidators,
        "icon": const Icon(Icons.person)
      },
      "email": {
        "controller": emailController,
        "hintText": "Enter your Email",
        "label": "Email ID",
        "validator": emailValidator,
        "icon": const Icon(Icons.email)
      },
      "mobileNumber": {
        "controller": mobileController,
        "hintText": "Enter your mobile number",
        "label": "Mobile No",
        "validator": mobileNumberValidator,
        "icon": const Icon(Icons.phone)
      },
      // property address
      "flatNumber": {
        "controller": flatNumberController,
        "hintText": "Enter flat number",
        "label": "Flat number",
        "icon": const Icon(Icons.elevator),
        "validator": defaultTextValidators
      },
      "floor": {
        "controller": floorController, //formController.nameController,
        "hintText": "Enter floor ",
        "label": "Floor",
        "validator": defaultTextValidators,
        "icon": const Icon(Icons.area_chart)
      },
      "plotNo": {
        "controller": plotNumberController, //formController.nameController,
        "hintText": "Enter plot number ",
        "label": "Plot No",
        "icon": const Icon(Icons.area_chart)
      },
      "surveyOrGutNumber": {
        "controller": surveyOrGutNumberController,
        //formController.nameController,
        "hintText": "Enter survey or gut number ",
        "label": "Survey/Gut",
        "icon": const Icon(Icons.area_chart)
      },
      "buildingName": {
        "controller": buildingNameController,
        "hintText": "Enter Building Name",
        "label": "Building Name",
        "icon": const Icon(Icons.home),
        "validator": defaultTextValidators
      },
      "landmark": {
        "controller": landmarkController, //formController.nameController,
        "hintText": "Enter landmark ",
        "label": "Landmark",
        "validator": defaultTextValidators,
        "icon": const Icon(Icons.area_chart)
      },
      "locationOrArea": {
        "controller": locationOrAreaController, //formController.nameController,
        "hintText": "Enter location/area ",
        "label": "Location/Area",
        "validator": defaultTextValidators,
        "icon": const Icon(Icons.area_chart)
      },
      "village": {
        "controller": villageController, //formController.nameController,
        "hintText": "Enter village name ",
        "label": "Village",
        "icon": const Icon(Icons.area_chart)
      },
      "taluka": {
        "controller": talukaController, //formController.nameController,
        "hintText": "Enter taluka name ",
        "label": "Taluka",
        "validator": defaultTextValidators,
        "icon": const Icon(Icons.area_chart)
      },
      "district": {
        "controller": districtController, //formController.nameController,
        "hintText": "Enter district name ",
        "label": "District",
        "validator": defaultTextValidators,
        "icon": const Icon(Icons.area_chart)
      },
      "state": {
        "controller": stateController, //formController.nameController,
        "hintText": "Enter state name ",
        "label": "State",
        "validator": defaultTextValidators,
        "icon": const Icon(Icons.area_chart)
      },
      "pincode": {
        "controller": pincodeController, //formController.nameController,
        "hintText": "Enter pincode ",
        "label": "Pincode",
        // "validator": isValidPincode,
        "icon": const Icon(Icons.area_chart)
      },

      // Rent

      "securityDeposit": {
        "controller": securityDepositController,
        "hintText": "Enter security deposit amount in thousand",
        "label": "Security Deposit",
        "icon": const Icon(Icons.currency_rupee),
        // "validator": isValidDouble
      },
      "maintenance": {
        "controller": maintenanceController,
        "hintText": "Enter maintenance amount in thousand",
        "label": "Maintenance",
        "icon": const Icon(Icons.currency_rupee),
        // "validator": isValidDouble
      },
      "rent": {
        "controller": rentController,
        "hintText": "Enter monthly rent in thousand",
        "label": "Rent",
        "icon": const Icon(Icons.currency_rupee),
        // "validator": isValidDouble
      },
      "availableFrom": {
        "controller": rentController,
        "hintText": "Select Date available from",
        "label": "Rent",
        "icon": const Icon(Icons.currency_rupee),
        // "validator": isValidDouble
      },

      // property area details
      "salableArea": {
        "controller": salableAreaController, //formController.nameController,
        "hintText": "Enter salable area in Sq. Ft. ",
        "label": "Salable Area",
        "icon": const Icon(Icons.area_chart),
        // "validator": isValidDouble
      },
      "builtUpArea": {
        "controller": builtUpAreaController, //formController.nameController,
        "hintText": "Enter built up area in Sq. Ft.",
        "label": "Built Up Area",
        // "validator": isValidDouble,
        "icon": const Icon(Icons.area_chart)
      },
      "carpetArea": {
        "controller": carpetAreaController, //formController.nameController,
        "hintText": "Enter carpet area in Sq. Ft.",
        "label": "Carpet Area",
        // "validator": isValidDouble,
        "icon": const Icon(Icons.area_chart)
      },
      "price": {
        "controller": priceController,
        "hintText": "Enter Price in thousands ...",
        "label": "Price",
        // "validator": isValidDouble,
        "icon": const Icon(Icons.currency_rupee)
      },


      "description": {
        "controller": descriptionController,
        "hintText": "Enter Property Description",
        "label": "Description",
        "icon": const Icon(Icons.message)
      },


    // property details
      "builderName": {
        "controller": builderNameController, //formController.nameController,
        "hintText": "Enter builder name ",
        "label": "Builder Name",
        "validator": defaultTextValidators,
        "icon": const Icon(Icons.area_chart)
      },

      "total_floors": {
        "controller": totalFloorsController, //formController.nameController,
        "hintText": "Enter total number of floors",
        "label": "Total Floors",
        "validator": defaultTextValidators,
        "icon": const Icon(Icons.area_chart)
      },


      "construction_year": {
        "controller": constructionYearController,
        //formController.nameController,
        "hintText": "Enter Construction year",
        "label": "Construction Year",
        "validator": defaultTextValidators,
        "icon": const Icon(Icons.person)
      },
    };
    return formFields;
  }

  @override
  void onInit() {
    // Simulating obtaining the user name from some local storage
    dateController.text = "";
    super.onInit();
  }

  void resetForm() {
    uploadFormKey.currentState?.reset();
    nameController.text = '';
    // focusNode.requestFocus();
  }

  Future<String> uploadImage(Uint8List xfile, String documentId) async {
    Reference ref = FirebaseStorage.instance.ref().child(documentId);
    var uuid = const Uuid();
    ref = ref.child(uuid.v4().toString());

    UploadTask uploadTask = ref.putData(
      xfile,
      SettableMetadata(contentType: 'image/png'),
    );
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    print(downloadUrl);
    return downloadUrl;
  }

  void submitForm() async {
    {
      isLoading.value = true;
      // Validate returns true if the form is valid, or false otherwise.
      if (uploadFormKey.currentState!.validate()) {
        // If the form is valid, display a snackbar. In the real world,
        // you'd often call a server or save the information in a database.
        //TODO: find how can pass context
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(content: Text('Processing Data')),
        // );
        print("****** Form is not valid. **********");
        print(uploadFormKey.currentState!.validate());
        print("above is form current state");
      }
      DocumentReference docRef =
          FirebaseFirestore.instance.collection('PropertyDetails').doc();
      // Retrieve the generated document ID
      String documentId = docRef.id;
      if (imageFiles.isNotEmpty) {
        for (Uint8List image in imageFiles) {
          String url = await uploadImage(image, documentId);
          imagesUrlList.add(url);
        }
      }

      // parse date to timestamp

      DateTime uploadDate = DateTime.parse(dateController.text);
      Timestamp uploadTimestamp = Timestamp.fromDate(uploadDate);

      Map<String, dynamic> data = {
        "property_about": {
          "balcony": balcony.value,
          "bathrooms": bathrooms.value,
          "bedrooms": bedrooms.value,
          "constructionStatus": selectedConstructionStatus.value,
          "propertyType": selectedPropertyType.value,
          "propertyId": documentId,
          "terrace": terrace.value,
          "parking": parking.value,
          "propertySubType": selectedPropertySubType.value,
          "totalFloors": totalFloorsController.text,
          "isFeatured": isFeatured.value,
          "inGatedCommunity": inGatedCommunity.value,
          "gallery": imagesUrlList,
          "description": descriptionController.text
        },
        "propertyAddress": {
          "flatNumber": flatNumberController.text,
          "floorNumber": floorController.text,
          "plotNumber": plotNumberController.text,
          "surveyOrGutNumber": surveyOrGutNumberController.text,
          "buildingName": buildingNameController.text,
          "landmark": landmarkController.text,
          "locationOrArea": locationOrAreaController.text,
          "village": villageController.text,
          "city": selectedCity.value,
          "taluka": talukaController.text,
          "district": districtController.text,
          "state": stateController.text,
          "pincode": pincodeController.text,
        },
        "propertyAreaDetails": {
          "salableArea": salableAreaController.text,
          "carpetArea": carpetAreaController.text,
          "builtUpArea": builtUpAreaController.text,
        },
        "location": {"lat": 76.43698832653855, "lon": 22.444},
        "contactDetails": {
          "name": nameController.text,
          "email": emailController.text,
          "mobile": mobileController.text,
        },
        "uploadDate": uploadTimestamp,
      };


      if (isRent.value){
        Map<String, dynamic> rentDetails = {
          "securityDeposit": securityDepositController.text,
          "maintenance": maintenanceController.text,
          "rent": rentController.text,
          "preferredTenant": selectedPreferredTenants.value,
          "furnished": selectedFurniture.value,
          "carpetArea": carpetAreaController.text
        };
        data["rentDetails"] = rentDetails;
      } else {
        Map<String, dynamic> saleDetails = {
          "ownership": selectedOwnership.value,
          "constructionStatus": selectedConstructionStatus.value,
          "constructionYear": constructionYearController.text,
          "salableArea": salableAreaController.text,
          "builtUpArea": builtUpAreaController.text,
          "carpetArea": carpetAreaController.text
        };
        data["saleDetails"] = saleDetails;
      }

      // TODO: use lat lon from location.
      print(data);
      // PropertyAbout.fromMap(data["property_about"]);
      // print(data.toString());
      await docRef.set(data);
      isLoading.value = false;
      uploadFormKey.currentState?.reset();
      // _clearFormState();
    }
  }

  void _clearFormState() {
    nameController.clear();
    emailController.clear();
    mobileController.clear();
    descriptionController.clear();
    priceController.clear();
    propertyIdController.clear();
    propertySizeController.clear();
    dateController.clear();
    galleryController.clear();
    videoController.clear();
    carpetAreaController.clear();
    builtUpAreaController.clear();
    salableAreaController.clear();
    imageFiles.clear();
    imageAvailable.value = false;
    imagesUrlList.value = [];
  }

  void addImagesToList(Uint8List image) {
    imageFiles.add(image);
    if (imageFiles.isNotEmpty) {
      imageAvailable.value = true;
    }
  }
}
