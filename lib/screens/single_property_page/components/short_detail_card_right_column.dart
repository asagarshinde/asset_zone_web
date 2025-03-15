

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class rightColumn extends StatelessWidget {
  const rightColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          RatingBar.builder(
            itemSize: 20.0,
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          Container(
            child: Wrap(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  "\$20,45,472",
                  minFontSize: 10,
                  textScaleFactor: 0.8,
                  maxLines: 2,
                  style: GoogleFonts.montserrat(
                      color: const Color(0xFFff8c41),
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                AutoSizeText(
                  " / Start From ",
                  maxLines: 2,
                  style: GoogleFonts.montserrat(
                      fontSize: 5,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF878787)),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Wrap(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DottedBorder(
                radius: const Radius.circular(32.0),
                borderType: BorderType.RRect,
                padding: const EdgeInsets.all(4.0),
                child: const Text(
                  "WiFi",
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              DottedBorder(
                radius: const Radius.circular(32.0),
                borderType: BorderType.RRect,
                padding: const EdgeInsets.all(4.0),
                child: const Text(
                  "Swimming Pool",
                  textAlign: TextAlign.center,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
