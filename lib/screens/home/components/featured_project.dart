import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_asset_zone_web/responsive.dart';
import 'package:the_asset_zone_web/screens/home/components/home_screen_widgets.dart';
import '../../../constants/constants.dart';

class FeatureProjectLayer2 extends StatelessWidget {
  const FeatureProjectLayer2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black.withOpacity(0),
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: SizedBox(
        child: Image.asset(
          'assets/3.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class FeaturedProjectDescriptionTile extends StatelessWidget {
  final String cityName;
  final String projectType;
  final String projectDescription;

  const FeaturedProjectDescriptionTile({
    Key? key,
    required this.cityName,
    required this.projectType,
    required this.projectDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (builder, constraints) {
      final width = constraints.maxWidth;
      return Padding(
        padding: EdgeInsets.only(left: width < 900 ? 25 : 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 32.0, 0, 4),
              child: AutoSizeText(
                cityName.toUpperCase(),
                minFontSize: 10,
                textAlign: TextAlign.start,
                style:
                    GoogleFonts.rubik(letterSpacing: 4, color: Colors.black38),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 12, 4),
                    child: AutoSizeText(
                      "Merric in spring way",
                      minFontSize: 15,
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.rubik(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kSecondaryColor),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2.0),
                      child: AutoSizeText(
                        projectType.toUpperCase(),
                        style: GoogleFonts.rubik(
                            fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 2, 12, 4),
              child: AutoSizeText(
                "\u{20B9}5000000.00*",
                style: GoogleFonts.rubik(fontSize: 20, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 2, 12, 4),
              child: AutoSizeText(
                maxLines: 4,
                projectDescription,
                style: GoogleFonts.rubik(
                    color: Colors.black38, fontSize: 16, height: 1.6),
              ),
            ),
            Row(
              children: [
                if (!Responsive.isMobile(context))
                  const Expanded(
                    child: Icon(
                      Icons.bed_rounded,
                      color: Colors.black,
                    ),
                  ),
                Expanded(
                    child: AutoSizeText(
                  "Bed: 5",
                  maxLines: 2,
                  minFontSize: 5,
                  style: GoogleFonts.rubik(fontSize: 13),
                )),
                if (!Responsive.isMobile(context))
                  const SizedBox(
                    height: 12,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Colors.black38,
                    ),
                  ),
                if (!Responsive.isMobile(context))
                  const Expanded(
                    child: Icon(
                      Icons.bathtub_rounded,
                      color: Colors.black,
                    ),
                  ),
                Expanded(
                    child: AutoSizeText(
                  "Baths: 3",
                  minFontSize: 5,
                  style: GoogleFonts.rubik(fontSize: 13),
                )),
                if (!Responsive.isMobile(context))
                  const SizedBox(
                    height: 12,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Colors.black38,
                    ),
                  ),
                if (!Responsive.isMobile(context))
                  const Expanded(
                    child: Icon(
                      Icons.square_foot_outlined,
                      color: Colors.black,
                    ),
                  ),
                Expanded(
                    child: AutoSizeText(
                  "Sq. Foot: 5000",
                  minFontSize: 5,
                  style: GoogleFonts.rubik(fontSize: 13),
                )),
                if (!Responsive.isMobile(context)) Spacer()
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 15),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: kSecondaryColor, width: 2),
                    borderRadius: BorderRadius.circular(12.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  child: AutoSizeText(
                    "OPEN HOUSE",
                    style:
                        GoogleFonts.rubik(fontSize: 12, color: kSecondaryColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class FeaturedProjectDesktop extends StatelessWidget {
  const FeaturedProjectDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (builder, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        print(
            "FeaturedProjectLayer1 height : $height, width: $width, mheight : ${MediaQuery.of(context).size.height}");
        return Stack(
          // alignment: Alignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                'assets/banner-3.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: Center(
                    child: CustomTextStyle(
                      title: 'Featured Project',
                      fontWeight: FontWeight.bold,
                      size: 35,
                    ),
                  ),
                ),
                SizedBox(
                  width: 400,
                  child: Divider(
                    color: Colors.white,
                    thickness: 3,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 200,
              left: width / 3,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: const FeatureProjectLayer2()),
            ),
            Positioned(
              left: width / 12,
              top: height / 3,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: const Card(
                  color: Colors.white,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: FeaturedProjectDescriptionTile(
                    cityName: "nashik city",
                    projectType: "Open house",
                    projectDescription:
                        "Different types of housing can be use same physical type. connected \nresidences might be owned by a single entity or owned separately with an \naggrement covering the relationship between units and common areas \nand concerns",
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class FeaturedProjectTablet extends StatelessWidget {
  const FeaturedProjectTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (builder, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        print(
            "FeaturedProjectLayer1 height : $height, width: $width, mheight : ${MediaQuery.of(context).size.height}");
        return Stack(
          // alignment: Alignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/banner-3.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: Center(
                    child: CustomTextStyle(
                      title: 'Featured Project',
                      fontWeight: FontWeight.bold,
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: 400,
                  child: Divider(
                    color: Colors.white,
                    thickness: 3,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 250,
              left: (MediaQuery.of(context).size.width * 0.3) / 3,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: const FeatureProjectLayer2()),
            ),
            Positioned(
              left: (MediaQuery.of(context).size.width * 0.35) / 3,
              top: 500,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: const Card(
                  color: Colors.white,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: FeaturedProjectDescriptionTile(
                    cityName: "nashik city",
                    projectType: "Open house",
                    projectDescription:
                        "Different types of housing can be use same physical type. connected \nresidences might be owned by a single entity or owned separately with an \naggrement covering the relationship between units and common areas \nand concerns",
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class FeaturedProjectMobile extends StatelessWidget {
  const FeaturedProjectMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (builder, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        print(
            "FeaturedProjectLayer1 height : $height, width: $width, mheight : ${MediaQuery.of(context).size.height}");
        return Stack(
          // alignment: Alignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/banner-3.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Center(
                    child: CustomTextStyle(
                      title: 'Featured Project',
                      fontWeight: FontWeight.bold,
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Divider(
                    color: Colors.white,
                    thickness: 3,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 150,
              left: (MediaQuery.of(context).size.width * 0.05) / 2,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: const FeatureProjectLayer2()),
            ),
            Positioned(
              left: (MediaQuery.of(context).size.width * 0.1) / 2,
              top: width < 400 ? 350 : 400,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.90,
                child: const Card(
                  color: Colors.white,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: FeaturedProjectDescriptionTile(
                    cityName: "nashik city",
                    projectType: "Open house",
                    projectDescription:
                        "Different types of housing can be use same physical type. connected \nresidences might be owned by a single entity or owned separately with an \naggrement covering the relationship between units and common areas \nand concerns",
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget featuredProject({context, width}) {
  return Container(
    color: Colors.white70,
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: width < 500
        ? const FeaturedProjectMobile()
        : width < 900
            ? const FeaturedProjectTablet()
            : const FeaturedProjectDesktop(),
  );
}
