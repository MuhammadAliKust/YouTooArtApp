import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:you_2_art/configs/front_end_configs.dart';

class AuthTextFieldBorder extends StatelessWidget {
  final String label;
  final int number;

  AuthTextFieldBorder({required this.label,required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: FrontEndConfigs.boxShadow,
        borderRadius: BorderRadius.circular(25),
      ),
        width: MediaQuery.of(context).size.width,
        child: TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            hintText: label,
            contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            hintStyle: TextStyle(
                color: Color(0xff707070),
                fontSize: 16),
              border: OutlineInputBorder(
                borderSide: BorderSide.none
              ),
          ),
          maxLines: number,
        ));
  }
}