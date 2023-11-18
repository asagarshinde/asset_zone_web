import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_asset_zone_web/models/property_detail_model.dart';
import 'package:the_asset_zone_web/screens/add_property/validators.dart';
import 'package:the_asset_zone_web/screens/upload_property/upload_property_screen.dart';
import 'package:uuid/uuid.dart';

class UploadFormController extends GetxController {
  // https://gist.github.com/eduardoflorence/e49780ab232fa8ad7767bbdbf8389f1e
  // https://stackoverflow.com/questions/65912295/how-to-retrieve-a-texteditingcontroller-inside-a-controller-layer-with-getx
  static UploadFormController get i => Get.find();
  final uploadFormKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  RxString bathrooms = "1".obs;
  RxString terrace = "0".obs;
  RxString balcony = "0".obs;
  RxString bedrooms = "0".obs;
  RxString parking = "0".obs;
  RxString halls = "0".obs;
  RxBool isFeatured = false.obs;
  RxString selectedCity = "Nashik".obs;
  RxString selectedPropertyStatus = "Ready to Move".obs;
  RxString selectedPropertyType = "Residential".obs;
  RxString selectedPropertySubType = "Apartment".obs;
  RxString selectedPropertyFor = "For Sale".obs;
  RxString locality = "".obs;
  List<String> propertiesStatusList = ["Ready to Move", "Under Construction"];
  List<String> selectNumbers = ['0', '1', '2', '3', '4', '5'];
  List<String> citiesList = ["Nashik", "Pune", "Igatapuri"];
  List<String> propertiesTypeList = ["Residential", "Commercial"];
  List<String> propertyForList = ["For Rent", "For Sale"];
  List<String> propertiesSubTypeList = [
    "Apartment",
    "Row House",
    "Building",
    "Pent House",
    "Bungalow",
    "Shop"
  ];
  RxBool imageAvailable = false.obs;
  late RxList<Uint8List> imageFiles = <Uint8List>[].obs;
  var firestoreStorageInstance = FirebaseStorage.instance;
  late final imagesUrlList = [].obs;

  // Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController propertyIdController = TextEditingController();
  TextEditingController propertySizeController = TextEditingController();
  TextEditingController propertyStatusController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController floorPlanController = TextEditingController();
  TextEditingController galleryController = TextEditingController();
  TextEditingController videoController = TextEditingController();
  TextEditingController carpetAreaController = TextEditingController();
  TextEditingController builtUpAreaController = TextEditingController();
  TextEditingController salableAreaController = TextEditingController();
  TextEditingController propertyForController = TextEditingController();
  TextEditingController buildingNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController floorNumberController = TextEditingController();
  TextEditingController securityDepositController = TextEditingController();
  TextEditingController maintenanceController = TextEditingController();

  static UploadFormController instance = Get.find();

  Map getAreaFormFields() {
    final Map areaFormFields = {
      "carpet_area": {
        "controller": carpetAreaController, //formController.nameController,
        "hintText": "Enter carpet area in Sq. Ft.",
        "label": "Carpet Area",
        "validator": defaultTextValidators,
        "icon": const Icon(Icons.area_chart)
      },
      "built_up_area": {
        "controller": builtUpAreaController, //formController.nameController,
        "hintText": "Enter built up area in Sq. Ft.",
        "label": "Built Up Area",
        "validator": defaultTextValidators,
        "icon": const Icon(Icons.area_chart)
      },
      "salable_up_area": {
        "controller": salableAreaController, //formController.nameController,
        "hintText": "Enter salable area in Sq. Ft. ",
        "label": "Salable Area",
        "validator": defaultTextValidators,
        "icon": const Icon(Icons.area_chart)
      },
    };
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
      "phone": {
        "controller": phoneController,
        "hintText": "Enter your mobile number",
        "label": "Mobile No",
        "validator": mobileNumberValidator,
        "icon": const Icon(Icons.phone)
      },
      "message": {
        "controller": messageController,
        "hintText": "Message",
        "label": "Message",
        "validator": defaultTextValidators,
        "icon": const Icon(Icons.message)
      },
      "Building Name": {
        "controller": buildingNameController,
        "hintText": "Enter Building Name",
        "label": "Building Name",
        "icon": const Icon(Icons.home)
      },
      "Address": {
        "controller": addressController,
        "hintText": "Enter address of property",
        "label": "Address",
        "icon": const Icon(Icons.location_on)
      },
      "Floor number": {
        "controller": floorNumberController,
        "hintText": "Enter floor number",
        "label": "Floor number",
        "icon": const Icon(Icons.elevator)
      },
      "Security Deposit": {
        "controller": securityDepositController,
        "hintText": "Enter security deposit amount",
        "label": "Security Deposit",
        "icon": const Icon(Icons.currency_rupee)
      },
      "Maintenance": {
        "controller": maintenanceController,
        "hintText": "Enter maintenance amount",
        "label": "Maintenance",
        "icon": const Icon(Icons.currency_rupee)
      },
      "price": {
        "controller": priceController,
        "hintText": "Price",
        "label": "Price",
        "icon": const Icon(Icons.currency_rupee)
      }
    };
    return formFields;
  }

  @override
  void onInit() {
    // Simulating obtaining the user name from some local storage
    dateController.text = "";
    super.onInit();
  }

  void onBathroomsChanged(String value) {
    bathrooms.value = value;
    update();
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

      // TODO: use lat lon from location.
      Map<String, dynamic> data = {
        "property_about": {
          "balcony": int.parse(balcony.value),
          "bathrooms": int.parse(bathrooms.value),
          "bedrooms": int.parse(bedrooms.value),
          "city": selectedCity.value,
          "price": double.parse(priceController.text),
          "property_status": selectedPropertyStatus.value,
          "property_type": selectedPropertyType.value,
          "property_id": documentId,
          "salable_area": double.parse(salableAreaController.text),
          "terrace": int.parse(terrace.value),
          "security_deposit": int.parse(securityDepositController.text),
          "floor_number": int.parse(floorNumberController.text),
          "maintenance": int.parse(maintenanceController.text),
          "parking": int.parse(parking.value),
          "address": addressController.text,
          "halls": int.parse(halls.value),

          "locality": locality.value,
          "carpet_area": double.parse(carpetAreaController.text),
          "built_up_area": double.parse(builtUpAreaController.text),
          "property_sub_type": selectedPropertySubType.value,
          "property_for": selectedPropertyFor.value,



        },
        "location": {
          "lat": 76.43698832653855,
          "lon": 22.444
        },
        "contact_details": {
          "name": nameController.text,
          "email": emailController.text,
          "phone": int.parse(phoneController.text),
          "message": messageController.text,
          "pan": panController.text,
        },
        "upload_date": uploadTimestamp,
        "gallery": imagesUrlList,
        "floor_plan": floorPlanController.text,
        "isFeatured": isFeatured.value,
        "message": messageController.text
      };
      print(data);
      PropertyAbout.fromMap(data["property_about"]);
      // print(data.toString());
      await docRef.set(data);
      isLoading.value = false;
      uploadFormKey.currentState?.reset();
      _clearFormState();
    }
  }

  void _clearFormState(){
    nameController.clear();
    cityController.clear();
    emailController.clear();
    phoneController.clear();
    panController.clear();
    messageController.clear();
    priceController.clear();
    propertyIdController.clear();
    propertySizeController.clear();
    propertyStatusController.clear();
    dateController.clear();
    floorPlanController.clear();
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
