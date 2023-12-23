import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
import 'package:the_asset_zone_web/constants/controllers.dart';
import 'package:the_asset_zone_web/controllers/auth_controller.dart';
import 'package:the_asset_zone_web/footer_section/footer_page.dart';
import 'package:the_asset_zone_web/responsive.dart';
import 'package:the_asset_zone_web/screens/home/components/navigation_bar.dart';

class AboutUs extends StatelessWidget {
  AboutUs({super.key});

  final ScrollController scrollController = ScrollController();
  final agents = [
    {
      "name": "Mayur Shinde",
      "email": "mayur@assetzone.com",
      "designation": "Marketing Executive",
      "image": "assets/agent_1.jpeg",
    },
    {
      "name": "Sagar Shinde",
      "email": "sagar@assetzone.com",
      "designation": "Civil Engineer",
      "image": "assets/agent_1.jpeg",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 70),
              child: const SimpleMenuBar(),
            )
          : AppBar(
              backgroundColor: kPrimaryColor,
            ),
      drawer: const MySimpleDrawer(),
      body: CustomScrollView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        controller: scrollController,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                if (Responsive.isDesktop( context) || Responsive.isTablet(context))
                  SizedBox(
                    width: double.infinity,
                    height: 500,
                    child: Image.asset(
                      'assets/about_us.jpg',
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                if (Responsive.isMobile(context))
                  SizedBox(
                    width: double.infinity,
                    height: 400,
                    child: Image.asset(
                      'assets/about_us.jpg',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                Wrap(alignment: WrapAlignment.center, spacing: 50, children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Center(
                      child: SelectableText(
                        "Meet our Agent",
                        style:
                            kTextHeader1Style.copyWith(color: kSecondaryColor),
                      ),
                    ),
                  ),
                  for (var agent in agents)
                    AgentCard(
                      agentInfo: agent,
                    )
                ]),
                const SizedBox(height: 50),
                const FooterPage()
                // const SliverToBoxAdapter(
                //   child: SizedBox(height: 50,),
                // ),
                // SliverToBoxAdapter(
                //   child: SizedBox(
                //       width: MediaQuery.of(context).size.width,
                //       child: const FooterPage()),
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AgentCard extends StatelessWidget {
  final Map agentInfo;

  const AgentCard({super.key, required this.agentInfo});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 300,
            height: 300,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                agentInfo["image"],
                fit: BoxFit.cover, // Adjust the fit as needed
              ),
            ),
          ),
        ),
        Card(
          elevation: 3.0,
          color: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          borderOnForeground: true,
          child: Container(
            color: Colors.white.withOpacity(0.1),
            height: 300,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectableText(
                    agentInfo["name"],
                    style: kTextHeader2Style.copyWith(
                        color: kSecondaryColor, fontSize: 23),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SelectableText(
                      agentInfo["designation"],
                      style: kTextHeader2Style,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.email_outlined),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SelectableText(
                          agentInfo["email"],
                          style: kTextDefaultStyle,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
