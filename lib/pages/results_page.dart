import 'package:bmi_calculator/variables/constants.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import '../variables/constants.dart';
import '../functions/bmi_functions.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Text(
            'Your Result',
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.w900,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: kActiveCardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        theState.toString(),
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.green,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ), // overweight?
                  Text(
                    bmiResult.toString(),
                    style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    Info[bodyState].toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  // BMI result number
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                ),
              ),
              color: Color(0xFFEB1555),
              width: double.infinity,
              height: kBottomBarHeight,
              margin: EdgeInsets.only(top: 10),
            ),
          ),
        ],
      ),
    );
  }
}
