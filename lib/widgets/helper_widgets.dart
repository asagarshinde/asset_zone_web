import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_asset_zone_web/constants/controllers.dart';
import 'package:the_asset_zone_web/controllers/properties_controller.dart';
import 'package:the_asset_zone_web/models/property_detail_model.dart';
import 'package:the_asset_zone_web/constants/constants.dart';

class MyButton extends StatefulWidget {
  final String title;
  final height;
  final width;
  final onTap;

  const MyButton(
      {super.key, required this.title, this.height, this.width, this.onTap});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  final propertyDetailsFirestore = Get.put(PropertyController());
  List<PropertyDetails> lstPD = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 100,
      height: widget.height ?? 50,
      decoration: BoxDecoration(
          color: kSecondaryColor, borderRadius: BorderRadius.circular(4)),
      child: InkWell(
        highlightColor: Colors.white38,
        splashColor: Colors.white,
        onTap: widget.onTap,
        child: Center(
          child: Text(
            widget.title,
            style: kButtonStyle,
          ),
        ),
      ),
    );
  }
}

class DynamicButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double textSize;
  final VoidCallback onTap;

  const DynamicButton({
    Key? key,
    required this.text,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.textSize = 16,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        text,
        style: kButtonStyle,
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
          menuMaxHeight: 5 * 48,
        ),
      ),
    );
  }
}

class CustomNavBarDropDown extends StatelessWidget {
  final String label;
  final Icon icon;
  final selectedValue;

  // if we omit the type declaration of options we will get error
  //  Expected a value of type 'List<DropdownMenuItem<Object>>?', but got one of type 'List<dynamic>'
  final List<String> options;

  const CustomNavBarDropDown(
      {super.key,
      required this.label,
      required this.icon,
      this.selectedValue,
      required this.options});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        debugPrint("Selected city on navbar is ${navBarController.navBarSelectedCity.value}");
        return Container(
          padding: const EdgeInsets.all(0),
          child: DropdownButtonFormField(
            hint: const Text("city"),
            decoration: InputDecoration(
              isDense: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0)
              ),
              labelStyle: const TextStyle(color: kPrimaryColor),
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
            menuMaxHeight: 5 * 48,
          ),
        );
      }
    );
  }
}
