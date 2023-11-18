import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_asset_zone_web/constants/constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintTextValue;
  final String label;
  final Function? validator;
  final Icon icon;

  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintTextValue,
      required this.label,
      this.validator, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(300, 30, 300, 0),
      child: TextFormField(

        controller: controller,
        decoration: InputDecoration(
          icon: icon,
          hintText: hintTextValue.toString(),
          hintStyle: const TextStyle(color: kSecondaryColor),
          labelStyle: const TextStyle(color: kPrimaryColor),
          labelText: label,
        ),
        validator: (value) {
          if (validator == null) {
            return null;
          } else {
            return validator!(value);
          }
        },
      ),
    );
  }
}

class CustomDropDown extends StatelessWidget {
  final String label;
  final Icon icon;
  final selectedValue;
  // if we omit the type declaration of options we will get error
  //  Expected a value of type 'List<DropdownMenuItem<Object>>?', but got one of type 'List<dynamic>'
  final List<String> options;

  const CustomDropDown(
      {Key? key,
      required this.label,
      required this.icon,
      this.selectedValue,
      required this.options})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.fromLTRB(300, 30, 300, 0),
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            labelStyle: const TextStyle(color: kPrimaryColor),
            label: Text(
              label,
            ),
            icon: icon,
          ),
          value: selectedValue.value,
          items: options.map((String e) {
            return DropdownMenuItem<Object>(
              value: e,
              child: Text(e, style: const TextStyle(color: kSecondaryColor)),
            );
          }).toList(),
          onChanged: (val) {
            selectedValue.value = val;
          },
        ),
      ),
    );
  }
}
