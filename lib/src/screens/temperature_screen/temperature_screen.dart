import 'package:smart_jtj/config/size_config.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class TemperatureScreen extends StatelessWidget {
  static String routeName = '/temperature-screen';
  const TemperatureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}