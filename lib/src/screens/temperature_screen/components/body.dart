import 'package:firebase_database/firebase_database.dart';
import 'package:smart_jtj/config/size_config.dart';
import 'package:flutter/material.dart';

import 'sensor_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _tempDB = FirebaseDatabase.instance.ref('Temperature');
  final _humiDB = FirebaseDatabase.instance.ref('Humidity');
  String _tempJson = "20";
  String _humiJson = "20";

  List<double>? tempList;
  List<double>? rhList;

  @override
  void initState() {
    super.initState();
    _tempValue();
    _humiValue();
  }

  void _tempValue() {
    _tempDB.onValue.listen((event) {
      final dataSnapshot = event.snapshot;
      setState(() {
        _tempJson = dataSnapshot.value.toString();
      });
    });
  }

  void _humiValue() {
    _humiDB.onValue.listen((event) {
      final dataSnapshot = event.snapshot;
      setState(() {
        _humiJson = dataSnapshot.value.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // 그래프 관련
    if (tempList == null) {
      tempList = List.filled(5, double.parse(_tempJson), growable: true);
    } else {
      tempList!.add(double.parse(_tempJson));
      tempList!.removeAt(0);
    }

    if (rhList == null) {
      rhList = List.filled(5, double.parse(_humiJson), growable: true);
    } else {
      rhList!.add(double.parse(_humiJson));
      rhList!.removeAt(0);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(19),
                top: getProportionateScreenHeight(7),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(19),
                      top: getProportionateScreenHeight(7),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: getProportionateScreenHeight(40),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(Icons.arrow_back_outlined),
                        ),
                        Stack(
                          children: [
                            Text(
                              '온도',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                    fontSize: 45,
                                    color: const Color(0xFFBDBDBD)
                                        .withOpacity(0.5),
                                  ),
                            ),
                            Text(
                              '온도',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Image.asset(
                  'assets/images/temperature.png',
                  height: getProportionateScreenHeight(180),
                  width: getProportionateScreenWidth(100),
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(
              30,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SensorCard(
                value: _humiJson,
                unit: '%',
                name: 'Humidity',
                assetImage: AssetImage(
                  'assets/images/humidity_icon.png',
                ),
                trendData: rhList!,
                linePoint: Colors.blueAccent,
              ),
              SizedBox(
                height: 50,
              ),
              SensorCard(
                value: _tempJson,
                unit: '°C',
                name: 'Temperature',
                assetImage: AssetImage(
                  'assets/images/temperature_icon.png',
                ),
                trendData: tempList!,
                linePoint: Colors.redAccent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
