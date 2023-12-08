import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_asset_zone_web/constants/constants.dart';

class SimpleTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintTextValue;
  final String label;
  final Function? validator;
  final Icon icon;

  const SimpleTextField(
      {super.key,
      required this.controller,
      required this.hintTextValue,
      required this.label,
      this.validator,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: (label == 'Description' || label == 'Address') ? 5 : 1,
      controller: controller,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // prefixIcon: icon,
        border: const OutlineInputBorder(),
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
      {super.key,
      required this.label,
      required this.icon,
      this.selectedValue,
      required this.options});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(0),
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            prefixIcon: icon,
            labelStyle: const TextStyle(color: kPrimaryColor),
            label: Text(
              label,
            ),
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
          menuMaxHeight: 5*48,
        ),
      ),
    );
  }
}

class HorizontalDividerWithText extends StatelessWidget {
  final String text;

  const HorizontalDividerWithText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Divider(),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Text(
              text,
            ),
          ),
        ],
      ),
    );
  }
}


class TitledContainer extends StatelessWidget {
  const TitledContainer({required this.titleText, required this.child, this.idden = 8, super.key});
  final String titleText;
  final double idden;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          padding: EdgeInsets.all(idden),
          decoration: BoxDecoration(
            color: kSecondaryColor.withOpacity(0.06),
            border: Border.all(),
            borderRadius: BorderRadius.circular(idden * 0.6),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: child,
          ),
        ),
        Positioned(
          left: 100,
          right: 100,
          top: 0,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: Colors.white,
              child: Text(" $titleText ", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16),),
            ),
          ),
        ),
      ],
    );
  }
}