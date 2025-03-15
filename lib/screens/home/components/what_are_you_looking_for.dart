import 'package:flutter/material.dart';

class WhatAreYouLookingFor extends StatelessWidget {
  const WhatAreYouLookingFor({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        children: [
          FittedBox(
            child: Image.asset('assets/5.jpg'),
          ),
          FittedBox(
            child: Container(
              height: height/2,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
