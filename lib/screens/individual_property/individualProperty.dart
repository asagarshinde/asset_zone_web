import 'package:flutter/material.dart';

class IndividualProperty extends StatelessWidget {
  final Map params;

  const IndividualProperty(this.params, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Text(params["propertyId"]),
      ),
    );
  }
}
