import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:the_asset_zone_web/constants/controllers.dart';
import 'package:the_asset_zone_web/controllers/nav_bar_controller.dart';
import 'package:the_asset_zone_web/screens/login/auth_dialog.dart';
import '../../../constants/constants.dart';


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
  final text;

  MyMenuButton({Key? key, required this.text}) : super(key: key);

  final _navigationBarController = Get.put(NavBarController());

  @override
  bool onHover = false;

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

class SimpleMenuBar extends StatelessWidget {
  SimpleMenuBar({Key? key}) : super(key: key);

  List<Widget> getMenuList(menuSelectedMap) {
    List<Widget> menuWidgets = [];
    menuSelectedMap.forEach((key, value) {
      menuWidgets.add(MyMenuButton(text: key));
    });
    return menuWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
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
                )),
            const SizedBox(width: 20),
            Expanded(
              flex: 4,
              child: IconButton(
                onPressed: () => showDialog(
                    context: context, builder: (context) => const AuthDialog()),
                icon: const Icon(
                  size: 45,
                  Icons.person_outline_rounded,
                  color: kPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
