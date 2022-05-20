import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

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

    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: Duration(
            milliseconds: 1000,
          ),
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isSwitched
                ? Colors.greenAccent
                : Colors.redAccent.withOpacity(0.5),
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeIn,
                top: 3.0,
                left: isSwitched ? 60 : 0,
                right: isSwitched ? 0 : 60,
                child: InkWell(
                  onTap: createdb,
                  child: AnimatedSwitcher(
                    duration: Duration(
                      milliseconds: 1000,
                    ),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return RotationTransition(
                        child: child,
                        turns: animation,
                      );
                    },
                    child: isSwitched
                        ? Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 35,
                            key: UniqueKey(),
                          )
                        : Icon(
                            Icons.remove_circle_outline,
                            color: Colors.red,
                            size: 35,
                            key: UniqueKey(),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  createdb() {
    setState(() {
      isSwitched = !isSwitched;
    });
    _isSwitchState.set(isSwitched.toString());
  }
}
