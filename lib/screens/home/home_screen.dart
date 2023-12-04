import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
import 'package:the_asset_zone_web/constants/controllers.dart';
import 'package:the_asset_zone_web/footer_section/footer_page.dart';
import 'package:the_asset_zone_web/review/developer_work_with_us.dart';
import 'package:the_asset_zone_web/review/looking_to_buy_new_property.dart';
import 'package:the_asset_zone_web/screens/home/components/featured_project.dart';
import 'package:the_asset_zone_web/screens/home/components/home_screen_widgets.dart';
import 'package:the_asset_zone_web/screens/home/components/navigation_bar.dart';
import 'package:the_asset_zone_web/screens/home/components/properties_for_rent_cards.dart';
import 'package:the_asset_zone_web/screens/home/components/property_search_desktop_view.dart';
import 'package:the_asset_zone_web/screens/home/components/property_search_mobile_view.dart';
import 'package:the_asset_zone_web/screens/home/components/property_search_tablet_view.dart';
import '../../models/property_detail_model.dart';
import '../../responsive.dart';
import '../../widgets/helper_widgets.dart';
import 'package:the_asset_zone_web/constants/controllers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required String title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String title = 'The Assets Zone';
  List<PropertyDetails> lstPropDetails = <PropertyDetails>[];

  @override
  void initState() {
    super.initState();
  }

  Future<bool?> isAuthenticate() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getBool("auth");
}
  @override
  Widget build(BuildContext context) {

    // TODO: remove after work done
    print("is user authenticated ${authController.isAuthenticated}");
    isAuthenticate().then((value) => print("from shared preferences $value"));
    final width = MediaQuery.of(context).size.width;
    return SelectionArea(
      child: Scaffold(
        appBar: Responsive.isDesktop(context)
            ? PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 70),
                child: SimpleMenuBar(),
              )
            : AppBar(
                backgroundColor: kPrimaryColor,
              ),
        drawer: const MySimpleDrawer(),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        // when row not starting with start of axis then use expanded.
                        child: Stack(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 1000,
                              child: Image.asset(
                                'assets/building.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const HomePageText(),
                                HomePageSecondSection(
                                    width: width, constraints: constraints),
                                PropertiesForCardsView(key: searchPanelController.forRentScroll,
                                    width: width, propertiesFor: "rent"),
                                PropertiesForCardsView(key: searchPanelController.forBuyScroll,
                                    width: width, propertiesFor: "sale"),
                                featuredProject(context: context, width: width),
                                const SizedBox(height: 50),
                                const DeveloperWorkWithUs(),
                                const SizedBox(height: 50),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    child: const LookingToBuyNewProperty())
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: width, child: const FooterPage()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class HomePageSecondSection extends StatelessWidget {
  const HomePageSecondSection(
      {Key? key, required this.width, required this.constraints})
      : super(key: key);

  final double width;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(width > 1200 ? width * 0.08 : 10, 0, 0, 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 45, 8, 8),
                child: MyButton(title: "For Rent", onTap: () { Scrollable.ensureVisible(searchPanelController.forRentScroll.currentContext!);},),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 45, 8, 8),
                child: MyButton(title: "For Buy", onTap: () { Scrollable.ensureVisible(searchPanelController.forBuyScroll.currentContext!);}),
              ),
            ],
          ),
          const SizedBox(height: 40),
          width < 700
              ? PropertySearchMobileView()
              : width < 950
                  ? const PropertySearchTabletView()
                  : const PropertySearchPanel(),
          SizedBox(
            height: constraints.maxWidth < 900 ? 50 : 250,
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
