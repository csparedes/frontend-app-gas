import 'package:flutter/material.dart';

import 'gauge_custom_level.dart';

class CardInfoGas extends StatelessWidget {
  const CardInfoGas({
    Key? key,
    this.height = 230,
    required this.pointerValue,
    this.topTitle = 'topTitle',
    this.subTitle = 'subTitle',
    this.infoTitle = 'infoTitle',
    this.location = 'location',
    this.aboutTitle = 'aboutTitle',
    this.about = 'about',
    this.totalW = 16,
  }) : super(key: key);

  final double height;
  final double pointerValue;
  final double totalW;
  final String topTitle;
  final String subTitle;
  final String infoTitle;
  final String location;
  final String aboutTitle;
  final String about;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          GaugeCustomLevel(
            pointerValue: (pointerValue / totalW) * 100,
            topTitle: topTitle,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(subTitle),
                Text(
                  infoTitle,
                  style: const TextStyle(fontSize: 20),
                ),
                Text(location),
                Text(
                  aboutTitle,
                  style: const TextStyle(fontSize: 20),
                ),
                Text(about),
              ],
            ),
          )
        ],
      ),
    );
  }
}
