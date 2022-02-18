import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:you_2_art/configs/front_end_configs.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCube(
      size: 35,
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven
                ? FrontEndConfigs.kPrimaryColor
                : FrontEndConfigs.kPrimaryColor.withOpacity(0.9),
          ),
        );
      },
    );
  }
}
