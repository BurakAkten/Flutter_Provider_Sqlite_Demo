import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profe_study_case_flutter/models/shop_info.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class WaveScreen extends StatelessWidget {
  final ShopInfo shopInfo;

  const WaveScreen({Key key, @required this.shopInfo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Stack(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                child: WaveWidget(
                  config: CustomConfig(
                    colors: [
                      Colors.white70,
                      Colors.white54,
                      Colors.white30,
                      Colors.white24,
                    ],
                    durations: [35000, 19440, 10800, 6000],
                    heightPercentages: [0.85, 0.80, 0.75, 0.70],
                  ),
                  backgroundColor: Colors.blue[700],
                  size: Size(double.infinity, double.infinity),
                  waveAmplitude: 0,
                  heightPercentange: 0.8,
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 12, top: 12),
                child: Row(
                  children: [
                    SizedBox(
                      width: 24,
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      child: Center(
                        child: Text(
                          "T3",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Column(
                        children: [
                          Text(
                            "${shopInfo.number} - ${shopInfo.name} - ${shopInfo.ownerName}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "${shopInfo.info}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "${shopInfo.province}/${shopInfo.city}",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
