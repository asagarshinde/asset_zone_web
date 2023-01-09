import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:the_asset_zone_web/constants/theme_data.dart';
import 'package:the_asset_zone_web/footer_section/footer_page.dart';
import 'package:the_asset_zone_web/review/find_property.dart';
import 'package:the_asset_zone_web/review/looking_to_buy_new_property.dart';
import 'package:the_asset_zone_web/review/review_page.dart';
import 'package:the_asset_zone_web/review/what_are_you_looking_for.dart';
import 'package:the_asset_zone_web/screens/city/city_screen.dart';

//import 'package:the_asset_zone_web/screens/home/review/what_are_you_looking_for.dart';
import 'package:the_asset_zone_web/screens/home/home_screen.dart';
import 'package:the_asset_zone_web/screens/project/project_screen.dart';
import 'package:the_asset_zone_web/screens/property/property_screen.dart';
import 'package:the_asset_zone_web/screens/services/services_screen.dart';
import 'package:the_asset_zone_web/screens/single_property_page/components/right_side_controller_container.dart';
import 'package:the_asset_zone_web/screens/single_property_page/components/single_page_prperty_middle_location_container.dart';
import 'package:the_asset_zone_web/screens/single_property_page/single_page_property.dart';
import 'package:go_router/go_router.dart';
import 'package:the_asset_zone_web/screens/test_screen/form_add_firebase.dart';

//import 'package:the_asset_zone_web/search_page.dart';
import 'package:the_asset_zone_web/text.dart';

import 'controllers/home_page_card_controller.dart';
import 'screens/test_screen/test_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
        apiKey: "AIzaSyBxh2B6H7ynAbIOCsHcqPndPN1e2ADRqfs",
        authDomain: "assets-zone.firebaseapp.com",
        projectId: "assets-zone",
        storageBucket: "assets-zone.appspot.com",
        messagingSenderId: "1001122158865",
        appId: "1:1001122158865:web:e458ae8a32388d4b2d54b0"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      title: 'The Assets Zone',
      theme: themeData,
      //home: LookingToBuyNewProperty(),
      // home: const HomeScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

final _router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen(title: "The Asset Zone");
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen(title: "The Asset Zone");
      },
    ),
    GoRoute(
      path: '/property',
      builder: (BuildContext context, GoRouterState state) {
        return const PropertyScreen();
      },
    ),
    GoRoute(
      path: '/project',
      builder: (BuildContext context, GoRouterState state) {
        return const ProjectScreen();
      },
    ),
    GoRoute(
      path: '/services',
      builder: (BuildContext context, GoRouterState state) {
        return const ServicesScreen();
      },
    ),
    GoRoute(
      path: '/city',
      builder: (BuildContext context, GoRouterState state) {
        return const CityScreen();
      },
    ),
  ],
);
