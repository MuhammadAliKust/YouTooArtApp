import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SearchField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  SearchField({
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(fontSize: 15,
        fontWeight: FontWeight.w400,color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: label,
        contentPadding: EdgeInsets.all(20.0),
        hintStyle: TextStyle(fontSize: 15,
        fontWeight: FontWeight.w400,color: Colors.black),
        border: OutlineInputBorder(
          borderSide: BorderSide(color:Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
