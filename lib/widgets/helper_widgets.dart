import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_asset_zone_web/controllers/properties_controller.dart';
import 'package:the_asset_zone_web/models/property_detail_model.dart';
import 'package:the_asset_zone_web/constants/constants.dart';

class MyButton extends StatefulWidget {
  final String title;
  final height;
  final width;
  var onTap;

  MyButton({Key? key, required this.title, this.height, this.width, this.onTap})
      : super(key: key);

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
    return ElevatedButton(onPressed: onTap, child: Text(
      text,
      style: kButtonStyle,
    ),
    );
  }
}
