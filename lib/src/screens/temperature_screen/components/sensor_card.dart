import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:smart_jtj/constant/custom_colors.dart';
import 'package:smart_jtj/constant/custom_styles.dart';

class SensorCard extends StatelessWidget {
  const SensorCard(
      {Key? key,
        required this.value,
        required this.name,
        required this.assetImage,
        required this.unit,
        required this.trendData,
        required this.linePoint})
      : super(key: key);

  final String value;
  final String name;
  final String unit;
  final List<double> trendData;
  final Color linePoint;
  final AssetImage assetImage;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        shadowColor: Colors.white,
        elevation: 24,
        color: kMainBG,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 200,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      width: 40,
                      image: assetImage,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(name, style: kBodyText.copyWith(color: Colors.white)),
                    SizedBox(
                      height: 10,
                    ),
                    Text('$value$unit',
                        style: kHeadline.copyWith(color: Colors.white)),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
                  child: Sparkline(
                    data: trendData,
                    lineWidth: 5.0,
                    lineColor: Colors.white,
                    averageLine: true,
                    fillMode: FillMode.above,
                    sharpCorners: false,
                    pointsMode: PointsMode.last,
                    pointSize: 20,
                    pointColor: linePoint,
                    useCubicSmoothing: true,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
