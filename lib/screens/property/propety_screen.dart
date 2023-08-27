import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
import 'package:the_asset_zone_web/footer_section/footer_page.dart';
import 'package:the_asset_zone_web/responsive.dart';
import 'package:the_asset_zone_web/screens/home/components/navigation_bar.dart';
import 'components/advance_search_vertical_panel.dart';
import 'components/property_card_grid_view_stateless.dart';

class PropertyScreen extends StatelessWidget {
  PropertyScreen({Key? key}) : super(key: key);
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: Responsive.isDesktop(context)
            ? PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 70),
                child: SimpleMenuBar(),
              )
            : AppBar(backgroundColor: kPrimaryColor),
        drawer: const MySimpleDrawer(),
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
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 2, child: AdvanceSearchVerticalPanel()),
                        Expanded(flex: 5, child: PropertyCardGridViewStateless()),
                      ],
                    ),
                  if (Responsive.isMobile(context))
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(child: AdvanceSearchVerticalPanel()),
                        // PropertyCardGridView(),
                        PropertyCardGridViewStateless(),
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
      ),
    );
  }
}
