import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterPage extends StatelessWidget {
  const FooterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            // width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height * 0.93,
            padding: EdgeInsets.fromLTRB(50, 80, 0, 0),
            color: Color.fromRGBO(28, 45, 58, 1),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AutoSizeText("The Assets Zone",style: TextStyle(fontSize: 30,color: Colors.white, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      AutoSizeText("This home provides entertaining spaces with a kitchen opening...",
                        softWrap: true,textScaleFactor: 0.8,
                        minFontSize: 12,
                        maxLines: 3,
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(255, 255, 255, 0.7)),),
                      SizedBox(height: 10,),
                      SizedBox(
                        width: 300,
                        child: ListTile(
                          leading: Icon(Icons.location_on_outlined,color: Colors.white,),
                          title: Text("A-32, Albany, Newyork.",style: TextStyle(fontSize: 20,color: Colors.white),),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: ListTile(
                          leading: Icon(Icons.phone,color: Colors.white,),
                          title: Text("(+066) 518 - 457 - 5181",style: TextStyle(fontSize: 20,color: Colors.white),),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: ListTile(
                          leading: Icon(Icons.mail,color: Colors.white,),
                          title: Text("Contact@gmail.com",style: TextStyle(fontSize: 20,color: Colors.white),),
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     Container(
                      //       child: Text("This home provides entertaining spaces with a kitchen opening...",
                      //         style: GoogleFonts.montserrat(
                      //             fontSize: 18,
                      //             fontWeight: FontWeight.w500,
                      //             color: Color.fromRGBO(255, 255, 255, 0.7)),),
                      //     ),
                      //
                      //   ],
                      // )
                    ],
                  ),
                ),
              ],
            ),
          ),
          //SizedBox(height: 200,),
          Container(
            padding: EdgeInsets.fromLTRB(50,0, 0, 0),
            color: Colors.black,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.facebook,color: Color.fromRGBO(210, 210, 210,1),),
                ),
                SizedBox(width: 10,),
                IconButton(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.instagram,color: Color.fromRGBO(210, 210, 210,1),),
                ),
                SizedBox(width: 10,),
                IconButton(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.twitter,color: Color.fromRGBO(210, 210, 210,1),),
                ),
                SizedBox(width: 10,),
                IconButton(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.google,color: Color.fromRGBO(210, 210, 210,1),),
                ),
              ],
            ),
          ),
        ],
    );
  }
}
