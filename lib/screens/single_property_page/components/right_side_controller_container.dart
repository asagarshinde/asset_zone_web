import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_asset_zone_web/screens/home/components/property_search_mobile_view.dart';
import 'package:the_asset_zone_web/widgets/helper_widgets.dart';

class RightSideControllerContainer extends StatelessWidget {
  const RightSideControllerContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(blurRadius: 8.0, color: Colors.black12)],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.only(right: 50, top: 10),
              child: Text(
                "Contact Info",
                style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                textAlign: TextAlign.right,
              ),
            ),
            Row(
              children: [
                const CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStp3rqrXNW3bha_MHg5OcCnst_boF_rN-k1nu-nZg&s"),
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Jonathan Scott",
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      textAlign: TextAlign.right,
                    ),
                    AutoSizeText(
                      "Contact@gmail.com",
                      maxLines: 2,
                      softWrap: true,
                      minFontSize: 10,
                      maxFontSize: 12,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600, color: Colors.black),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ],
            ),
            const ListTile(
              title: AutoSizeText('A-32, Albany, Newyork.'),
              leading: Icon(Icons.location_on_outlined),
            ),
            const ListTile(
              title: AutoSizeText('(+066) 518 - 457 - 5181'),
              leading: Icon(Icons.wifi_calling),
            ),
            const Divider(
              color: Colors.grey,
            ),
            Text(
              "Request Exploration",
              style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              textAlign: TextAlign.right,
            ),
            Form(
                child: Column(
              children: [
                Container(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(
                        Icons.person,
                        color: Colors.deepOrangeAccent,
                      ),
                      hintText: 'Enter your full name',
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        color: Colors.deepOrangeAccent,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrangeAccent)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(
                        Icons.email,
                        color: Colors.deepOrangeAccent,
                      ),
                      hintText: 'Enter your Email',
                      labelText: 'Email ID',
                      labelStyle: TextStyle(
                        color: Colors.deepOrangeAccent,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrangeAccent)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(
                        Icons.phone,
                        color: Colors.deepOrangeAccent,
                      ),
                      hintText: 'Enter your Phone No.',
                      labelText: 'Phone No.',
                      labelStyle: TextStyle(
                        color: Colors.deepOrangeAccent,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrangeAccent)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(
                        Icons.message,
                        color: Colors.deepOrangeAccent,
                      ),
                      hintText: 'Message',
                      labelText: 'Message',
                      labelStyle: TextStyle(
                        color: Colors.deepOrangeAccent,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrangeAccent)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MyButton(
                  title: "Submit Request",
                  width: 200,
                  height: 40,
                )
              ],
            )),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.grey,
            ),
            Container(
              padding: EdgeInsets.only(right: 100),
              child: Text(
                "Filter",
                style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                textAlign: TextAlign.right,
              ),
            ),
            Container(
              child: PropertySearchMobileView(),
            ),
          ],
        ),
      ),
    );
  }
}
