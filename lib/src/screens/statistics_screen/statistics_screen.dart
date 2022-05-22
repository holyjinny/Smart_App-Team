import 'package:flutter/material.dart';
import 'package:smart_jtj/config/size_config.dart';

class EtcScreen extends StatelessWidget {

  const EtcScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(7),
          vertical: getProportionateScreenHeight(7),
        ),
        decoration: const BoxDecoration(
          color: Color(0xFFF2F2F2),
        ),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(
              getProportionateScreenHeight(5),
            ),
            child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
