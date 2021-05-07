import 'dart:math';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = '0';
  String _output = '0';
  String enteredInput = ' ';

  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressedFunction(String buttonText) {
    print(buttonText);
    if (buttonText == "AC") {
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
      _output = "0";
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '*' ||
        buttonText == '/' ||
        buttonText == '%' ||
        buttonText == '^') {
      num1 = double.parse(output);
      operand = buttonText;
      _output = '0';
    } else if (buttonText == '.') {
      if (_output.contains(".")) {
        print('Already contains a decimal');
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == '=') {
      num2 = double.parse(output);
      if (operand == '+') {
        _output = (num1 + num2).toString();
        num1 = double.parse(_output);
      }
      if (operand == '-') {
        _output = (num1 - num2).toString();
      }
      if (operand == '*') {
        _output = (num1 * num2).toString();
      }
      if (operand == '/') {
        _output = (num1 / num2).toString();
      }
      if (operand == '%') {
        _output = (num1 % num2).toString();
      }
      if (operand == '^') {
        _output = pow(num1, num2).toString();
      }
      // num1 = 0.0;
      num2 = 0.0;
      operand = '0';
    } else {
      _output = _output + buttonText;
    }
    //print("num1: " + num1.toString());
    //print("num2: " + num2.toString());
    //print("output: " + _output);
    setState(() {
      if (buttonText == '=') {
        enteredInput = enteredInput;
      } else if (buttonText == 'AC') {
        enteredInput = " ";
      } else
        enteredInput = enteredInput + buttonText;
      output = double.parse(_output).toString();
    });
  }

  sqrtfn(String buttonText) {}

  Widget input() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      child: Text(
        enteredInput,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget result() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 30),
      child: Text(
        output,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget button(String buttonText) {
    return Container(
      margin: EdgeInsets.only(bottom: 2, right: 1),
      child: Expanded(
        child: RaisedButton(
          //color: Color(0xff5ac48e),
          elevation: 8,
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 38),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          onPressed: () => {buttonPressedFunction(buttonText)},
        ),
      ),
    );
  }

  Widget keypad() {
    return Container(
      child: Column(
        children: [
          Row(children: [
            button('+/-'),
            button('%'),
            button('^'),
            button('AC'),
          ]),
          Row(children: [
            button('7'),
            button('8'),
            button('9'),
            button('/'),
          ]),
          Row(children: [
            button('4'),
            button('5'),
            button('6'),
            button('*'),
          ]),
          Row(children: [
            button('1'),
            button('2'),
            button('3'),
            button('-'),
          ]),
          Row(children: [
            button('.'),
            button('0'),
            button('='),
            button('+'),
          ]),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget CalculatorImplem() {
    return Container(
      child: Column(
        children: <Widget>[
          input(),
          Expanded(child: Divider()),
          result(),
          keypad(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Color(0xff185a37),
      ),
      body: CalculatorImplem(),
    );
  }
}
