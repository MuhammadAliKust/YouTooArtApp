import 'package:booster/booster.dart';
import 'package:flutter/material.dart';
import 'package:you_2_art/configs/front_end_configs.dart';

class OTPContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        boxShadow: FrontEndConfigs.boxShadow,
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}