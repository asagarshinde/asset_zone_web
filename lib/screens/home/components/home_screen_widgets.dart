import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
import 'package:the_asset_zone_web/models/property_detail_model.dart';
import 'package:the_asset_zone_web/screens/single_property_page/single_page_property.dart';

class HomePageText extends StatelessWidget {
  const HomePageText({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(
          width > 1200 ? width * 0.08 : 10,
          width > 1200
              ? 110
              : width > 800
                  ? 50
                  : width > 500
                      ? 30
                      : 10,
          0,
          0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            "You're Local Real Estate \nProfessionals",
            maxLines: 3,
            textAlign: TextAlign.start,
            // textScaleFactor: width/1600,
            minFontSize: 16,
            textScaleFactor: width < 500 ? 0.6 : 1,
            style: GoogleFonts.montserrat(
                fontSize: 60,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1c2d3a),
                wordSpacing: 3,
                letterSpacing: 1.68),
          ),
          const SizedBox(
            height: 30,
          ),
          AutoSizeText(
              softWrap: true,
              textScaleFactor: width < 500 ? 0.8 : 1,
              'Residences can be classified by and connected to residences. Different types of housing can be use \nsame physical type.',
              style: GoogleFonts.rubik(
                fontSize: 18,
                color: Colors.black,
              ),
              textAlign: TextAlign.start),
        ],
      ),
    );
  }
}

class PropertyTile extends StatefulWidget {
  final String inputImagePath;
  final String propertyType;
  final String propertyStatus;
  final String price;
  final List<String> values;
  final PropertyDetails propertyDetails;

  const PropertyTile(
      {super.key,
      required this.inputImagePath,
      required this.propertyType,
      required this.propertyStatus,
      required this.price,
      required this.values,
      required this.propertyDetails});

  @override
  State<PropertyTile> createState() => _PropertyTileState();
}

class _PropertyTileState extends State<PropertyTile> {
  bool _isHover = false;

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("building PropertyTile ------------>");
    return InkWell(
      onHover: (value) {
        if (value) {
          setState(() {
            _isHover = true;
          });
        } else {
          setState(() {
            _isHover = false;
          });
        }
      },
      onTap: () {
        // getSinglePageProperty(propertyId: widget.propertyDetails.id);
        GoRouter.of(context)
            .goNamed("singleProperty", pathParameters: {'propertyId': widget.propertyDetails.id});
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Container(
          height: 350,
          width: 380,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.inputImagePath),
              //AssetImage(widget.inputImagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  width: 100,
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                  ),
                  child: Center(
                    child: Text(
                      widget.propertyType,
                      style:
                          GoogleFonts.rubik(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  transform: Matrix4.translationValues(
                      0.0, _isHover ? 0.0 : 110.0, 0.0),
                  child: onHoverStrip(
                      values: widget.values,
                      price: widget.price,
                      propertyStatus: widget
                          .propertyStatus), // Adjust the 50.0 for distance
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class onHoverStrip extends StatelessWidget {
  // static List<String> values = [];

  onHoverStrip(
      {Key? key,
      required this.values,
      required this.price,
      required this.propertyStatus})
      : super(key: key);
  List<Widget> items = [];
  List<Color> colors = [
    Colors.white12,
    Colors.white30,
    Colors.white60,
    Colors.white70,
  ];
  List<String> text1 = ["Beds", "Baths", "Carpet Area"];
  final List<String> values;
  final String price;
  final String propertyStatus;

  // List<String> text2 = values;

  List<Widget> getTiles() {
    for (int i = 0; i <= 2; i++) {
      items.add(onHoverSingleTile(
          color: colors[i], text1: text1[i], text2: values[i]));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              propertyStatus,
              style: GoogleFonts.rubik(fontSize: 20, color: Colors.white70),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Price: $price",
              style: GoogleFonts.rubik(fontSize: 20, color: Colors.white70),
            ),
          ),
          Row(children: getTiles()),
        ],
      ),
    );
  }
}

class onHoverSingleTile extends StatelessWidget {
  final color;
  final text1;
  final text2;

  onHoverSingleTile({Key? key, this.color, this.text1, this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(color: color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text1,
              style: GoogleFonts.rubik(color: Colors.white, fontSize: 17),
            ),
            Text(
              text2,
              style: GoogleFonts.rubik(color: Colors.white, fontSize: 17),
            )
          ],
        ),
      ),
    );
  }
}

class CustomTextStyle extends StatelessWidget {
  final FontWeight fontWeight;
  final double size;
  final String title;
  final color;

  const CustomTextStyle(
      {Key? key,
      required this.title,
      this.size = 15.0,
      this.fontWeight = FontWeight.normal,
      this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.rubik(
          fontSize: size, fontWeight: fontWeight, color: color),
    );
  }
}
