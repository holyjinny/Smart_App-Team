import 'package:flutter/material.dart';
import 'package:smart_jtj/config/size_config.dart';
import 'package:smart_jtj/src/screens/conveyor_screen/conveyor_screen.dart';

class ConveyerContainer extends StatelessWidget {
  const ConveyerContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ConveyorScreen.routeName);
      },
      child: Stack(
        children: [
          Container(
            height: getProportionateScreenHeight(100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFFEFEEEE),
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.8),
                  offset: Offset(-6.0, -6.0),
                  blurRadius: 16.0,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(6.0, 6.0),
                  blurRadius: 16.0,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenHeight(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(90),
                  ),
                  Text(
                    'Control\nConveyor',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Image.asset(
                  //   'assets/images/jtj_logo.png',
                  //   height: getProportionateScreenHeight(70),
                  //   width: getProportionateScreenWidth(70),
                  //   fit: BoxFit.contain,
                  // ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 30,
            ),
            child: Image.asset(
              'assets/images/joystick.png',
              height: getProportionateScreenHeight(100),
              width: getProportionateScreenWidth(100),
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
