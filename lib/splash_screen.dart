import 'package:flutter/material.dart';
import '../../input_screen/inputPage.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen();

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => InputPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'BMI Calculator',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                fontSize: 32,
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.125),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Divider(
                  height: 2,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.125),
            ],
          ),
        ],
      ),
    );
  }
}
