import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Result extends StatelessWidget {
  Result(
      {required this.intepretation,
      required this.bmiResult,
      required this.resultText});

  final String bmiResult;
  final String resultText;
  final String intepretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Result',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'YOUR RESULT',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.normal),
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kBkg_active_card,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      resultText,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      bmiResult,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 100,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      intepretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              )),
          BottomButton(
              onClick: () {
                Navigator.pop(context);
              },
              title: 'RECALCULATE')
        ],
      ),
    );
  }
}
