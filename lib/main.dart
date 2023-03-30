import 'package:calculator/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MaterialApp(
    home: CalculatorApp(),
  ));
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  var Input = '';
  var Output = '';
  var operation = '';

  onButtonClick(value) {
    switch (value) {
      case 'AC':
        Input = '';
        Output = '';
        break;
      case '<':
        if (Input.isNotEmpty) {
          Input = Input.substring(0, Input.length - 1);
        }
        break;
      case '=':
        if (Input.isNotEmpty) {
          var userInput = Input;
          userInput = Input.replaceAll('x', '*');
          Parser p = Parser();
          Expression expression = p.parse(userInput);
          ContextModel cm = ContextModel();
          var finalValue = expression.evaluate(EvaluationType.REAL, cm);
          Output = finalValue.toString();
        }
        break;
      default:
        Input = Input + value;

        if (value == '0' || value == '1' || value == '2' || value == '3' || value == '4' || value == '5' || value == '6'|| value == '7' || value == '8' || value == '9') {
          if (Input.isNotEmpty) {
            var userInput = Input;
            userInput = Input.replaceAll('x', '*');
            Parser p = Parser();
            Expression expression = p.parse(userInput);
            ContextModel cm = ContextModel();
            var finalValue = expression.evaluate(EvaluationType.REAL, cm);
            Output = finalValue.toString();
          }
        } else {
          Output = '';
        }
        break;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Column(
        children: [
          Expanded(
              child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  Input,
                  style: const TextStyle(
                    fontSize: 48,
                    color: Color.fromARGB(255, 242, 242, 248),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  Output,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          )),
          Row(
            children: [
              button(text: "AC", tColor: Colors.purple),
              button(text: "<", tColor: Colors.purple),
              button(text: "00", tColor: Colors.purple),
              button(text: "/", buttonBgColor: operatorColor),
            ],
          ),
          Row(
            children: [
              button(text: "7"),
              button(text: "8"),
              button(text: "9"),
              button(text: "x", buttonBgColor: operatorColor),
            ],
          ),
          Row(
            children: [
              button(text: "4"),
              button(text: "5"),
              button(text: "6"),
              button(text: "-", buttonBgColor: operatorColor),
            ],
          ),
          Row(
            children: [
              button(text: "1"),
              button(text: "2"),
              button(text: "3"),
              button(text: "+", buttonBgColor: operatorColor),
            ],
          ),
          Row(
            children: [
              button(text: "%"),
              button(text: "0"),
              button(text: "."),
              button(text: "=", buttonBgColor: operatorColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget button({
    text,
    tColor = Colors.white,
    buttonBgColor = buttonColor,
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(22),
            primary: buttonBgColor,
            shadowColor: Colors.grey.withOpacity(0.6),
            elevation: 8,
            onSurface: Colors.grey,
          ),
          onPressed: () => onButtonClick(text),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: tColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
