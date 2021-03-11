import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'contants.dart';

class Result_Page extends StatelessWidget {
  Result_Page(
      {@required this.result,
      @required this.suggestion,
      @required this.health});
  final String result;
  final String suggestion;
  final String health;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Results',
                style: kLabelTitleStyle,
              ),
            ),
            Expanded(
              child: ReusableBox(
                colour: kActiveColour,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      health,
                      style: kLabelHealthText,
                    ),
                    Text(
                      result,
                      style: kLabelResultText,
                    ),
                    Text(
                      suggestion,
                      style: kLabelSuggestionText,
                    ),
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
                    're-CALCULATE',
                    style: kLabelBottomBox,
                  ),
                ),
                height: kBottomContainerHeight,
                color: Color(0xFFEB1555),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
