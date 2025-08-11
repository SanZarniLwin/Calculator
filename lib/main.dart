import 'package:flutter/material.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String displayText = '';
  double firstOperand = 0;
  String selectedOperator = '';

  void onNumberPressed(String number) {
    setState(() {
      displayText += number;
    });
  }

  void onOperatorPressed(String operator) {
    setState(() {
      firstOperand = double.tryParse(displayText) ?? 0;
      selectedOperator = operator;
      displayText = '';
    });
  }

  void calculateResult() {
    setState(() {
      double secondOperand = double.tryParse(displayText) ?? 0;
      double result = 0;

      switch (selectedOperator) {
        case '+':
          result = firstOperand + secondOperand;
          break;
        case '-':
          result = firstOperand - secondOperand;
          break;
        case 'x':
          result = firstOperand * secondOperand;
          break;
        case '/':
          if (secondOperand != 0) {
            result = firstOperand / secondOperand;
          } else {
            displayText = 'Error';
            return;
          }
          break;
        default:
          result = 0;
      }

      displayText = result.toString();
    });
  }

  void clearAll() {
    setState(() {
      displayText = '';
      firstOperand = 0;
      selectedOperator = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellowAccent,
          brightness: Brightness.light,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Basic Calculator'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(30),
                child: Text(
                  displayText,
                  style: const TextStyle(fontSize: 32),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () => onNumberPressed('1'), child: Text('1')),
                ElevatedButton(
                    onPressed: () => onNumberPressed('2'), child: Text('2')),
                ElevatedButton(
                    onPressed: () => onNumberPressed('3'), child: Text('3')),
                ElevatedButton(
                    onPressed: () => onOperatorPressed('+'), child: Text('+')),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () => onNumberPressed('4'), child: Text('4')),
                ElevatedButton(
                    onPressed: () => onNumberPressed('5'), child: Text('5')),
                ElevatedButton(
                    onPressed: () => onNumberPressed('6'), child: Text('6')),
                ElevatedButton(
                    onPressed: () => onOperatorPressed('-'), child: Text('-')),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () => onNumberPressed('7'), child: Text('7')),
                ElevatedButton(
                    onPressed: () => onNumberPressed('8'), child: Text('8')),
                ElevatedButton(
                    onPressed: () => onNumberPressed('9'), child: Text('9')),
                ElevatedButton(
                    onPressed: () => onOperatorPressed('x'), child: Text('x')),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () => onNumberPressed('0'), child: Text('0')),
                ElevatedButton(
                    onPressed: () => onOperatorPressed('/'), child: Text('/')),
                ElevatedButton(onPressed: clearAll, child: const Text('C')),
                ElevatedButton(
                    onPressed: calculateResult, child: const Text('=')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// Change result to be more visible, add visual clues
// change buttons to be bigger and add padding at the bottom.