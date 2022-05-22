import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:smart_jtj/config/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // Firebase Realtime Database 중 Motor라고 선언한 DB 참조
  final _isSwitchState = FirebaseDatabase.instance.ref('Motor');

  // bool 값 초기화
  bool isSwitched = false;

  // DB의 Motor 값을 담아 두기 위해 선언
  String _switchValue = '';

  @override
  void initState() {
    super.initState();
    _isSwitchValue();
  }

  void _isSwitchValue() {
    _isSwitchState.onValue.listen((event) {
      final dataSnapshot = event.snapshot;
      setState(() {
        _switchValue = dataSnapshot.value.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // DB에 Motor의 값에 따라 bool의 값을 동일하게 선언
    if (_switchValue == 'false') {
      isSwitched = false;
    } else if (_switchValue == 'true') {
      isSwitched = true;
    }

    return Container(
      color: Colors.white,
      child: Column(
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
                                'Conveyor\nBelt',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                      fontSize: 35,
                                      color: const Color(0xFFBDBDBD)
                                          .withOpacity(0.5),
                                    ),
                              ),
                              Text(
                                'Conveyor\nBelt',
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
                    'assets/images/conveyor.png',
                    height: getProportionateScreenHeight(200),
                    width: getProportionateScreenWidth(100),
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ],
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isSwitched = !isSwitched;
                });
                _isSwitchState.set(isSwitched.toString());
              },
              child: Padding(
                padding: EdgeInsets.only(
                  top: 100,
                ),
                child: AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 200,
                  ),
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: isSwitched
                        ? [
                            BoxShadow(
                              color: Colors.grey[900]!,
                              offset: const Offset(4, 4),
                              blurRadius: 15,
                              spreadRadius: 1,
                            ),
                            const BoxShadow(
                              color: Colors.white,
                              offset: Offset(-4, -4),
                              blurRadius: 15,
                              spreadRadius: 1,
                            ),
                          ]
                        : null,
                  ),
                  child: Center(
                    child: isSwitched
                        ? Icon(
                            Icons.power,
                            size: 80,
                            color: Colors.lightGreenAccent,
                          )
                        : Icon(
                            Icons.power_off,
                            size: 80,
                            color: Colors.redAccent,
                          ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
