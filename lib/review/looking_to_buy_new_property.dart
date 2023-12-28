import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
import 'package:the_asset_zone_web/constants/controllers.dart';
import 'package:the_asset_zone_web/widgets/helper_widgets.dart';

class LookingToBuyNewProperty extends StatefulWidget {
  const LookingToBuyNewProperty({super.key});

  @override
  State<LookingToBuyNewProperty> createState() =>
      _LookingToBuyNewPropertyState();
}

class _LookingToBuyNewPropertyState extends State<LookingToBuyNewProperty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            // height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/image.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  height: 40,
                  width: 250,
                  decoration: BoxDecoration(
                    //border: Border.all(color: Colors.black, width: 4),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: kSecondaryColor,
                      ),
                    ],
                  ),
                  child: const Center(
                      child: Text("Buy Or Sell",
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 30,
                              fontWeight: FontWeight.w500))),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 400,
                width: 800,
                color: Colors.white.withOpacity(0.2),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  verticalDirection: VerticalDirection.down,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                      child: Center(
                        child: AutoSizeText(
                          "T H E  |  A S S E T S  |  Z O N E  |  R E A L E  |  S T A T E",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(255, 255, 255, 1)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: AutoSizeText(
                        "Looking To Buy A New Property Or Sell An ",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(255, 255, 255, 1)),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: AutoSizeText(
                        "Existing One? The Asset Zone Provides An Easy",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: Colors
                                .white), //const Color.fromRGBO(255, 255, 255, 1)
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: AutoSizeText(
                        "Solution!",
                        style: GoogleFonts.montserrat(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(255, 255, 255, 1)),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 50,
                      runSpacing: 20,
                      children: [
                        MyButton(
                          title: "Submit Property",
                          width: 200,
                          onTap: () {
                            if (authController.isAuthenticatedShared.value) {
                              GoRouter.of(context).go(
                                '/propertyadd',
                              );
                            } else {
                              debugPrint("Please login first");
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const AlertDialog(
                                    title: Text("Please login first."),
                                  );
                                },
                              );
                            }
                          },
                        ),
                        MyButton(
                          title: "Browse Property",
                          width: 200,
                          onTap: () {
                            GoRouter.of(context).go(
                              '/property',
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
