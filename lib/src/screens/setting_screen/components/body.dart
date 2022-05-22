import 'package:flutter/material.dart';
import 'package:smart_jtj/src/screens/setting_screen/components/logoutTile.dart';
import 'infoTiles.dart';
import 'userTiles.dart';
import 'divider.dart';
import 'topTile.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFFFF),
      child: ListView(
        padding: EdgeInsets.all(12),
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            height: 35,
          ),
          topTile(),
          divider(),
          userTiles(),
          divider(),
          infoTiles(),
          divider(),
          logoutTile(),
        ],
      ),
    );
  }
}
