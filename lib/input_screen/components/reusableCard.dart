import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReusableCard extends StatelessWidget {
  final String titleText;
  final String numberText;
  final addButton;
  final minusButton;
  const ReusableCard({
    required this.titleText,
    required this.numberText,
    required this.addButton,
    required this.minusButton,
  });

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.white,
        Colors.grey.shade50,
        Colors.grey.shade100,
        Colors.grey.shade200,
        Colors.grey.shade300,
        Colors.grey.shade400,
        Colors.grey.shade600,
      ],
      stops: [0.03, 0.1, 0.3, 0.6, 0.8, 0.9, 0.97],
    );
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: constraints.maxHeight * 0.02),
              Container(
                height: constraints.maxHeight * 0.1272727,
                child: FittedBox(
                  child: Text(
                    titleText,
                    style: kTilesTextStyle,
                  ),
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.02),
              Container(
                height: constraints.maxHeight * 0.40,
                child: FittedBox(
                  child: Text(
                    numberText,
                    style: kNumberTextStyle,
                  ),
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: kBoxShadow,
                      gradient: gradient,
                      shape: BoxShape.circle,
                    ),
                    child: RawMaterialButton(
                      shape: CircleBorder(),
                      elevation: 5,
                      onPressed: minusButton,
                      child: Icon(
                        FontAwesomeIcons.minus,
                        color: kNumberTextColor,
                      ),
                      constraints: BoxConstraints.tightFor(
                        width: constraints.maxHeight * 0.25,
                        height: constraints.maxHeight * 0.25,
                      ),
                    ),
                  ),
                  SizedBox(width: constraints.maxWidth * 0.04),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: kBoxShadow,
                      gradient: gradient,
                      shape: BoxShape.circle,
                    ),
                    child: RawMaterialButton(
                      shape: CircleBorder(),
                      elevation: 5,
                      onPressed: addButton,
                      child: Icon(
                        FontAwesomeIcons.plus,
                        color: kNumberTextColor,
                      ),
                      constraints: BoxConstraints.tightFor(
                        width: constraints.maxHeight * 0.25,
                        height: constraints.maxHeight * 0.25,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: constraints.maxHeight * 0.02),
            ],
          ),
        );
      },
    );
  }
}
