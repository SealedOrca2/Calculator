import 'package:calculator/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


void main() {
  runApp(MaterialApp(
    home: CalculatorApp(),
  ));
}


class CalculatorApp extends StatelessWidget {

   CalculatorApp({super.key});

  double firstNum = 0.0 ;
  double secondNum = 0.0;
  var Input = '';
  var Output = '';
  var operation = '';

  onButtonClick(value){
    if (value == 'AC'){
       Input = '';
      Output = ''; 
    } else if (value == '<'){
    if (Input.isNotEmpty){
          Input = Input.substring(0, Input.length - 1 );
        }
      } else if (value == '='){
         if (Input.isNotEmpty){
          var userInput = Input;
          userInput = Input.replaceAll('x', '*');
          Parser p = Parser();
          Expression expression = p.parse(userInput);
          ContextModel cm = ContextModel();
           var finalValue = expression.evaluate(EvaluationType.REAL, cm);
          Output = finalValue.toString();
         } else {
          Input =  Input + value ;
         }
      }
      
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(child:
           Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  Input,
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  Output,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),

              ],
            ),
            )
            ),
          Row(
            children: [ 
              button(text: "AC", buttonBgColor: operatorColor,),
              button(text: "<",buttonBgColor: operatorColor),
              button(text: "00",buttonBgColor: operatorColor),
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
     text, tColor = Colors.white, buttonBgColor = buttonColor,
    
  }){
    return Expanded(
      child:Container(
                margin: const EdgeInsets.all(8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                    padding: const EdgeInsets.all(22),
                    primary: buttonBgColor),
                onPressed:() => onButtonClick(text) ,
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
