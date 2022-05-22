import 'package:flutter/material.dart';
import 'package:smart_jtj/config/size_config.dart';
import 'components/body.dart';

class ConveyorScreen extends StatelessWidget {
  static String routeName = '/conveyor-screen';

  const ConveyorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}
