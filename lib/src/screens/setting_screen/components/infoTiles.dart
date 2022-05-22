import 'package:flutter/material.dart';
import 'package:smart_jtj/src/screens/setting_screen/components/userTiles.dart';

Widget infoTiles() {
  return Column(
    children: [
      infoTile(
        Icons.info_outline,
        'FAQ',
      ),
      infoTile(
        Icons.border_color_outlined,
        '메모',
      ),
      infoTile(
        Icons.textsms_outlined,
        '커뮤니티',
      ),
    ],
  );
}

Widget infoTile(IconData icon, String text) {
  return colorTile(
    icon,
    Colors.black,
    text,
    blackAndWhite: true,
  );
}
