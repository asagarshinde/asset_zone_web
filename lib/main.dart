import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_asset_zone_web/constants/theme_data.dart';
import 'package:the_asset_zone_web/controllers/auth_controller.dart';
import 'package:the_asset_zone_web/controllers/properties_controller.dart';
import 'package:the_asset_zone_web/controllers/search_controller.dart';
import 'package:the_asset_zone_web/controllers/upload_form_controller.dart';
import 'package:url_strategy/url_strategy.dart';
import 'constants/firebase.dart';
import 'controllers/nav_bar_controller.dart';
import 'controllers/single_page_property_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then(
    (value) async {
      Get.put(NavBarController());
      Get.put(PropertyController());
      Get.put(MySearchController());
      Get.put(SinglePagePropertyController());
      Get.put(UploadFormController());
      Get.put(AuthController());
      Get.put(MySearchController());
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('auth', false);
    },
  );
  /*
  To remove # from path in web we need to do below steps.
  flutter pub add url_strategy
  and add below line before runApp

  setPathUrlStrategy();
   */
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'The Assets Zone',
      theme: themeData,
    );
  }
}
