import 'package:flutter/material.dart';
import 'package:smart_jtj/controller/auth_controller.dart';
import 'package:smart_jtj/src/screens/menu_screen/components/list_title.dart';
import 'package:smart_jtj/src/screens/signup_screen/signup_screen.dart';

class MenuList extends StatelessWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuListItems(
          iconPath: 'assets/icons/menu_icons/stats.svg',
          itemName: 'Stats',
          function: ()=>{},
        ),
        MenuListItems(
          iconPath: 'assets/icons/menu_icons/stats.svg',
          itemName: 'Stats',
          function: ()=>{},
        ),
        MenuListItems(
          iconPath: 'assets/icons/menu_icons/stats.svg',
          itemName: 'Stats',
          function: ()=>{},
        ),
        MenuListItems(
          iconPath: 'assets/icons/menu_icons/stats.svg',
          itemName: 'Stats',
          function: ()=>{},
        ),
        MenuListItems(
          iconPath: 'assets/icons/menu_icons/logout_icon.svg',
          itemName: 'Stats',
          function: ()=>{},
        ),
        MenuListItems(
          iconPath: 'assets/icons/menu_icons/logout_icon.svg',
          itemName: 'Logout',
          function: () => {
            AuthController.instance.logOut(),
          },
        ),
      ],
    );
  }
}
