import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'classify.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late TooltipBehavior _tooltipBehavior;

  final _redDB = FirebaseDatabase.instance.ref('Classify/RED');
  final _blueDB = FirebaseDatabase.instance.ref('Classify/BLUE');
  final _yellowDB = FirebaseDatabase.instance.ref('Classify/YELLOW');

  int _redValue = 0;
  int _blueValue = 0;
  int _yellowValue = 0;

  @override
  void initState() {
    _isRedValue();
    _isBlueValue();
    _isYellowValue();
    _tooltipBehavior = TooltipBehavior(
      enable: true,
    );
    super.initState();
  }

  void _isRedValue() {
    _redDB.onValue.listen((event) {
      final dataSnapshot = event.snapshot;
      setState(() {
        _redValue = int.parse(dataSnapshot.value.toString());
      });
    });
  }

  void _isBlueValue() {
    _blueDB.onValue.listen((event) {
      final dataSnapshot = event.snapshot;
      setState(() {
        _blueValue = int.parse(dataSnapshot.value.toString());
      });
    });
  }

  void _isYellowValue() {
    _yellowDB.onValue.listen((event) {
      final dataSnapshot = event.snapshot;
      setState(() {
        _yellowValue = int.parse(dataSnapshot.value.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Classify> chartData = [
      Classify('RED', _redValue),
      Classify('BLUE', _blueValue),
      Classify('YELLOW', _yellowValue),
    ];

    return SafeArea(
      child: Scaffold(
        body: SfCircularChart(
          palette: [
            Colors.red,
            Colors.blue,
            Colors.yellow,
          ],
          title: ChartTitle(
            text: '상자 분류',
          ),
          legend: Legend(
            isVisible: true,
            overflowMode: LegendItemOverflowMode.wrap,
          ),
          tooltipBehavior: _tooltipBehavior,
          series: <CircularSeries>[
            PieSeries<Classify, String>(
              dataSource: chartData,
              xValueMapper: (Classify data, _) => data.classifyDetails,
              yValueMapper: (Classify data, _) => data.classifyValue,
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
              ),
              enableTooltip: true,
            ),
          ],
        ),
      ),
    );
  }
}
