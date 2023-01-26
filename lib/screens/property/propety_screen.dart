import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
import 'package:the_asset_zone_web/footer_section/footer_page.dart';
import 'package:the_asset_zone_web/responsive.dart';
import 'package:the_asset_zone_web/screens/home/components/navigation_bar.dart';
import 'components/advance_search_vertical_panel.dart';
import 'components/property_card_grid_view.dart';

class PropertyScreen extends StatelessWidget {
  PropertyScreen({Key? key}) : super(key: key);
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 70),
              child: SimpleMenuBar(),
            )
          : AppBar(backgroundColor: kPrimaryColor),
      drawer: const MyDrawer(),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        controller: scrollController,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 20),
                Stack(
                  children: [
                    if (Responsive.isDesktop( context) || Responsive.isTablet(context))
                    SizedBox(
                      width: double.infinity,
                      height: 800,
                      child: Image.asset(
                        'assets/inner-background.jpg',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    if (Responsive.isMobile(context))
                      SizedBox(
                        width: double.infinity,
                        height: 400,
                        child: Image.asset(
                          'assets/inner-background.jpg',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 80),
                if (Responsive.isDesktop(context) ||
                    Responsive.isTablet(context))
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(flex: 2, child: AdvanceSearchVerticalPanel()),
                      Expanded(flex: 5, child: PropertyCardGridView()),
                    ],
                  ),
                if (Responsive.isMobile(context))
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Center(child: AdvanceSearchVerticalPanel()),
                      PropertyCardGridView(),
                    ],
                  ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const FooterPage()),
          )
        ],
      ),
    );
  }
}
