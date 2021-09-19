import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bottom_button.dart';
import 'reusable_card.dart';
import 'gender_card_content.dart';
import 'constants.dart';
import 'button_counter.dart';
import 'calculate_brain.dart';

enum Gender { male, female }

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Gender? genderSelected;
  int height = 180;
  int weight = 80;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('BMI Calculator'),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          genderSelected = Gender.male;
                        });
                      },
                      colour: genderSelected == Gender.male
                          ? kBkg_active_card
                          : kBkg_inactive_card,
                      cardChild: GenderCardContent(
                        label: 'Male',
                        icon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          genderSelected = Gender.female;
                        });
                      },
                      colour: genderSelected == Gender.female
                          ? kBkg_active_card
                          : kBkg_inactive_card,
                      cardChild: GenderCardContent(
                        label: 'Female',
                        icon: FontAwesomeIcons.venus,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kBkg_active_card,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 80,
                          ),
                        ),
                        Text(
                          'cm',
                          style: kTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E92),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x15EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 100,
                        max: 220,
                        onChanged: (newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kBkg_active_card,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kBigTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MyButton(
                                icon: FontAwesomeIcons.minus,
                                onCount: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              MyButton(
                                icon: FontAwesomeIcons.plus,
                                onCount: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kBkg_active_card,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kTextStyle,
                          ),
                          Text(age.toString(), style: kBigTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MyButton(
                                icon: FontAwesomeIcons.minus,
                                onCount: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              MyButton(
                                icon: FontAwesomeIcons.plus,
                                onCount: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
                title: 'CALCULATE',
                onClick: () {
                  Calculator calc = Calculator(height: height, weight: weight);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Result(
                              intepretation: calc.getInterpretation(),
                              bmiResult: calc.calculateBMI(),
                              resultText: calc.getResult())));
                })
          ],
        ),
      ),
    );
  }
}
