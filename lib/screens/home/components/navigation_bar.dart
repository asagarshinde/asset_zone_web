import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:the_asset_zone_web/constants/controllers.dart';
import 'package:the_asset_zone_web/controllers/nav_bar_controller.dart';
import 'package:the_asset_zone_web/screens/login/auth_dialog.dart';
import '../../../constants/constants.dart';

class AppBarDropDownButton extends StatefulWidget {
  final List<String> itemString;

  const AppBarDropDownButton({Key? key, required this.itemString})
      : super(key: key);

  @override
  State<AppBarDropDownButton> createState() => _AppBarDropDownButtonState();
}

class _AppBarDropDownButtonState extends State<AppBarDropDownButton> {
  // List<String> itemStrings = ["HOME", "1", "2", "3"];

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        isDense: true,
        isExpanded: false,
        value: widget.itemString[0],
        items: widget.itemString.map(
          (String item) {
            return DropdownMenuItem(
              alignment: Alignment.centerLeft,
              value: item,
              child: Text(item, style: kTextDefaultStyle),
            );
          },
        ).toList(),
        onChanged: (selectedValue) {
          setState(
            () {
              selectedValue = selectedValue.toString();
              print(selectedValue);
            },
          );
        },
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  getDrawerItems() {
    List<Widget> myMenuItems = [];
    menus.forEach(
      (key, value) {
        myMenuItems.add(
          AppBarDropDownButton(
            itemString: [key.toUpperCase(), ...value],
          ),
        );
        myMenuItems.add(
          const SizedBox(
            height: 10,
          ),
        );
      },
    );
    return myMenuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              child: Text(
            "The Assets Zone",
            style: Theme.of(context).textTheme.headline6,
          )),
          ...getDrawerItems()
        ],
      ),
    );
  }
}

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
