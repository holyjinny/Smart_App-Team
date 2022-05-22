import 'package:flutter/material.dart';
import 'package:smart_jtj/config/size_config.dart';
import 'components/body.dart';

class ChartScreen extends StatelessWidget {
  static String routeName = '/chart-screen';

  const ChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '분류 현황',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Body(),
    );
  }
}