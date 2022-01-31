import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:you_2_art/configs/front_end_configs.dart';

class AuthTextFieldSimple extends StatelessWidget {
  final String label;
  final int number;
  final TextEditingController controller;

  AuthTextFieldSimple({required this.label, required this.number, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32), color: Color(0xffF2F2F2)),
        width: MediaQuery.of(context).size.width,
        child: TextField(
          controller:controller ,
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            hintText: label,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            hintStyle: TextStyle(
                color: Color(0XFFD1D1D1),
                fontWeight: FontWeight.w600,
                fontSize: 16),
            border: OutlineInputBorder(borderSide: BorderSide.none),
          ),
          maxLines: number,
        ));
  }
}
