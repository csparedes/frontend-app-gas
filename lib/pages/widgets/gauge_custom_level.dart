import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GaugeCustomLevel extends StatelessWidget {
  const GaugeCustomLevel({
    Key? key,
    this.topTitle,
    required this.pointerValue,
    this.insideTitle,
    this.width = 175,
    this.insideTitleFontSize = 16,
  }) : super(key: key);
  final String? topTitle;
  final double pointerValue;
  final String? insideTitle;
  final double insideTitleFontSize;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: SfRadialGauge(
        title: GaugeTitle(text: topTitle ?? ''),
        axes: [
          RadialAxis(
            minimum: 0,
            maximum: 100,
            pointers: [
              NeedlePointer(value: pointerValue, needleStartWidth: 0.5),
            ],
            annotations: [
              GaugeAnnotation(
                widget: Text(
                  insideTitle ?? '',
                  style: TextStyle(fontSize: insideTitleFontSize),
                ),
                positionFactor: 0.5,
                angle: 90,
              )
            ],
            ranges: [
              GaugeRange(
                startValue: 0,
                endValue: 25,
                color: Colors.red,
              ),
              GaugeRange(
                startValue: 25,
                endValue: 75,
                color: Colors.amber,
              ),
              GaugeRange(
                startValue: 75,
                endValue: 100,
                color: Colors.green,
              ),
            ],
          )
        ],
      ),
    );
  }
}
