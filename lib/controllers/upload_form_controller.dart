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
  RxString bathrooms = "1".obs;
  RxString balcony = "0".obs;
  RxString bedrooms = "0".obs;
  RxString garage = "0".obs;
  RxString halls = "0".obs;
  RxBool isFeatured = false.obs;
  RxString selectedCity = "Nashik".obs;
  RxString selectedPropertyStatus = "Completed".obs;
  RxString selectedPropertyType = "Residential".obs;
  RxString selectedPropertySubType = "Apartment".obs;
  RxString locality = "".obs;
  List<String> propertiesStatusList = ["Completed", "Under Construction"];
  List<String> selectNumbers = ['0', '1', '2', '3', '4', '5'];
  List<String> citiesList = ["Nashik", "Pune", "Igatapuri"];
  List<String> propertiesTypeList = ["Residential", "Commercial"];
  List<String> propertiesSubTypeList = [
    "Apartment",
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

  static UploadFormController instance = Get.find();

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
      "pan": {
        "controller": panController,
        "hintText": "Enter your Pan card No",
        "label": "PAN",
        "validator": panValidator,
        "icon": const Icon(Icons.credit_card)
      },
      "message": {
        "controller": messageController,
        "hintText": "Message",
        "label": "Message",
        "validator": defaultTextValidators,
        "icon": const Icon(Icons.message)
      },
      "price": {
        "controller": priceController,
        "hintText": "Price",
        "label": "Price",
        "icon": const Icon(Icons.price_change)
      },
      "property_size": {
        "controller": propertySizeController,
        "hintText": "PropertySize",
        "label": "Property Size",
        "icon": const Icon(Icons.format_size)
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
      // Validate returns true if the form is valid, or false otherwise.
      if (uploadFormKey.currentState!.validate()) {
        // If the form is valid, display a snackbar. In the real world,
        // you'd often call a server or save the information in a database.
        //TODO: find how can pass context
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(content: Text('Processing Data')),
        // );
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

      Map<String, dynamic> data = {
        "property_about": {
          "balcony": int.parse(balcony.value),
          "bathroom": int.parse(bathrooms.value),
          "bedrooms": int.parse(bedrooms.value),
          "city": cityController.text,
          "garage": garage.value,
          "halls": halls.value,
          "locality": locality.value,
          "price": int.parse(priceController.text),
          "property_size": int.parse(propertySizeController.text),
          "property_status": propertyStatusController.text,
          "property_type": selectedPropertyType.value,
          "property_sub_type": selectedPropertySubType.value
        },
        "contact_details": {
          "name": nameController.text,
          "email": emailController.text,
          "phone": phoneController.text,
          "message": messageController.text,
          "pan": panController.text,
        },
        "upload_date": dateController.text,
        "gallery": imagesUrlList,
        "floor_plan": floorPlanController.text,
        "isFeatured": isFeatured.value,
      };
      PropertyAbout.fromMap(data["property_about"]);
      print(data);
      await docRef.set(data);
    }
  }

  void addImagesToList(Uint8List image) {
    imageFiles.add(image);
    if (imageFiles.isNotEmpty) {
      imageAvailable.value = true;
    }
  }
}
