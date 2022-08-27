import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
import 'package:the_asset_zone_web/controllers/home_page_card_controller.dart';
import '../../../widgets/helper_widgets.dart';

class HomePageText extends StatelessWidget {
  const HomePageText({Key? key}) : super(key: key);

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
              style: GoogleFonts.rubik(fontSize: 18, color: Colors.black, ),
              textAlign: TextAlign.start),
        ],
      ),
    );
  }
}


class propertyTile extends StatefulWidget {
  final String inputImagePath;

  propertyTile({Key? key, required this.inputImagePath}) : super(key: key);

  @override
  State<propertyTile> createState() => _propertyTileState();
}

class _propertyTileState extends State<propertyTile> {
  bool _isHover = false;

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
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
        print("Clicked on property card");
      },
      child: Center(
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: Container(
            height: 350,
            width: 380,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.inputImagePath),
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
                    width: 80,
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                    ),
                    child: Center(
                      child: Text(
                        "Rent",
                        style:
                            GoogleFonts.rubik(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Govind Nagar",
                              style: GoogleFonts.rubik(
                                  fontSize: 25, color: Colors.white70),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                            child: Text(
                              "₹13,000/month",
                              style: GoogleFonts.rubik(
                                  fontSize: 15, color: Colors.white70),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                        child: MyButton(title: "Details"),
                      ),
                    ],
                  ),
                  if (_isHover)
                    AnimatedOpacity(
                        opacity: _isHover ? 1 : 0,
                        duration: Duration(milliseconds: _isHover ? 1000 : 100),
                        child: onHoverStrip())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class onHoverStrip extends StatelessWidget {
  onHoverStrip({Key? key}) : super(key: key);
  List<Widget> items = [];
  List<Color> colors = [
    Colors.black38,
    Colors.black45,
    Colors.black54,
    Colors.black87
  ];
  List<String> text1 = ["Beds", "Baths", "Carpet Area"];
  List<String> text2 = ["1", "2", "1000m2"];

  List<Widget> getTiles() {
    for (int i = 0; i <= 2; i++) {
      items.add(onHoverSingleTile(
          color: colors[i], text1: text1[i], text2: text2[i]));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Row(children: getTiles()),
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