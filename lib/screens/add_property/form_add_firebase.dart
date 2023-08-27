import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:intl/intl.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
import 'package:the_asset_zone_web/controllers/upload_form_controller.dart';
import 'add_property_widgets.dart';


class FormAddFirebase extends StatefulWidget {
  const FormAddFirebase({Key? key}) : super(key: key);

  @override
  State<FormAddFirebase> createState() => _FormAddFirebaseState();
}

class _FormAddFirebaseState extends State<FormAddFirebase> {
  // final _selectNumbers = ['0', '1', '2', '3', '4', '5'];

  @override
  Widget build(BuildContext context) {
    var formController = Get.put(UploadFormController());
    var formFields = formController.getFormFields();
    var widgets = [
      for (String key in formFields.keys)
        CustomTextField(
            controller: formFields[key]["controller"],
            hintTextValue: formFields[key]["hintText"],
            label: formFields[key]["label"],
            icon: formFields[key]["icon"],
            validator: formFields[key]["validator"]),
    ];

    return Obx(
      () => Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: 2500,
            child: Center(
              child: Form(
                key: formController.uploadFormKey, //formController.key,
                child: Column(
                  children: [
                    const Center(
                      child: Text(
                        "Admin Form",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    ...widgets,
                    CustomDropDown(
                        label: 'Bathrooms',
                        icon: const Icon(Icons.bathtub_outlined),
                        options: formController.selectNumbers,
                        selectedValue: formController.bathrooms),
                    CustomDropDown(
                        label: 'Balcony',
                        icon: const Icon(Icons.balcony),
                        options: formController.selectNumbers,
                        selectedValue: formController.balcony),
                    CustomDropDown(
                        label: 'Bedrooms',
                        icon: const Icon(Icons.bedroom_parent),
                        options: formController.selectNumbers,
                        selectedValue: formController.bedrooms),
                    CustomDropDown(
                        label: 'Garage',
                        icon: const Icon(Icons.garage),
                        options: formController.selectNumbers,
                        selectedValue: formController.garage),
                    CustomDropDown(
                        label: 'Halls',
                        icon: const Icon(Icons.room_preferences_outlined),
                        options: formController.selectNumbers,
                        selectedValue: formController.halls),
                    CustomDropDown(
                        label: 'City',
                        icon: const Icon(Icons.location_city),
                        options: formController.citiesList,
                        selectedValue: formController.selectedCity),
                    CustomDropDown(
                        label: 'City',
                        icon: const Icon(Icons.location_city),
                        options: formController.propertiesStatusList,
                        selectedValue: formController.selectedPropertyStatus),
                    CustomDropDown(
                        label: 'City',
                        icon: const Icon(Icons.location_city),
                        options: formController.propertiesTypeList,
                        selectedValue: formController.selectedPropertyType),
                    CustomDropDown(
                        label: 'PropertySubType',
                        icon: const Icon(Icons.location_city),
                        options: formController.propertiesSubTypeList,
                        selectedValue: formController.selectedPropertySubType),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => kPrimaryColor)),
                      // onPressed: pickImages,
                      onPressed: () async {
                        final image = await ImagePickerWeb.getImageAsBytes();
                        formController.addImagesToList(image!);
                      },
                      child: const Text("Pick images"),
                    ),
                    formController.imageAvailable.value
                        ? Expanded(
                            flex: 1,
                            child: GridView.count(
                              crossAxisCount: 3,
                              children: List.generate(
                                formController.imageFiles.length,
                                (index) {
                                  // Asset asset = imageFiles[index] as Asset;
                                  return SizedBox(
                                    width: 300,
                                    height: 100,
                                    child: Image.memory(
                                        formController.imageFiles[index],
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.scaleDown),
                                  );
                                },
                              ),
                            ),
                          )
                        : const SizedBox(),
                    Container(
                      padding: const EdgeInsets.fromLTRB(350, 30, 300, 0),
                      child: const Text("Featured"),
                    ),
                    Switch(
                      value: formController.isFeatured.value,
                      activeColor: Colors.blue,
                      onChanged: (value) {
                        setState(() {
                          formController.isFeatured.value = value;
                          print(value);
                        });
                      },
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(300, 30, 300, 0),
                      child: Center(
                        child: TextField(
                          controller: formController.dateController,
                          //editing controller of this TextField
                          decoration: const InputDecoration(
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
                                formController.dateController.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {}
                          },
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(400, 30, 400, 0),
                      constraints:
                          const BoxConstraints(minWidth: double.infinity),
                      child: ElevatedButton(
                        onPressed: formController.submitForm,
                        style: ElevatedButton.styleFrom(
                          primary: kPrimaryColor,
                        ),
                        child: const Text("Submit Request"),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
