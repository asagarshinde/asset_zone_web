import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_asset_zone_web/controllers/properties_controller.dart';

import '../home_screen.dart';

class PropertiesForCardsView extends StatefulWidget {
  final double width;

  final String propertiesFor;
  final bool showDescription;
  final int limit;
  const PropertiesForCardsView(
      {Key? key, required this.width, required this.propertiesFor, this.showDescription = true, int this.limit = 3})
      : super(key: key);

  @override
  State<PropertiesForCardsView> createState() => _PropertiesForCardsViewState();
}

class _PropertiesForCardsViewState extends State<PropertiesForCardsView> {
  Future<List<Widget>?> getData() async {
    PropertiesList propertiesList = PropertiesList();
    List<Widget>? pl = await propertiesList.propertyList(widget.propertiesFor, limit: widget.limit);
    // await Future.delayed(Duration(seconds: 5));
    return pl;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List?>(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Widget> data = snapshot.data! as List<Widget>;
          return Padding(
            padding: EdgeInsets.fromLTRB(
                widget.width > 1200 ? widget.width * 0.085 : 10, 0, 0, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 if (widget.showDescription) ...propertiesForText(
                    width: widget.width,
                    heading: "Properties ${widget.propertiesFor}",
                    subheading:
                        "Elegant retreat in Coral Gables setting. This home provides entertaining spaces with kitchen opening"),
                const SizedBox(height: 20),
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.center,
                  children: data,
                ),
                const SizedBox(height: 50)
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class PaddedTextHeading extends StatelessWidget {
  const PaddedTextHeading(
      {Key? key,
      required this.width,
      required this.text,
      this.fontSize = 30,
      required this.font,
      this.fontWeight = FontWeight.w100})
      : super(key: key);

  final double width;
  final String text;
  final String font;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: TextStyle(
          fontFamily: font,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: const Color(0xFF586167)),
    );
  }
}

propertiesForText({heading, subheading, width}) {
  return [
    PaddedTextHeading(
        font: GoogleFonts.montserrat().toString(),
        fontWeight: FontWeight.w700,
        width: width,
        text: heading),
    PaddedTextHeading(
        font: GoogleFonts.roboto().toString(),
        width: width,
        text: subheading,
        fontSize: 19),
  ];
}
