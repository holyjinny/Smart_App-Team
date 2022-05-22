import 'package:flutter/material.dart';
import 'package:smart_jtj/controller/auth_controller.dart';
import 'package:smart_jtj/src/screens/setting_screen/components/userTiles.dart';

Widget logoutTile() {
  return GestureDetector(
    onTap: () {
      AuthController.instance.logOut();
    },
    child: Column(
      children: [
        colorTile(
          Icons.logout_outlined,
          Colors.redAccent,
          "로그아웃",
        ),
      ],
    ),
  );
}
