import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
import 'package:the_asset_zone_web/controllers/auth_controller.dart';
import 'package:the_asset_zone_web/footer_section/footer_page.dart';
import 'package:the_asset_zone_web/responsive.dart';
import 'package:the_asset_zone_web/screens/home/components/navigation_bar.dart';
import 'components/advance_search_vertical_panel.dart';
import 'components/property_card_grid_view_stateless.dart';

class PropertyScreen extends StatelessWidget {
  PropertyScreen({super.key, required this.isQueried});
  final ScrollController scrollController = ScrollController();
  final AuthController authController = AuthController();
  final bool isQueried ;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: Responsive.isDesktop(context)
            ? PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 70),
                child: const SimpleMenuBar(),
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
                        height: 500,
                        child: Image.asset(
                          'assets/inner-background.jpg',
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
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
                      children: [
                        const Expanded(flex: 2, child: SizedBox()),
                        const Expanded(flex: 2, child: AdvanceSearchVerticalPanel()),
                        Expanded(flex: 6, child: PropertyCardGridViewStateless(isQueried: isQueried)),
                        const Expanded(flex: 2, child: SizedBox()),
                      ],
                    ),
                  if (Responsive.isMobile(context))
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Center(child: AdvanceSearchVerticalPanel()),
                        // PropertyCardGridView(),
                        PropertyCardGridViewStateless(isQueried: isQueried),
                      ],
                    ),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 50,),
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
