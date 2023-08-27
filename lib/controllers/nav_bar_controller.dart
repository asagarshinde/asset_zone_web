import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:the_asset_zone_web/screens/about_us/about_us_screen.dart';
import 'package:the_asset_zone_web/screens/add_property/form_add_firebase.dart';
import 'package:the_asset_zone_web/screens/city/city_screen.dart';
import 'package:the_asset_zone_web/screens/home/home_screen.dart';
import 'package:the_asset_zone_web/screens/project/project_screen.dart';
import 'package:the_asset_zone_web/screens/single_property_page/single_page_property.dart';
import 'package:the_asset_zone_web/screens/property/propety_screen.dart';
import 'package:the_asset_zone_web/screens/upload_property/upload_property_screen.dart';

class NavBarController extends GetxController {
  static NavBarController instance = Get.find();
  // reactive map is not working. when clicked on any menu color is not changing.
  // after converting the Map to RxMap it started working.
  // Ref:- https://stackoverflow.com/questions/68249333/flutter-getx-updating-item-in-children-list-is-not-reactive
  RxMap<String, bool> menuSelectedMap = {
    "home": true,
    "property": false,
    "about us": false,
    "city": false,
  }.obs;

  bool homeSelected = true;

  setSelectedMenu(menu) {
    menuSelectedMap.forEach(
      (key, value) {
        if (menu == key) {
          menuSelectedMap[key] = true;
        } else {
          menuSelectedMap[key] = false;
        }
      },
    );
    menuSelectedMap.refresh();
  }
}

GoRouter router = GoRouter(
  // debugLogDiagnostics: true,
  observers: [MyRouteObserver()],
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
        return PropertyScreen();
      },
    ),
    GoRoute(
      path: '/project',
      builder: (BuildContext context, GoRouterState state) {
        return const ProjectScreen();
      },
    ),
    GoRoute(
      path: '/aboutus',
      builder: (BuildContext context, GoRouterState state) {
        return const AboutUs();
      },
    ),
    GoRoute(
      path: '/city',
      builder: (BuildContext context, GoRouterState state) {
        // return const CityScreen();
        return FormAddFirebase();
      },
    ),
    GoRoute(
      path: '/singleproperty',
      builder: (BuildContext context, GoRouterState state) {
        print(state.extra);
        return SinglePagePropertyView(state.extra);
      },
    ),
  ],
);

class MyRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  // https://medium.flutterdevs.com/tracking-screen-transition-by-route-observer-flutter-dadd8773699c
  // without route observer when back button pressed last clicked menu remains selected.
  // e.g if i click on home --> city --> property and pressed back button screen moves to city but property remains highlighted.
  final _navigationBarController = Get.put(NavBarController());

  void _sendScreenView(PageRoute<dynamic> route) {
    var screenName = route.settings.name?.replaceAll("/", "");
    if (screenName == "aboutus") {
      screenName = "about us";
    } else if (screenName == "") {
      screenName = "home";
    }
    _navigationBarController.setSelectedMenu(screenName);
    // do something with it, ie. send it to your analytics service collector
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      _sendScreenView(route);
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      _sendScreenView(newRoute);
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute && route is PageRoute) {
      _sendScreenView(previousRoute);
    }
  }
}
