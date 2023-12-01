import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:intl/intl.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
import 'package:the_asset_zone_web/constants/controllers.dart';
import 'package:the_asset_zone_web/controllers/upload_form_controller.dart';
import 'package:the_asset_zone_web/responsive.dart';
import 'package:the_asset_zone_web/screens/home/components/navigation_bar.dart';
import 'package:the_asset_zone_web/screens/home/home_screen.dart';
import 'add_property_widgets.dart';

class FormAddFirebase extends StatefulWidget {
  const FormAddFirebase({super.key});

  @override
  State<FormAddFirebase> createState() => _FormAddFirebaseState();
}

class _FormAddFirebaseState extends State<FormAddFirebase> {
  Map<String, Widget> fields = {};

  Future _selectRent() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            title: const Text("Select property for rent of sale"),
            content: const Text(
                "If you don't select anything then property for sale is selected."),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    uploadFormController.isRent.value = true;
                    Navigator.of(context).pop();
                  },
                  child: const Text("Rent")),
              TextButton(
                  onPressed: () {
                    uploadFormController.isRent.value = false;
                    Navigator.of(context).pop();
                  },
                  child: const Text("Sell"))
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await _selectRent();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var formController = Get.put(UploadFormController());
    var formFields = formController.getFormFields();
    for (String key in formFields.keys) {
      fields[key] = SimpleTextField(
          controller: formFields[key]["controller"],
          hintTextValue: formFields[key]["hintText"],
          label: formFields[key]["label"],
          icon: formFields[key]["icon"],
          validator: formFields[key]["validator"]);
    }
    // if user is logged in then navBarController.showPropertyAdd.value=true
    // if user is not logged in then show home page.
    navBarController.showPropertyAdd.value = true;
    if (navBarController.showPropertyAdd.value) {
      if (Responsive.isDesktop(context)) {
        return Obx(
          () => Scaffold(
            appBar: Responsive.isDesktop(context)
                ? PreferredSize(
                    preferredSize: Size(MediaQuery.of(context).size.width, 70),
                    child: const SimpleMenuBar(),
                  )
                : AppBar(
                    backgroundColor: kPrimaryColor,
                  ),
            drawer: const MySimpleDrawer(),
            body: SingleChildScrollView(
              child: Center(
                child: SizedBox(
                  // height: 3000,
                  width: kformMaxWidth,
                  child: Center(
                    child: Form(
                      key: formController.uploadFormKey,
                      //formController.key,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Center(
                            child: Text(
                              (uploadFormController.isRent.value)
                                  ? "Admin form for rent property"
                                  : "Admin form for sell property",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: kSecondaryColor),
                            ),
                          ),
                          const SizedBox(height: 50),
                          TitledContainer(
                            titleText: "personal Details",
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(children: [
                                // Whenever input decorator in text form field is used
                                // in row we should define width or use expanded.
                                Expanded(flex: 1, child: fields["name"]!),
                                kformVerticalDivider,
                                Expanded(flex: 1, child: fields["email"]!),
                                kformVerticalDivider,
                                Expanded(
                                    flex: 1, child: fields["mobileNumber"]!)
                              ]),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          TitledContainer(
                            titleText: "Property Address",
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: [
                                    Expanded(child: fields["flatNumber"]!),
                                    kformVerticalDivider,
                                    Expanded(child: fields["floor"]!),
                                    kformVerticalDivider,
                                    Expanded(child: fields["plotNo"]!),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: fields["surveyOrGutNumber"]!),
                                    kformVerticalDivider,
                                    Expanded(child: fields["buildingName"]!),
                                    kformVerticalDivider,
                                    Expanded(child: fields["landmark"]!),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(child: fields["locationOrArea"]!),
                                    kformVerticalDivider,
                                    // Expanded(child: fields["description"]!),
                                    Expanded(child: fields["village"]!),
                                    kformVerticalDivider,
                                    Expanded(
                                      flex: 1,
                                      child: CustomDropDown(
                                          label: 'City',
                                          icon: const Icon(Icons.location_city),
                                          options: formController.citiesList,
                                          selectedValue:
                                              formController.selectedCity),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(child: fields["taluka"]!),
                                    kformVerticalDivider,
                                    Expanded(child: fields["district"]!),
                                    kformVerticalDivider,
                                    Expanded(child: fields["state"]!),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(child: SizedBox()),
                                    kformVerticalDivider,
                                    Expanded(
                                        flex: 1, child: fields["pincode"]!),
                                    kformVerticalDivider,
                                    Expanded(child: SizedBox()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          if (formController.isRent.value)
                            TitledContainer(
                              titleText: "Rent Details",
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: fields["securityDeposit"]!),
                                      kformVerticalDivider,
                                      Expanded(child: fields["maintenance"]!),
                                      kformVerticalDivider,
                                      Expanded(child: fields["rent"]!),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomDropDown(
                                            label: 'Preferred Tenants',
                                            icon: const Icon(
                                                Icons.person_add_sharp),
                                            options: formController
                                                .preferredTenantsList,
                                            selectedValue: formController
                                                .selectedPreferredTenants),
                                      ),
                                      kformVerticalDivider,
                                      Expanded(
                                        child: CustomDropDown(
                                            label: 'Furnished',
                                            icon:
                                                const Icon(Icons.chair_rounded),
                                            options:
                                                formController.furnitureList,
                                            selectedValue: formController
                                                .selectedFurniture),
                                      ),
                                      kformVerticalDivider,
                                      Expanded(child: fields["carpetArea"]!),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Expanded(child: SizedBox()),
                                      kformVerticalDivider,
                                      Expanded(
                                        child: Center(
                                          child: TextField(
                                            controller:
                                                formController.dateController,
                                            //editing controller of this TextField
                                            decoration: const InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior
                                                        .always,
                                                border: OutlineInputBorder(),
                                                prefixIcon:
                                                    Icon(Icons.calendar_today),
                                                hintStyle: TextStyle(
                                                    color: kSecondaryColor),
                                                labelStyle: TextStyle(
                                                    color: kPrimaryColor),
                                                labelText:
                                                    "From when property available" //label text of field
                                                ),
                                            readOnly: true,
                                            //set it true, so that user will not able to edit text
                                            onTap: () async {
                                              DateTime? pickedDate =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate: DateTime(1950),
                                                      //DateTime.now() - not to allow to choose before today.
                                                      lastDate: DateTime(2100));

                                              if (pickedDate != null) {
                                                //pickedDate output format => 2021-03-10 00:00:00.000
                                                String formattedDate =
                                                    DateFormat('yyyy-MM-dd')
                                                        .format(pickedDate);
                                                //formatted date output using intl package =>  2021-03-16
                                                setState(
                                                  () {
                                                    formController
                                                            .dateController
                                                            .text =
                                                        formattedDate; //set output date to TextField value.
                                                  },
                                                );
                                              } else {}
                                            },
                                          ),
                                        ),
                                      ),
                                      kformVerticalDivider,
                                      const Expanded(child: SizedBox())
                                    ],
                                  )
                                ],
                              ),
                            ),
                          if (!formController.isRent.value)
                            TitledContainer(
                              titleText: "Sale Details",
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomDropDown(
                                            label: 'Ownership',
                                            icon: const Icon(Icons.man),
                                            options:
                                                formController.ownershipList,
                                            selectedValue: formController
                                                .selectedOwnership),
                                      ),
                                      kformVerticalDivider,
                                      Expanded(
                                        flex: 1,
                                        child: CustomDropDown(
                                            label: 'Construction Status',
                                            icon:
                                                const Icon(Icons.location_city),
                                            options: formController
                                                .constructionStatusList,
                                            selectedValue: formController
                                                .selectedConstructionStatus),
                                      ),
                                      kformVerticalDivider,
                                      Expanded(
                                          child: fields["construction_year"]!)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(child: fields["salableArea"]!),
                                      kformVerticalDivider,
                                      Expanded(child: fields["builtUpArea"]!),
                                      kformVerticalDivider,
                                      Expanded(child: fields["carpetArea"]!),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          const SizedBox(
                            height: 50,
                          ),
                          TitledContainer(
                            titleText: "Property details",
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomDropDown(
                                          label: 'Bathrooms',
                                          icon: const Icon(
                                              Icons.bathtub_outlined),
                                          options: formController.selectNumbers,
                                          selectedValue:
                                              formController.bathrooms),
                                    ),
                                    kformVerticalDivider,
                                    Expanded(
                                      child: CustomDropDown(
                                          label: 'Terrace',
                                          icon: const Icon(Icons.balcony),
                                          options: formController.selectNumbers,
                                          selectedValue:
                                              formController.terrace),
                                    ),
                                    kformVerticalDivider,
                                    Expanded(
                                      child: CustomDropDown(
                                          label: 'Balcony',
                                          icon: const Icon(Icons.balcony),
                                          options: formController.selectNumbers,
                                          selectedValue:
                                              formController.balcony),
                                    ),
                                    kformVerticalDivider,
                                    Expanded(
                                      child: CustomDropDown(
                                          label: 'Bedrooms',
                                          icon:
                                              const Icon(Icons.bedroom_parent),
                                          options: formController.selectNumbers,
                                          selectedValue:
                                              formController.bedrooms),
                                    ),
                                    kformVerticalDivider,
                                    Expanded(
                                      child: CustomDropDown(
                                          label: 'Parking',
                                          icon: const Icon(Icons.garage),
                                          options: formController.parkingList,
                                          selectedValue:
                                              formController.parking),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    Expanded(child: fields["total_floors"]!),
                                    kformVerticalDivider,
                                    Expanded(
                                      child: CustomDropDown(
                                          label: 'Property Types',
                                          icon: const Icon(Icons.location_city),
                                          options:
                                              formController.propetyTypesList,
                                          selectedValue: formController
                                              .selectedPropertyType),
                                    ),
                                    kformVerticalDivider,
                                    Expanded(
                                      child: CustomDropDown(
                                          label: 'Property Sub Type',
                                          icon: const Icon(Icons.location_city),
                                          options: formController
                                              .propertiesSubTypeList,
                                          selectedValue: formController
                                              .selectedPropertySubType),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Expanded(child: fields["builderName"]!),
                                    kformVerticalDivider,
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Stack(
                                          children: [
                                            const Text("Gated Community"),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 18),
                                              child: Switch(
                                                value: formController
                                                    .inGatedCommunity.value,
                                                hoverColor: kSecondaryColor,
                                                activeColor: kSecondaryColor,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      formController
                                                          .inGatedCommunity
                                                          .value = value;
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    kformVerticalDivider,
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Stack(children: [
                                          const Text("Featured"),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 18),
                                            child: Switch(
                                              value: formController
                                                  .isFeatured.value,
                                              activeColor: kSecondaryColor,
                                              hoverColor: kSecondaryColor,
                                              onChanged: (value) {
                                                setState(
                                                  () {
                                                    formController.isFeatured
                                                        .value = value;
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ),
                                    // Expanded(
                                    //   flex: 2,
                                    //   child: Center(
                                    //     child: TextField(
                                    //       controller:
                                    //       formController.dateController,
                                    //       //editing controller of this TextField
                                    //       decoration: const InputDecoration(
                                    //           border: OutlineInputBorder(),
                                    //           prefixIcon:
                                    //           Icon(Icons.calendar_today),
                                    //           //icon of text field
                                    //           labelText:
                                    //           "Enter Date" //label text of field
                                    //       ),
                                    //       readOnly: true,
                                    //       //set it true, so that user will not able to edit text
                                    //       onTap: () async {
                                    //         DateTime? pickedDate =
                                    //         await showDatePicker(
                                    //             context: context,
                                    //             initialDate: DateTime.now(),
                                    //             firstDate: DateTime(1950),
                                    //             //DateTime.now() - not to allow to choose before today.
                                    //             lastDate: DateTime(2100));
                                    //
                                    //         if (pickedDate != null) {
                                    //           //pickedDate output format => 2021-03-10 00:00:00.000
                                    //           String formattedDate =
                                    //           DateFormat('yyyy-MM-dd')
                                    //               .format(pickedDate);
                                    //           //formatted date output using intl package =>  2021-03-16
                                    //           setState(
                                    //                 () {
                                    //               formController
                                    //                   .dateController.text =
                                    //                   formattedDate; //set output date to TextField value.
                                    //             },
                                    //           );
                                    //         } else {}
                                    //       },
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Expanded(child: fields["description"]!),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => kSecondaryColor)),
                            onPressed: () async {
                              final image =
                                  await ImagePickerWeb.getImageAsBytes();
                              formController.addImagesToList(image!);
                            },
                            child: const Text(
                              "Pick images",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          formController.imageAvailable.value
                              ? GridView.count(
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  crossAxisCount: 3,
                                  children: List.generate(
                                    formController.imageFiles.length,
                                    (index) {
                                      // Asset asset = imageFiles[index] as Asset;
                                      return Card(
                                        child: Stack(
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.memory(
                                                  formController
                                                      .imageFiles[index],
                                                  fit: BoxFit.cover),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                formController.imageFiles
                                                    .removeAt(index);
                                              },
                                              icon: const Icon(
                                                Icons.delete,
                                                color: kSecondaryColor,
                                                size: 24,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : const SizedBox(),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: formController.submitForm,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: kSecondaryColor),
                            child: const Text(
                              "Submit Request",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          if (formController.isLoading.value)
                            const CircularProgressIndicator()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      } else {
        const Text("Not implemented yet !");
      }
    }
    return const HomeScreen(title: "The Asset Zone");
  }
}
