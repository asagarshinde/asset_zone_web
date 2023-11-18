import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:the_asset_zone_web/constants/theme_data.dart';
import 'package:the_asset_zone_web/controllers/auth_controller.dart';
import 'package:the_asset_zone_web/controllers/properties_controller.dart';
import 'package:the_asset_zone_web/controllers/search_controller.dart';
import 'package:the_asset_zone_web/controllers/upload_form_controller.dart';
import 'constants/firebase.dart';
import 'controllers/nav_bar_controller.dart';
import 'controllers/single_page_property_controller.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
    Get.put(NavBarController());
    Get.put(PropertyController());
    Get.put(MySearchController());
    Get.put(SinglePagePropertyController());
    Get.put(UploadFormController());
    Get.put(AuthController());
  }
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
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'The Assets Zone',
      theme: themeData,
    );
  }
}
