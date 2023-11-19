import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_asset_zone_web/constants/controllers.dart';
import 'package:the_asset_zone_web/controllers/nav_bar_controller.dart';
import 'package:the_asset_zone_web/screens/login/auth_dialog.dart';
import 'package:the_asset_zone_web/constants/constants.dart';

class MySimpleDrawer extends StatelessWidget {
  const MySimpleDrawer({Key? key}) : super(key: key);

  List<Widget> getMenuList(menuSelectedMap) {
    List<Widget> menuWidgets = [];
    menuSelectedMap.forEach(
      (key, value) {
        menuWidgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: MyMenuButton(text: key),
          ),
        );
      },
    );
    return menuWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Container(
          color: kIconBackgroundColor,
          child: ListView(
            children: [
              DrawerHeader(
                child: Text(
                  "The Assets Zone",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              ...getMenuList(navBarController.menuSelectedMap)
            ],
          ),
        );
      },
    );
  }
}

//

class MyMenuButton extends StatelessWidget {
  final String text;

  MyMenuButton({super.key, required this.text});

  final _navigationBarController = Get.put(NavBarController());
  final bool onHover = false;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () {
            _navigationBarController.setSelectedMenu(text);
            GoRouter.of(context).go("/${text.replaceAll(' ', '')}");
          },
          highlightColor: Colors.deepOrangeAccent,
          child: Text(text,
              style: kTextDefaultStyle.copyWith(
                  color: _navigationBarController.menuSelectedMap[text]!
                      ? Colors.deepOrangeAccent
                      : Colors.black)),
        ),
      ),
    );
  }
}

class SimpleMenuBar extends StatefulWidget {
  const SimpleMenuBar({super.key});

  @override
  State<SimpleMenuBar> createState() => _SimpleMenuBarState();
}

class _SimpleMenuBarState extends State<SimpleMenuBar> {
  List<Widget> getMenuList(menuSelectedMap) {
    List<Widget> menuWidgets = [];
    menuSelectedMap.forEach(
      (key, value) {
        menuWidgets.add(
          MyMenuButton(text: key),
        );
      },
    );
    return menuWidgets;
  }

  @override
  initState(){
    super.initState();
    // authController.getAuthStatus();
  }

  Future<bool?> getAuthStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? authenticated = prefs.getBool("auth");
    return authenticated;
  }

  @override
  Widget build(BuildContext context) {
    getAuthStatus().then(
      (value) => {
        if (value != null && value == true)
          {
            print("********** from shared ${value} **********"),
            navBarController.authIcon.value = Icons.logout
          }
        else
          {navBarController.authIcon.value = Icons.person_outline_rounded}
      },
    );

    return Obx(
      () {
        return Container(
          decoration: const BoxDecoration(color: kAppBarPrimaryColor),
          height: 70,
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
                  child: Text(
                    "The Asset Zone",
                    style: kTextDefaultStyle.copyWith(
                        fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: getMenuList(navBarController.menuSelectedMap),
                ),
              ),
              const SizedBox(width: 20),
              if (navBarController.showPropertyAdd.value)
                Expanded(
                  flex: 2,
                  child: IconButton(
                    onPressed: () {
                      GoRouter.of(context).go("/propertyadd");
                    },
                    icon: const Icon(
                      size: 45,
                      Icons.add,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              Expanded(
                flex: 2,
                child: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => const SignInOutDialog());
                  },
                  icon: Icon(
                    size: 45,
                    navBarController.authIcon.value,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
