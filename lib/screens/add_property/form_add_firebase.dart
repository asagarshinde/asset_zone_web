import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class FormAddFirebase extends StatefulWidget {
  FormAddFirebase({Key? key}) : super(key: key);

  @override
  State<FormAddFirebase> createState() => _FormAddFirebaseState();
}

class _FormAddFirebaseState extends State<FormAddFirebase> {
  //{ property details

  //contact info
  TextEditingController Name = new TextEditingController();
  TextEditingController Email = new TextEditingController();
  TextEditingController Phone = new TextEditingController();
  TextEditingController Pan = new TextEditingController();
  TextEditingController Message = new TextEditingController();

  //property about
  String Bathrooms = "";
  String Balcony = "";
  String Bedrooms = "";
  String Garege = "";
  String Halls = "";

  //TextEditingController Bathrooms = TextEditingController();
  // TextEditingController Balcony = TextEditingController();
  // TextEditingController Bedrooms = TextEditingController();
  TextEditingController City = TextEditingController();

  //TextEditingController Garage = TextEditingController();
  //TextEditingController Halls = TextEditingController();
  TextEditingController Price = TextEditingController();
  TextEditingController PropertyId = TextEditingController();
  TextEditingController PropertySize = TextEditingController();
  TextEditingController PropertyStatus = TextEditingController();
  TextEditingController PropertyType = TextEditingController();

  TextEditingController Date = TextEditingController();
  TextEditingController FloorPlan = TextEditingController();
  TextEditingController Gallery = TextEditingController();
  TextEditingController Video = TextEditingController();

  bool isFeatured = false;

  //}

  final _formKey = GlobalKey<FormState>();

  final _selectNumbers = ['1', '2', '3', '4', '5'];
  String _selectedValueBathrooms = '1';
  String _selectedValueBalcony = '1';
  String _selectedValueBedrooms = '1';
  String _selectedValueGarege = '1';
  String _selectedValueHalls = '1';

  @override
  void initState() {
    Date.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Asset> images = <Asset>[];

    @override
    void initState() {
      super.initState();
    }

    Future<void> pickImages() async {
      List<Asset> resultList = <Asset>[];

      try {
        resultList = await MultiImagePicker.pickImages(
          maxImages: 300,
          enableCamera: true,
          selectedAssets: images,
          materialOptions: MaterialOptions(
            actionBarTitle: "FlutterCorner.com",
          ),
        );
      } on Exception catch (e) {
        print(e);
      }

      setState(() {
        images = resultList;
      });
    }

    // File _image = File('');
    //
    // Future<dynamic> getImage() async {
    //   PickedFile? pickedFile = await ImagePicker().getImage(
    //     source: ImageSource.gallery,
    //   );
    //   if (pickedFile != null) {
    //     setState(() {
    //       _image = File(pickedFile.path);
    //     });
    //   }
    // }
    //
    // Future uploadPic(BuildContext context) async{
    //   final metadata = SettableMetadata(
    //     customMetadata: {'picked-file-path': "123"},
    //   );
    //   FirebaseStorage storage = FirebaseStorage.instance;
    //   Reference ref = storage.ref().child('profile/images/'+"image" + DateTime.now().toString());
    //   UploadTask uploadTask = ref.putFile(images, metadata);
    //   uploadTask.then((res) {
    //     res.ref.getDownloadURL();
    //     print("Upload Image on firebase");
    //   });
    // }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 2500,
          child: Center(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      child: Center(
                          child: Text(
                        "Admin Form",
                        style: TextStyle(fontSize: 20),
                      )),
                    ),

                    //{ property details

                    //{ contact info
                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: TextFormField(
                        controller: Name,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.person),
                          hintText: 'Enter your full name',
                          labelText: 'Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: TextFormField(
                        controller: Email,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.email),
                          hintText: 'Enter your Email',
                          labelText: 'Email ID',
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains('@') ||
                              !value.contains('.')) {
                            return 'Invalid Email';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: TextFormField(
                        controller: Phone,
                        validator: (value) {
                          //if (value != null)
                          if (value?.length != 10) {
                            return 'Mobile Number must be of 10 digit';
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.phone),
                          hintText: 'Enter your Phone No.',
                          labelText: 'Phone No.',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: TextFormField(
                        controller: Pan,
                        validator: (value) {
                          //if (value != null)
                          if (value.toString().isEmpty) {
                            return "";
                          }
                          if (!value!.contains(
                              r'^[2-9]{1}[0-9]{3}\\s[0-9]{4}\\s[0-9]{4}$')) {
                            return 'Pan Number is not valid';
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.credit_card_outlined),
                          hintText: 'Enter your Pan card No.',
                          labelText: 'PanCard No.',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: TextFormField(
                        controller: Message,
                        minLines: 1,
                        maxLines: 5,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.message),
                          hintText: 'Message',
                          labelText: 'Message',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    // contact info }

                    // { property about             children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          label: Text(
                            "Bathrooms",
                          ),
                          icon: const Icon(Icons.bathtub_outlined),
                        ),
                        value: _selectedValueBathrooms,
                        items: _selectNumbers.map((e) {
                          return DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            _selectedValueBathrooms = val as String;
                            Bathrooms = val;
                          });
                        },
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          label: Text(
                            "Balcony",
                          ),
                          icon: const Icon(Icons.balcony),
                        ),
                        value: _selectedValueBalcony,
                        items: _selectNumbers.map((e) {
                          return DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            _selectedValueBalcony = val as String;
                            Balcony = _selectedValueBalcony;
                          });
                        },
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          label: Text(
                            "Bedrooms",
                          ),
                          icon: const Icon(Icons.bedroom_parent),
                        ),
                        value: _selectedValueBedrooms,
                        items: _selectNumbers.map((e) {
                          return DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            _selectedValueBedrooms = val as String;
                            Bathrooms = _selectedValueBedrooms;
                          });
                        },
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: TextFormField(
                        controller: City,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.location_city),
                          hintText: 'Enter city name',
                          labelText: 'City',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          label: Text(
                            "Garege",
                          ),
                          icon: const Icon(Icons.garage),
                        ),
                        value: _selectedValueGarege,
                        items: _selectNumbers.map((e) {
                          return DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            _selectedValueGarege = val as String;
                            Bathrooms = _selectedValueGarege;
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          label: Text(
                            "Halls",
                          ),
                          icon: const Icon(Icons.room_preferences_outlined),
                        ),
                        value: _selectedValueHalls,
                        items: _selectNumbers.map((e) {
                          return DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            _selectedValueHalls = val as String;
                            Bathrooms = _selectedValueHalls;
                          });
                        },
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: TextFormField(
                        controller: Price,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.price_change),
                          hintText: 'Price',
                          labelText: 'Price',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: TextFormField(
                        controller: PropertyId,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.garage),
                          hintText: 'PropertyId',
                          labelText: 'PropertyId',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: TextFormField(
                        controller: PropertySize,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.garage),
                          hintText: 'PropertySize',
                          labelText: 'PropertySize',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: TextFormField(
                        controller: PropertyStatus,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.garage),
                          hintText: 'PropertyStatus',
                          labelText: 'PropertyStatus',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: TextFormField(
                        controller: PropertyType,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.garage),
                          hintText: 'PropertyType',
                          labelText: 'PropertyType',
                        ),
                      ),
                    ),
                    // property about }

                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: TextFormField(
                        controller: FloorPlan,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.next_plan),
                          hintText: 'FloorPlan',
                          labelText: 'FloorPlan',
                        ),
                      ),
                    ),

                    TextButton(
                      child: Text("Pick images"),
                      onPressed: pickImages,
                    ),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 3,
                        children: List.generate(images.length, (index) {
                          Asset asset = images[index];
                          return AssetThumb(
                            asset: asset,
                            width: 300,
                            height: 300,
                          );
                        }),
                      ),
                    ),

                    // Container(
                    //   padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                    //   child: Row(
                    //     children: [
                    //       Row(
                    //         children: [
                    //           Container(
                    //             child: TextButton.icon(
                    //               icon: Icon(Icons.camera),
                    //               label: Text('Gallery'),
                    //               onPressed: () {
                    //                 pickImages();
                    //               },
                    //             ),
                    //           ),
                    //
                    //           Container(
                    //             child: Text(""),
                    //           ),
                    //
                    //         ],
                    //       )
                    //
                    //       // IconButton(
                    //       //   icon: Icon(Icons.camera,size: 30.0,),
                    //       //   onPressed: () {
                    //       //     getImage();
                    //       //   },
                    //       // ),
                    //     ],
                    //   ),
                    // ),

                    Container(
                      padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: TextFormField(
                        controller: Video,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.video_call),
                          hintText: 'Video',
                          labelText: 'Video',
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(350, 30, 300, 0),
                          child: Text("Featured"),
                        ),
                        Container(
                          //padding: EdgeInsets.fromLTRB(00, 30, 300, 0),
                          child: Switch(
                            value: isFeatured,
                            activeColor: Colors.blue,
                            onChanged: (value) {
                              setState(() {
                                isFeatured = value;
                                print(value);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(300, 30, 300, 0),
                        child: Center(
                            child: TextField(
                          controller: Date,
                          //editing controller of this TextField
                          decoration: InputDecoration(
                              icon: Icon(Icons.calendar_today),
                              //icon of text field
                              labelText: "Enter Date" //label text of field
                              ),
                          readOnly: true,
                          //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2100));

                            if (pickedDate != null) {
                              print(
                                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(
                                  formattedDate); //formatted date output using intl package =>  2021-03-16
                              setState(() {
                                Date.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {}
                          },
                        ))),

                    // property details }

                    Container(
                      padding: EdgeInsets.fromLTRB(400, 30, 400, 0),
                      constraints:
                          const BoxConstraints(minWidth: double.infinity),
                      child: ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }

                          //uploadPic(context);

                          Map<String, dynamic> data = {
                            "property_about": {
                              "bathrooms": Bathrooms,
                              "balcony": Balcony,
                              "bedrooms": Bedrooms,
                              "city": City.text,
                              "garage": Garege,
                              "halls": Halls,
                              "price": Price.text,
                              "property_id": PropertyId.text,
                              "property_size": PropertySize.text,
                              "property_status": PropertyStatus.text,
                              "property_type": PropertyType.text,
                            },
                            "contact_info": {
                              "name": Name.text,
                              "email": Email.text,
                              "phone": Phone.text,
                              "message": Message.text,
                              "pan": Pan.text,
                            },
                            "date": Date.text,
                            "video": Video.text,
                            "gallery": Gallery.text,
                            "floor_plan": FloorPlan.text,
                            "isFeatured": isFeatured,
                          };
                          print(data);
                          //FirebaseFirestore.instance.collection("PropertyDetails").add(data);
                        },
                        child: Text("Submit Request"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
