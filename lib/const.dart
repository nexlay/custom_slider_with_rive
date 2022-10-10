import 'package:flutter/material.dart';

var appBarColor = Colors.black;
const appBarTextColor = Colors.white;
var info = Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: const [
    Icon(Icons.info_outline, color: appBarTextColor,),
    SizedBox(width: 5.0,),
    Text(
      'Tap a slider to change',
      style: TextStyle(
        color: appBarTextColor,
      ),
    ),
  ],
);
var appBar = AppBar(
  title: const Text(
    'Rive animation slider',
    style: TextStyle(color: appBarTextColor),
  ),
  backgroundColor: appBarColor,
  elevation: 0,
  centerTitle: true,
);
