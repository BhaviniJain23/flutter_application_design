import 'package:flutter/material.dart';

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final int y;
  final Color? color;
}

class ChartDataEntry {
  final int mainData;
  final String subData;
  final Color? color;

  ChartDataEntry(this.mainData, this.subData, [this.color]);
}
