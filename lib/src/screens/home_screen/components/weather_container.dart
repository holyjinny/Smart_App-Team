import 'package:flutter/material.dart';
import 'package:smart_jtj/config/size_config.dart';
import 'package:smart_jtj/src/screens/weather_screen/weather_screen.dart';

class WeatherContainer extends StatelessWidget {
  const WeatherContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WeatherScreen()));
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
                    'Weather\nDetails',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 30,
            ),
            child: Image.asset(
              'assets/images/weather/sunny_2d.png',
              height: getProportionateScreenHeight(110),
              width: getProportionateScreenWidth(100),
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
