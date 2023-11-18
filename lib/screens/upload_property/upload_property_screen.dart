// import 'dart:io';
// import 'dart:typed_data';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_picker_web/image_picker_web.dart';
// // import 'package:file_picker/file_picker.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:the_asset_zone_web/constants/constants.dart';
// import 'package:the_asset_zone_web/responsive.dart';
// import 'package:the_asset_zone_web/screens/home/components/navigation_bar.dart';
//
// // class UploadForm extends StatefulWidget {
// //   const UploadForm({super.key});
// //
// //   @override
// //   _UploadFormState createState() => _UploadFormState();
// // }
// //
// // class _UploadFormState extends State<UploadForm> {
// //   final _formKey = GlobalKey<FormState>();
// //   List<File> galleryFiles = [];
// //   TextEditingController propertyTypeController = TextEditingController();
// //   TextEditingController bathroomController = TextEditingController();
// //   TextEditingController propertyIDController = TextEditingController();
// //   TextEditingController propertyStatusController = TextEditingController();
// //   TextEditingController cityController = TextEditingController();
// //   TextEditingController bedroomsController = TextEditingController();
// //   TextEditingController priceController = TextEditingController();
// //   TextEditingController propertySizeController = TextEditingController();
// //   TextEditingController balconyController = TextEditingController();
// //   TextEditingController videoController = TextEditingController();
// //   TextEditingController floorPlanController = TextEditingController();
// //   TextEditingController latitudeController = TextEditingController();
// //   TextEditingController longitudeController = TextEditingController();
// //   TextEditingController uploadDateController = TextEditingController();
// //
// //   void _openFilePicker() async {
// //     FilePickerResult? result = await FilePicker.platform.pickFiles(
// //       allowMultiple: true,
// //       type: FileType.image,
// //     );
// //
// //     if (result != null && result.files.isNotEmpty) {
// //       setState(() {
// //         galleryFiles = result.files.map((path) => File(path.name!)).toList();
// //       });
// //     }
// //   }
// //
// //   void _submitForm() {
// //     if (_formKey.currentState!.validate()) {
// //       // Prepare the data
// //       Map<String, dynamic> data = {
// //         'gallery': galleryFiles.map((file) => file.path).toList(),
// //         'property_about': {
// //           'property_type': propepropertySizertyTypeController.text,
// //           'bathroom': int.parse(bathroomController.text),
// //           'property_id': propertyIDController.text,
// //           'property_status': propertyStatusController.text,
// //           'city': cityController.text,
// //           'bedrooms': int.parse(bedroomsController.text),
// //           'price': double.parse(priceController.text),
// //           'property_size': int.parse(propertySizeController.text),
// //           'balcony': int.parse(balconyController.text),
// //         },
// //         'video': videoController.text,
// //         'floor_plan': floorPlanController.text,
// //         'location': {
// //           'lat': double.parse(latitudeController.text),
// //           'long': doub`flutter pub outle.parse(longitudeController.text),
// //         },
// //         'upload_date': DateTime.fromMillisecondsSinceEpoch(
// //             int.parse(uploadDateController.text) * 1000),
// //       };
// //
// //       // Upload the data to Firestore
// //       FirebaseFirestore.instance
// //           .collection('your_collection_name')
// //           .add(data)
// //           .then((value) {
// //         // Data uploaded successfully
// //         print('Data uploaded successfully!');
// //       }).catchError((error) {
// //         // Error occurred while uploading data
// //         print('Error uploading data: $error');
// //       });
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Upload Form'),
// //       ),
// //       body: Padding(
// //         padding: EdgeInsets.all(16.0),
// //         child: Form(
// //           key: _formKey,
// //           child: SingleChildScrollView(
// //             child: Column(
// //               children: [
// //                 ElevatedButton(
// //                   onPressed: _openFilePicker,
// //                   child: Text('Pick Images'),
// //                 ),
// //                 SizedBox(height: 16.0),
// //                 Text('Selected Images:'),
// //                 SizedBox(height: 8.0),
// //                 Wrap(
// //                   spacing: 8.0,
// //                   children: galleryFiles.map((file) {
// //                     return Chip(
// //                       label: Text(file.path),
// //                     );
// //                   }).toList(),
// //                 ),
// //                 TextFormField(
// //                   controller: propertyTypeController,
// //                   decoration: InputDecoration(labelText: 'Property Type'),
// //                   validator: (value) {
// //                     if (value!.isEmpty) {
// //                       return 'Please enter the property type';
// //                     }
// //                     return null;
// //                   },
// //                 ),
// //                 // Rest of the form fields...
// //                 // (Omitted for brevity)
// //
// //                 SizedBox(height: 16.0),
// //                 ElevatedButton(
// //                   onPressed: _submitForm,
// //                   child: Text('Submit'),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// class UploadForm extends StatelessWidget {
//   UploadForm({Key? key}) : super(key: key);
//   final ScrollController scrollController = ScrollController();
//   chooseImage() async {
//     PickedFile? pickedFile = (await ImagePicker().getImage(
//       source: ImageSource.gallery,
//     ));
//     print(pickedFile?.path.toString());
//     uploadImage(pickedFile!);
//     return pickedFile;
//   }
//
//   uploadImage(PickedFile image) async {
//     var firestoreDB = FirebaseStorage.instance;
//     Reference ref = firestoreDB.ref().child('${DateTime.now()}.png');
//     UploadTask uploadTask = ref.putData(
//         image as Uint8List, SettableMetadata(contentType: 'image/png'));
//     TaskSnapshot taskSnapshot = await uploadTask
//         .whenComplete(() => print('done'))
//         .catchError((error) => print("Error"));
//     String url = await taskSnapshot.ref.getDownloadURL();
//     print(url);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: Responsive.isDesktop(context)
//           ? PreferredSize(
//               preferredSize: Size(MediaQuery.of(context).size.width, 70),
//               child: SimpleMenuBar(),
//             )
//           : AppBar(
//               backgroundColor: kPrimaryColor,
//             ),
//       drawer: const MySimpleDrawer(),
//       body: LayoutBuilder(
//           builder: (BuildContext build, BoxConstraints constraints) {
//         return CustomScrollView(
//           scrollDirection: Axis.vertical,
//           controller: scrollController,
//           slivers: [
//             SliverList(
//               delegate: SliverChildListDelegate([
//                 Container(
//                   child: ElevatedButton(
//                     onPressed: () async {
//                       // image = await ImagePickerWeb.getImageAsBytes();
//                     },
//                     child: Text("Upload image"),
//                   ),
//                 )
//               ]),
//             )
//           ],
//         );
//       }),
//     );
//   }
// }
