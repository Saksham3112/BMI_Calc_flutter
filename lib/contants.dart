import 'package:flutter/material.dart';

enum Gender { male, female }
const Color kActiveColour = Color(0xFF1D1E33);
const Color kInactiveColour = Color(0xFF111328);
const Color kCBox1 = kActiveColour;
const Color kCBox2 = kActiveColour;
const double kBottomContainerHeight = 80.0;
const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);
const kLabelHealthText = TextStyle(
  fontSize: 22.0,
  color: Color(0xFF24D876),
  fontWeight: FontWeight.bold,
);
const kLabelResultText = TextStyle(
  fontSize: 100.0,
  color: Color(0xFFFFFFFF),
  fontWeight: FontWeight.w900,
);
const kLabelSuggestionText = TextStyle(
  fontSize: 18.0,
  color: Color(0xFFFFFFFF),
);
const kLabelHeavyTextStyle = TextStyle(
  fontSize: 50.0,
  color: Color(0xFFFFFFFF),
  fontWeight: FontWeight.w900,
);
const kLabelTitleStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
  color: Color(0xFFFFFFFF),
);
const kLabelBottomBox = TextStyle(
  fontSize: 26.0,
  color: Color(0xFFFFFFFF),
);

class ReusableBox extends StatelessWidget {
  final Color colour;
  final Widget cardchild;
  final Function onpress;
  ReusableBox({
    @required this.colour,
    this.onpress,
    this.cardchild,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: this.onpress,
        child: Container(
          child: cardchild,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: this.colour,
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
