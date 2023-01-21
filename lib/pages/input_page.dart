import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/card_icon.dart';
import 'package:bmi_calculator/widgets/reuseable_card.dart';
import '../variables/constants.dart';
import 'package:bmi_calculator/widgets/round_icon_button.dart';
import '../functions/bmi_functions.dart';

double bmiResult = 0;
state? bodyState;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 170;
  int weight = 60;
  int age = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    onPress: () {
                      setState(
                        () {
                          selectedGender = (selectedGender == Gender.Male)
                              ? null
                              : Gender.Male;
                        },
                      );
                    },
                    color: (selectedGender == Gender.Male)
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    child: CardIcon(icon: FontAwesomeIcons.mars, text: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    onPress: () {
                      setState(
                        () {
                          selectedGender = (selectedGender == Gender.Female)
                              ? null
                              : Gender.Female;
                        },
                      );
                    },
                    color: (selectedGender == Gender.Female)
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    child:
                        CardIcon(icon: FontAwesomeIcons.venus, text: 'FEMALE'),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    color: kActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CardIcon(text: 'HEIGHT'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumberLabelStyle,
                            ),
                            Text(
                              ' cm',
                              style: kTextLabelStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderThemeData(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.grey,
                            thumbColor: Colors.pink,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15),
                            overlayColor: Color(0x30FFC0CB),
                          ),
                          child: Slider(
                            // height is current slider position
                            value: height.toDouble(),
                            min: 120,
                            max: 220,
                            //SelectedValue is what is clicked now
                            onChanged: (double SelectedValue) {
                              setState(
                                () {
                                  height = SelectedValue.round();
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    color: kActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kTextLabelStyle,
                        ),
                        Text(
                          '$weight',
                          style: kNumberLabelStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              function: () {
                                setState(
                                  () {
                                    weight != 1 ? weight-- : weight = 1;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              function: () {
                                setState(
                                  () {
                                    weight++;
                                  },
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    color: kActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kTextLabelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberLabelStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              function: () {
                                setState(
                                  () {
                                    age != 1 ? age-- : age = 1;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              function: () {
                                setState(
                                  () {
                                    age++;
                                  },
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              // calculate BMI
              bmiResult = CalculateBMI(weight: weight, height: height);
              bodyState = BodyState(bmiResult: bmiResult);
              Navigator.pushNamed(context, 'results');
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',
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
