import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_asset_zone_web/screens/home/components/property_search_mobile_view.dart';

class AdvanceSearchVerticalPanel extends StatelessWidget {
  const AdvanceSearchVerticalPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.only(left: 30, top: 20),
              child: Text(
                "Advance search",
                style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(28, 45, 58, 1)),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "Filter",
                style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(88, 97, 103, 1)),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          PropertySearchMobileView(),
        ],
      ),
    );
  }
}
