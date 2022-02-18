import 'package:booster/booster.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingPosts extends StatelessWidget {
  const LoadingPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              children: [
                Booster.verticalSpace(30),
                _getLoader(context),
                Booster.verticalSpace(30),
                _getLoader(context),
              ],
            )));
  }

  Widget _getLoader(BuildContext context) {
    return Container(
      child: Column(
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Container(
                height: 14,
                width: 120,
                color: Colors.grey,
              ),
              Booster.verticalSpace(5),
              Container(
                height: 14,
                width: Booster.screenWidth(context) * 0.8,
                color: Colors.grey,
              ),
              Booster.verticalSpace(5),
              Container(
                height: 154,
                width: double.infinity,
                color: Colors.grey,
              ),
              Booster.verticalSpace(5),

            ],
          )
        ],
      ),
    );
  }
}
