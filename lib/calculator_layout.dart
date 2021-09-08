import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  //  design
  //*************

  // common color
  Color color1 = Color(0xffa5a5a5);
  Color color2 = Color(0xff333333);
  Color color3 = Color(0xfffe9e09);

  // clicked  button widget
  Widget calculatorButtonBuilder({
    required String text,
    required Color textColor,
    required Color buttonColor,
    required Function onPressed,
  }) =>
      MaterialButton(
        elevation: 10.0,
        onPressed: () {
          onPressed(text);
        },
        color: buttonColor,
        shape: CircleBorder(),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 40.0,
            color: textColor,
          ),
        ),
        height: 80.0,
        minWidth: 80.0,
      );

  // logic
  // **************
  // logic var
  String history = "";
  String currentNum = "";

  // to show clicked number button
  void numClick(String text) {
    setState(() {
      currentNum += text;
    });
  }

  // to clear  all current number & history number
  void clearAll(String text) {
    setState(() {
      history = "";
      currentNum = '';
    });
  }

  // to clear current  number
  void clear(String text) {
    setState(() {
      currentNum = '';
    });
  }

  void equal(String text) {
    Parser parser = Parser();
    Expression expression = parser.parse(currentNum);
    ContextModel contextModel = ContextModel();
    double result = expression.evaluate(EvaluationType.REAL, contextModel);
    setState(() {
      history = currentNum;
      currentNum = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xfffe6f27),
              Color(0xff2f2f2f),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
            bottom: 10.0,
            right: 10.0,
            left: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                history,
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.grey[400],
                ),
              ),
              Text(
                currentNum,
                style: TextStyle(
                  fontSize: 70.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  calculatorButtonBuilder(
                    text: 'AC',
                    textColor: Colors.black,
                    buttonColor: color1,
                    onPressed: clearAll,
                  ),
                  calculatorButtonBuilder(
                    onPressed: clear,
                    text: 'c',
                    textColor: Colors.black,
                    buttonColor: color1,
                  ),
                  calculatorButtonBuilder(
                    onPressed: numClick,
                    text: '%',
                    textColor: Colors.black,
                    buttonColor: color1,
                  ),
                  calculatorButtonBuilder(
                    onPressed: numClick,
                    text: '/',
                    textColor: Colors.white,
                    buttonColor: color3,
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  calculatorButtonBuilder(
                    onPressed: numClick,
                    text: '7',
                    textColor: Colors.white,
                    buttonColor: color2,
                  ),
                  calculatorButtonBuilder(
                    onPressed: numClick,
                    text: '8',
                    textColor: Colors.white,
                    buttonColor: color2,
                  ),
                  calculatorButtonBuilder(
                    onPressed: numClick,
                    text: '9',
                    textColor: Colors.white,
                    buttonColor: color2,
                  ),
                  calculatorButtonBuilder(
                    onPressed: numClick,
                    text: '*',
                    textColor: Colors.white,
                    buttonColor: color3,
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  calculatorButtonBuilder(
                    onPressed: numClick,
                    text: '4',
                    textColor: Colors.white,
                    buttonColor: color2,
                  ),
                  calculatorButtonBuilder(
                    onPressed: numClick,
                    text: '5',
                    textColor: Colors.white,
                    buttonColor: color2,
                  ),
                  calculatorButtonBuilder(
                    onPressed: numClick,
                    text: '6',
                    textColor: Colors.white,
                    buttonColor: color2,
                  ),
                  calculatorButtonBuilder(
                    onPressed: numClick,
                    text: '-',
                    textColor: Colors.white,
                    buttonColor: color3,
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  calculatorButtonBuilder(
                    onPressed: numClick,
                    text: '1',
                    textColor: Colors.white,
                    buttonColor: color2,
                  ),
                  calculatorButtonBuilder(
                    onPressed: numClick,
                    text: '2',
                    textColor: Colors.white,
                    buttonColor: color2,
                  ),
                  calculatorButtonBuilder(
                    onPressed: numClick,
                    text: '3',
                    textColor: Colors.white,
                    buttonColor: color2,
                  ),
                  calculatorButtonBuilder(
                    onPressed: numClick,
                    text: '+',
                    textColor: Colors.white,
                    buttonColor: color3,
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    color: color2,
                    shape: StadiumBorder(),
                    child: Text(
                      '0',
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                      ),
                    ),
                    height: 80.0,
                    minWidth: 180.0,
                    onPressed: () {
                      numClick('0');
                    },
                  ),
                  calculatorButtonBuilder(
                    onPressed: numClick,
                    text: '.',
                    textColor: Colors.white,
                    buttonColor: color2,
                  ),
                  calculatorButtonBuilder(
                    onPressed: equal,
                    text: '=',
                    textColor: Colors.white,
                    buttonColor: color3,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
