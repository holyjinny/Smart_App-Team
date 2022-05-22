import 'package:flutter/material.dart';

Widget userTiles() {
  return Column(
    children: [
      colorTile(
        Icons.person_outline,
        Colors.deepPurple,
        "개인 정보",
      ),
      colorTile(
        Icons.settings_outlined,
        Colors.blue,
        "설정",
      ),
      colorTile(
        Icons.credit_card,
        Colors.pink,
        "계좌",
      ),
      colorTile(
        Icons.favorite_border,
        Colors.amber,
        "즐겨 찾기",
      ),
    ],
  );
}

Widget colorTile(IconData icon, Color color, String text,
    {bool blackAndWhite = false}) {
  Color pickedColor = Color(0xFFF3F4F3);
  return ListTile(
    leading: Container(
      child: Icon(
        icon,
        color: color,
      ),
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: blackAndWhite ? pickedColor : color.withOpacity(0.09),
        borderRadius: BorderRadius.circular(18),
      ),
    ),
    title: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w500,
      ),
    ),
    trailing: Icon(
      Icons.arrow_forward_ios,
      color: Colors.black,
      size: 20,
    ),
  );
}
