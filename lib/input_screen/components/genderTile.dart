import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class GenderTile extends StatefulWidget {
  final Color tileColor;
  final genderTileHeight;
  final String genderTileTitle;
  final onTapGender;
  GenderTile({
    required this.onTapGender,
    required this.tileColor,
    required this.genderTileHeight,
    required this.genderTileTitle,
  });

  @override
  _GenderTileState createState() => _GenderTileState();
}

class _GenderTileState extends State<GenderTile> {
  @override
  Widget build(BuildContext context) {
    final boxShadow = [
      BoxShadow(
        color: Colors.grey.shade500,
        offset: Offset(4, 4),
        blurRadius: 5,
        spreadRadius: 0.4,
      ),
      BoxShadow(
        color: Colors.white,
        offset: Offset(-4, -4),
        blurRadius: 5,
        spreadRadius: 0.4,
      ),
    ];
    return GestureDetector(
      child: Container(
        height: widget.genderTileHeight,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: widget.tileColor,
          boxShadow: boxShadow,
        ),
        child: Center(
          child: FittedBox(
            child: Text(
              widget.genderTileTitle,
              style: kTilesTextStyle,
            ),
          ),
        ),
      ),
      onTap: widget.onTapGender,
    );
  }
}
