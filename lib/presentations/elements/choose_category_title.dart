import 'package:booster/booster.dart';
import 'package:flutter/material.dart';
import 'package:you_2_art/configs/front_end_configs.dart';

class ChooseCategoryTile extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  ChooseCategoryTile({required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 22,
          width: 24,
          decoration: BoxDecoration(
            boxShadow: FrontEndConfigs.boxShadow,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        Booster.horizontalSpace(15),
        Booster.dynamicFontSize(
            label: text,
            fontSize: 15,
            fontWeight: FontWeight.w400),
      ],
    );
  }
}