import 'package:flutter/material.dart';
import 'package:smart_jtj/config/size_config.dart';
import 'package:smart_jtj/src/screens/smart_light_screen/smart_light_screen.dart';
import 'package:smart_jtj/src/screens/temperature_screen/temperature_screen.dart';
import 'package:smart_jtj/view/home_screen_view_model.dart';

import 'conveyor_container.dart';
import 'dark_container.dart';

class Body extends StatelessWidget {
  final HomeScreenViewModel model;

  const Body({Key? key, required this.model}) : super(key: key);

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
            Padding(
              padding: EdgeInsets.all(
                getProportionateScreenHeight(5),
              ),
              child: const ConveyerContainer(),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(
                      getProportionateScreenHeight(5),
                    ),
                    child: DarkContainer(
                      itsOn: model.isLightOn,
                      switchButton: model.lightSwitch,
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(SmartLightScreen.routeName);
                      },
                      iconAsset: 'assets/icons/svg/light.svg',
                      device: 'Lightening',
                      deviceCount: '4 lamps',
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(
                      getProportionateScreenHeight(5),
                    ),
                    child: DarkContainer(
                      itsOn: model.isTempOn,
                      switchButton: model.tempSwitch,
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(TemperatureScreen.routeName);
                      },
                      iconAsset: 'assets/icons/svg/temperature.svg',
                      device: 'Temperature',
                      deviceCount: 'temp / humi',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
