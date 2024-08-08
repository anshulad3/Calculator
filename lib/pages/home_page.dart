import 'package:calculator/utils/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // USER INPUT QUES
  String userQuestion = '';

  // USER OUTPUT
  String userAnswer = '';

  // ARRAY FOR BUTTONS
  final List<String> buttons = [
    'AC',
    'π',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'C',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // U S E R  O U T P U T
          Expanded(
            child: Container(
              color: Colors.grey.shade100,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userQuestion,
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userAnswer,
                        style: TextStyle(
                            color: Colors.blue.shade800,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // U S E R   I N P U T
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey.shade100,
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  return MyButton(
                    buttonTapped: () {
                      setState(() {
                        if (index == 0) {
                          userQuestion = '';
                          userAnswer = '';
                        } else if (index == 18) {
                          if (userQuestion.isNotEmpty) {
                            userQuestion = userQuestion.substring(
                                0, userQuestion.length - 1);
                          } else {
                            userAnswer = '';
                          }
                        } else if (index == 19) {
                          if (userQuestion.isNotEmpty ||
                              (userQuestion.length == 1 &&
                                  userQuestion[0] != '-')) {
                            equalPressed();
                          }
                        } else if (userQuestion.isEmpty &&
                            (buttons[index] == 'π' ||
                                buttons[index] == '%' ||
                                buttons[index] == '/' ||
                                buttons[index] == 'x' ||
                                buttons[index] == '+' ||
                                buttons[index] == '=')) {
                        } else {
                          userQuestion += buttons[index];
                        }
                      });
                    },
                    color: Colors.grey.shade300,
                    textcolor: isoperator(buttons[index])
                        ? Colors.blue[900]
                        : Colors.grey.shade800,
                    buttonText: buttons[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isoperator(String x) {
    if (x == 'AC' ||
        x == 'π' ||
        x == '%' ||
        x == '/' ||
        x == 'x' ||
        x == '-' ||
        x == '+' ||
        x == '=' ||
        x == 'C') {
      return true;
    } else {
      return false;
    }
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    finalQuestion = finalQuestion.replaceAll('π', '3.14159265359');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}
