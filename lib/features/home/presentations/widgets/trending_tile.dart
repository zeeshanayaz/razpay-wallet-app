import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';

import '../../../../core/constant.dart';
import '../../../../core/divider.dart';
import '../../../../models/market/market.dart';
import '../../../../theme.dart';

class TrendingTile extends StatelessWidget {
  final Market marketData;
  final String icon;
  final String name;
  final String asset;
  final String value;
  final String increasePer;
  final bool goingUp;

  const TrendingTile({
    super.key,
    required this.marketData,
    required this.name,
    required this.asset,
    required this.icon,
    required this.value,
    required this.goingUp,
    required this.increasePer,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;

    return Column(
      children: [
        const SizedBoxH15(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(icon),
                    backgroundColor: Colors.transparent,
                  ),
                  /*SvgPicture.asset(
                    'assets/icons/$icon.svg',
                  ),*/
                  const SizedBoxW10(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name.capitalize ?? '',
                        style: textStyle14.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      /*Text(
                        asset.toUpperCase(),
                        style: textStyle12,
                      ),*/
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  height: 30,
                  width: 80,
                  child: LineChart(
                    LineChartData(
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              FlSpot(0, double.parse(marketData.h1 ?? '0.0')),
                              FlSpot(1, double.parse(marketData.h2 ?? '0.0')),
                              FlSpot(2, double.parse(marketData.h3 ?? '0.0')),
                              FlSpot(3, double.parse(marketData.h4 ?? '0.0')),
                              FlSpot(4, double.parse(marketData.h5 ?? '0.0')),
                              FlSpot(5, double.parse(marketData.h6 ?? '0.0')),
                              FlSpot(6, double.parse(marketData.h7 ?? '0.0')),
                              FlSpot(7, double.parse(marketData.h8 ?? '0.0')),
                            ],
                            isCurved: true,
                            gradient: LinearGradient(
                              colors: [
                                goingUp ? Colors.green : Colors.red,
                                goingUp ? Colors.greenAccent : Colors.redAccent,
                              ],
                            ),
                            barWidth: 1,
                            isStrokeCapRound: true,
                            dotData: const FlDotData(
                              show: false,
                            ),
                            belowBarData: BarAreaData(
                              show: true,
                              gradient: LinearGradient(
                                colors: [
                                  goingUp ? Colors.green : Colors.red,
                                  goingUp ? Colors.greenAccent : Colors.redAccent,

                                ].map((color) => color.withOpacity(0.3)).toList(),
                              ),
                            ),
                          ),
                        ],
                        titlesData: const FlTitlesData(show: false),
                        gridData: const FlGridData(
                          show: false,
                        ),
                        borderData: FlBorderData(
                          show: false,
                        )),
                    duration: const Duration(milliseconds: 150),
                    curve: Curves.linear,
                  ),
                ),
                /*Image.asset(
                  goingUp
                      ? 'assets/icons/green-wave.png'
                      : 'assets/icons/red-wave.png',
                ),*/
                const SizedBoxW20(),
                SizedBox(
                  width: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value,
                        style: textStyle14.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        increasePer,
                        style: textStyle12.copyWith(
                          color: goingUp ? green : red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBoxH5(),
        LineDivider(
          isDark: isDark,
        ),
      ],
    );
  }
}

class PortTile extends StatelessWidget {
  final String icon;
  final String name;
  final String asset;
  final double value;
  final double increasePer;
  final bool goingUp;
  final String color;

  const PortTile({
    super.key,
    required this.name,
    required this.asset,
    required this.icon,
    required this.value,
    required this.goingUp,
    required this.increasePer,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    accessCryptoIcon(icon),
                    width: 20,
                    height: 20,
                  ),
                  const SizedBoxW10(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        asset,
                        style: textStyle14.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        name,
                        style: textStyle12,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  /*SizedBox(
                    height: 30,
                    width: 80,
                    child: LineChart(
                      LineChartData(
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(0, double.parse(trendingData.h1 ?? '0.0')),
                                FlSpot(1, double.parse(trendingData.h2 ?? '0.0')),
                                FlSpot(2, double.parse(trendingData.h3 ?? '0.0')),
                                FlSpot(3, double.parse(trendingData.h4 ?? '0.0')),
                                FlSpot(4, double.parse(trendingData.h5 ?? '0.0')),
                                FlSpot(5, double.parse(trendingData.h6 ?? '0.0')),
                                FlSpot(6, double.parse(trendingData.h7 ?? '0.0')),
                                FlSpot(7, double.parse(trendingData.h8 ?? '0.0')),
                              ],
                              isCurved: true,
                              gradient: const LinearGradient(
                                colors: [
                                  Colors.green,
                                  Colors.greenAccent,
                                ],
                              ),
                              barWidth: 1,
                              isStrokeCapRound: true,
                              dotData: const FlDotData(
                                show: false,
                              ),
                              belowBarData: BarAreaData(
                                show: true,
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.green,
                                    Colors.greenAccent,
                                  ].map((color) => color.withOpacity(0.3)).toList(),
                                ),
                              ),
                            ),
                          ],
                          titlesData: const FlTitlesData(show: false),
                          gridData: const FlGridData(
                            show: false,
                          ),
                          borderData: FlBorderData(
                            show: false,
                          )),
                      duration: const Duration(milliseconds: 150),
                      curve: Curves.linear,
                    ),
                  ),*/
                 /* Image.asset(
                    color == 'green'
                        ? 'assets/images/wave-green.png'
                        : color == 'yellow'
                            ? 'assets/images/wave-yellow.png'
                            : 'assets/images/wave-blue.png',
                  ),*/
                  const SizedBoxW20(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\$$value',
                        style: textStyle14.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '$increasePer%',
                        style: textStyle12.copyWith(
                          color: increasePer >= 0 ? green : red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        LineDivider(
          isDark: isDark,
        ),
        // const SizedBoxH5(),
      ],
    );
  }
}
