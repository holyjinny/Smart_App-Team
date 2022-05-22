import 'package:flutter/material.dart';
import 'package:smart_jtj/config/size_config.dart';
import 'package:flutter_svg/svg.dart';

class MenuListItems extends StatelessWidget {
  final String iconPath;
  final String itemName;
  final VoidCallback function;

  const MenuListItems({
    Key? key,
    required this.iconPath,
    required this.itemName,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 20,
            ),
            SizedBox(
              width: getProportionateScreenWidth(25),
            ),
            Text(
              itemName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
