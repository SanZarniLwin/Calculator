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
  String displayText = '0';
  double firstOperand = 0;
  String selectedOperator = '';

  void onNumberPressed(String number) {
    setState(() {
      if (displayText == '0') {
        displayText = number;
      } else {
        displayText += number;
      }
    });
  }

  void onOperatorPressed(String operator) {
    setState(() {
      firstOperand = double.tryParse(displayText) ?? 0;
      selectedOperator = operator;
      displayText = '0';
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
      displayText = '0';
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
          seedColor: Colors.yellow,
          brightness: Brightness.dark,
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
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  color: Colors.yellow[100],
                ),
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(30),
                child: Text(
                  displayText,
                  style: const TextStyle(fontSize: 52,
                  color: Colors.black),
                ),
              ),
            ),
            Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Container(
                      height: 70,
                      color: Colors.yellow[100],
                      padding: const EdgeInsets.all(5),
                      child: ElevatedButton(
                            onPressed: () => onNumberPressed('1'), child: Text('1', style: TextStyle(fontSize: 30))),
                    ),
                ),
                Expanded(
                  child: Container(
                      height: 70,
                      color: Colors.yellow[100],
                      padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                        onPressed: () => onNumberPressed('2'), child: Text('2', style: TextStyle(fontSize: 30))),
                  ),
                ),
                Expanded(
                  child: Container(
                      height: 70,
                      color: Colors.yellow[100],
                      padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                        onPressed: () => onNumberPressed('3'), child: Text('3', style: TextStyle(fontSize: 30))),
                  ),
                ),
                Expanded(
                  child: Container(
                      height: 70,
                      color: Colors.yellow[100],
                      padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                        onPressed: () => onOperatorPressed('+'), child: Text('+', style: TextStyle(fontSize: 30))),
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.yellow[100],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                      height: 70,
                      color: Colors.yellow[100],
                      padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                        onPressed: () => onNumberPressed('4'), child: Text('4', style: TextStyle(fontSize: 30))),
                  ),
                ),
                Expanded(
                  child: Container(
                      height: 70,
                      color: Colors.yellow[100],
                      padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                        onPressed: () => onNumberPressed('5'), child: Text('5', style: TextStyle(fontSize: 30))),
                  ),
                ),
                Expanded(
                  child: Container(
                      height: 70,
                      color: Colors.yellow[100],
                      padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                        onPressed: () => onNumberPressed('6'), child: Text('6', style: TextStyle(fontSize: 30))),
                  ),
                ),
                Expanded(
                  child: Container(
                      height: 70,
                      color: Colors.yellow[100],
                      padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                        onPressed: () => onOperatorPressed('-'), child: Text('-', style: TextStyle(fontSize: 30))),
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.yellow[100],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                      height: 70,
                      color: Colors.yellow[100],
                      padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                        onPressed: () => onNumberPressed('7'), child: Text('7', style: TextStyle(fontSize: 30))),
                  ),
                ),
                Expanded(
                  child: Container(
                      height: 70,
                      color: Colors.yellow[100],
                      padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                        onPressed: () => onNumberPressed('8'), child: Text('8', style: TextStyle(fontSize: 30))),
                  ),
                ),
                Expanded(
                  child: Container(
                      height: 70,
                      color: Colors.yellow[100],
                      padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                        onPressed: () => onNumberPressed('9'), child: Text('9', style: TextStyle(fontSize: 30))),
                  ),
                ),
                Expanded(
                  child: Container(
                      height: 70,
                      color: Colors.yellow[100],
                      padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                        onPressed: () => onOperatorPressed('x'), child: Text('x', style: TextStyle(fontSize: 30))),
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.yellow[100],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Container(
                      height: 70,
                      color: Colors.yellow[100],
                      padding: const EdgeInsets.all(5),
                      child: ElevatedButton(
                          onPressed: () => onNumberPressed('0'), child: Text('0', style: TextStyle(fontSize: 30))),
                    ),
                ),
                Expanded(
                    child: Container(
                      height: 70,
                      color: Colors.yellow[100],
                      padding: const EdgeInsets.all(5),
                      child: ElevatedButton(
                          onPressed: () => onOperatorPressed('/'), child: Text('/', style: TextStyle(fontSize: 30))),
                    ),
                ),
                Expanded(
                  child: Container(
                      height: 70,
                      color: Colors.yellow[100],
                      padding: const EdgeInsets.all(5),child: ElevatedButton(onPressed: clearAll, child: const Text('C', style: TextStyle(fontSize: 30)))),
                ),
                Expanded(
                    child: Container(
                      height: 70,
                      color: Colors.yellow[100],
                      padding: const EdgeInsets.all(5),
                      child: ElevatedButton(
                          onPressed: calculateResult, child: const Text('=', style: TextStyle(fontSize: 30))),
                    ),
                ),
              ],
            ),
            Container(
              color: Colors.yellow[100],
              padding: EdgeInsets.all(20),
            ),
          ],
        ),
      ),
    );
  }
}
// Change result to be more visible, add visual clues
// change buttons to be bigger and add padding at the bottom.