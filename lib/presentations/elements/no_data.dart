import 'package:booster/booster.dart';
import 'package:flutter/material.dart';

class NoDataView extends StatelessWidget {
  const NoDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Booster.dynamicFontSize(label: 'No Data Found!', fontSize: 30),
        ],
      ),
    );
  }
}
