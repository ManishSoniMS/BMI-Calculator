import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../constants.dart';

class ResultScreen extends StatelessWidget {
  final result;
  final String resultText;
  ResultScreen({
    required this.result,
    required this.resultText,
  });

  final appBar = AppBar(
    centerTitle: true,
    automaticallyImplyLeading: false,
    title: Text(
      'BMI Calculator',
      style: TextStyle(color: Colors.grey.shade700),
    ),
  );
  double percentage() {
    if (double.parse(result) < 0.0) {
      return 0.0;
    } else if (double.parse(result) > 1.0) {
      return 1.0;
    } else {
      return double.parse(result) / 35;
    }
  }

  @override
  Widget build(BuildContext context) {
    final heightFormat = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: heightFormat * 0.10),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.37),
                boxShadow: kBoxShadow,
                color: Colors.white),
            child: CircularPercentIndicator(
              radius: MediaQuery.of(context).size.width * 0.7,
              animation: true,
              animationDuration: 2000,
              lineWidth: 12.0,
              percent: percentage(),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: kActiveTileColor,
              center: Text(
                result,
                style: kNumberTextStyle,
              ),
            ),
          ),
          SizedBox(height: heightFormat * 0.01),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              resultText,
              style: kTilesTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: heightFormat * 0.01),
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
                Navigator.pop(context);
              },
              child: Text(
                "Re-Calculate BMI",
                style: kTilesTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
