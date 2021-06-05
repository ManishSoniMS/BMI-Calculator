import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../input_screen/components/genderTile.dart';
import '../../input_screen/components/reusableCard.dart';
import '../result_screen/result_screen.dart';
import '../services/calculator_brain.dart';
import 'package:height_slider/height_slider.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final appBar = AppBar(
    centerTitle: true,
    title: Text(
      'BMI Calculator',
      style: TextStyle(color: Colors.grey.shade700),
    ),
  );

  Gender selectedGender = Gender.male;
  int weight = 60;
  int age = 18;
  int height = 180;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final heightFormat = deviceHeight -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: deviceHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GenderTile(
                      onTapGender: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      tileColor: selectedGender == Gender.male
                          ? kActiveTileColor
                          : kInActiveTileColor,
                      genderTileTitle: 'Male',
                      genderTileHeight: heightFormat * 0.08,
                    ),
                    GenderTile(
                      onTapGender: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      tileColor: selectedGender == Gender.female
                          ? kActiveTileColor
                          : kInActiveTileColor,
                      genderTileTitle: 'Female',
                      genderTileHeight: heightFormat * 0.08,
                    ),
                  ],
                ),
                SizedBox(height: deviceHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: heightFormat * 0.7,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: constraints.maxHeight * 0.06,
                                child: FittedBox(
                                  child: Text(
                                    'Height',
                                    style: kTilesTextStyle,
                                  ),
                                ),
                              ),
                              SizedBox(height: constraints.maxHeight * 0.04),
                              Container(
                                height: constraints.maxHeight * 0.84,
                                width: constraints.maxWidth * 0.9,
                                child: HeightSlider(
                                  accentColor: kActiveTileColor,
                                  currentHeightTextColor: kNumberTextColor,
                                  numberLineColor: Colors.grey,
                                  sliderCircleColor: kActiveTileColor,
                                  height: height,
                                  maxHeight: 220,
                                  minHeight: 120,
                                  onChange: (val) => setState(() {
                                    height = val;
                                  }),
                                  unit: 'cm',
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      decoration: BoxDecoration(
                        boxShadow: kBoxShadow,
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: heightFormat * 0.7,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: heightFormat * 0.33,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              boxShadow: kBoxShadow,
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white,
                            ),
                            child: ReusableCard(
                              titleText: 'Weight',
                              numberText: weight.toString(),
                              minusButton: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              addButton: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ),
                          Container(
                            height: heightFormat * 0.33,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              boxShadow: kBoxShadow,
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white,
                            ),
                            child: ReusableCard(
                              titleText: 'Age',
                              numberText: age.toString(),
                              minusButton: () {
                                setState(() {
                                  age--;
                                });
                              },
                              addButton: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: deviceHeight * 0.03),
                Container(
                  height: heightFormat * 0.1,
                  width: MediaQuery.of(context).size.width * 0.86666667,
                  decoration: BoxDecoration(
                    boxShadow: kBoxShadow,
                    color: kActiveTileColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    onPressed: () {
                      CalculatorBrain cal =
                          CalculatorBrain(weight: weight, height: height);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ResultScreen(
                              result: cal.calculateBMI(),
                              resultText: cal.getResult(),
                            );
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Let's begin!",
                      style: kTilesTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
