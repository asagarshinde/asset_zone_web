import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/screens/login/auth_dialog.dart';
import '../../../constants/constants.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  List<Widget> getMenuItems() {
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
            width: 20,
          ),
        );
      },
    );
    return myMenuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Container(
        height: 70,
        decoration: const BoxDecoration(color: kAppBarPrimaryColor),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0,0),
                child: Text(
                  "The Asset Zone",
                  style: kMenuItemStyle.copyWith(
                      fontWeight: FontWeight.w400, fontSize: 20),
                ),
              ),
            ),
            // SizedBox(width: 30,),
            // Spacer(),
            Expanded(
              flex: 5,
              child: Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: getMenuItems(),
                )
              ),
            ),
            // const SizedBox(width: 20),
            // Spacer(),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () => showDialog(
                    context: context, builder: (context) => const AuthDialog()),
                icon: Icon(
                  size: 45,
                  Icons.person_outline_rounded,
                  color: kIconColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarDropDownButton extends StatefulWidget {
  List<String> itemString = [];

  AppBarDropDownButton({Key? key, required List<String> this.itemString})
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
    return Container(
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isDense: true,
          isExpanded: false,
          value: widget.itemString[0],
          items: widget.itemString.map(
            (String item) {
              return DropdownMenuItem(
                alignment: Alignment.centerLeft,
                value: item,
                child: Text(item, style: kMenuItemStyle),
              );
            },
          ).toList(),
          onChanged: (selectedValue) {
            setState(
              () {
                selectedValue = selectedValue.toString();
              },
            );
          },
        ),
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
