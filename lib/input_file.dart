import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'contants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'result_page.dart';
import 'bmi_calc.dart';
// Expanded makeC(int fl) {
//   return Expanded(
//     flex: fl,
//     child: resubaleBox(colour: Color(0xFF1D1E33)),
//   );
// }
//
// List<Expanded> makeL(int Cnum) {
//   List<Expanded> a = [];
//   for (int i = 0; i < Cnum; i++) {
//     a.add(makeC(1));
//   }
//   return a;
// }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 50;
  int age = 20;
  calculator c;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                ReusableBox(
                  colour: selectedGender == Gender.male
                      ? kActiveColour
                      : kInactiveColour,
                  onpress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  cardchild: IconContents(
                    iconName: FontAwesomeIcons.mars,
                    name: 'MALE',
                  ),
                ),
                ReusableBox(
                  colour: selectedGender == Gender.female
                      ? kActiveColour
                      : kInactiveColour,
                  onpress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  cardchild: IconContents(
                    iconName: FontAwesomeIcons.venus,
                    name: 'FEMALE',
                  ),
                ),
              ],
            ),
          ),
          ReusableBox(
            colour: kActiveColour,
            cardchild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kLabelHeavyTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    overlayColor: Color(0x29EB1555),
                    thumbColor: Color(0xFFEB1555),
                    activeTrackColor: Colors.white,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    inactiveTrackColor: Color(0xFF8D8E98),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    max: 220.0,
                    min: 130.0,
                    onChanged: (double a) {
                      setState(() {
                        height = a.toInt();
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(children: <Widget>[
              ReusableBox(
                colour: kActiveColour,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'WEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kLabelHeavyTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          Press: () {
                            setState(() {
                              if (weight > 0) weight--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          Press: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ReusableBox(
                colour: kActiveColour,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AGE',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kLabelHeavyTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          Press: () {
                            setState(() {
                              if (age > 0) age--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          Press: () {
                            setState(() {
                              age++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                c = calculator(weight: weight, height: height);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Result_Page(
                      result: c.getResult(),
                      suggestion: c.getSuggestion(),
                      health: c.getHealth(),
                    ),
                  ),
                );
              });
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: kLabelBottomBox,
                ),
              ),
              height: kBottomContainerHeight,
              color: Color(0xFFEB1555),
            ),
          ),
        ],
      ),
    );
  }
}

class IconContents extends StatelessWidget {
  final IconData iconName;
  final String name;
  IconContents({@required this.iconName, @required this.name});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconName,
          size: 80,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          name,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function Press;
  RoundIconButton({this.icon, @required this.Press});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: Press,
      child: Icon(icon),
      elevation: 1.0,
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
