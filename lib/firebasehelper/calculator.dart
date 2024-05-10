import 'package:flutter/material.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';


class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return const SimpleCalculator(
  theme: CalculatorThemeData(
    
    numStyle: TextStyle(fontSize: 30, color: Colors.blue),
    displayColor: Colors.black,
    displayStyle:  TextStyle(fontSize: 60, color: Colors.yellow),
    /*...*/
  ),
);
  }
}