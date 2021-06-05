import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kActiveTileColor = Color(0xFF56CEDE);

const kInActiveTileColor = Colors.white;

const kNumberTextColor = Color(0xFF757575);

const kNumberTextStyle = TextStyle(
  color: kNumberTextColor,
  fontSize: 72,
);

const kTilesTextStyle = TextStyle(
  color: Color(0xFF989898),
  fontSize: 22,
);
final kBoxShadow = [
  BoxShadow(
    color: Colors.grey.shade600,
    offset: Offset(4, 4),
    blurRadius: 10,
    spreadRadius: 0.7,
  ),
  BoxShadow(
    color: Colors.white,
    offset: Offset(-4, -4),
    blurRadius: 10,
    spreadRadius: 0.7,
  ),
];
