import 'dart:async';

import 'package:calculator/constants.dart';
import 'package:calculator/models/calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  Map<String, bool> buttonStates = {}; // for button states

  void handleTap(String text) {
    setState(() {
      buttonStates[text] = true;
    });
    // for provider call
    Provider.of<CalculatorProvider>(context, listen: false).setValue(text);
    // for button color movement
    Timer(const Duration(milliseconds: 350), () {
      setState(() {
        buttonStates[text] = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) => Consumer<CalculatorProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // for displaying total
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      textAlign: TextAlign.left,
                      provider.displayText,
                      style: const TextStyle(
                        fontSize: 100,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      numberSymbolButton(
                        numberBgColor,
                        'AC',
                        Colors.black87,
                      ),
                      numberSymbolButton(
                        numberBgColor,
                        '+/-',
                        Colors.black87,
                      ),
                      numberSymbolButton(
                        numberBgColor,
                        '%',
                        Colors.black87,
                      ),
                      numberSymbolButton(
                        symbolBgColor,
                        '/',
                        Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      numberSymbolButton(
                        numberBgColor2,
                        '7',
                        Colors.white,
                      ),
                      numberSymbolButton(
                        numberBgColor2,
                        '8',
                        Colors.white,
                      ),
                      numberSymbolButton(
                        numberBgColor2,
                        '9',
                        Colors.white,
                      ),
                      numberSymbolButton(
                        symbolBgColor,
                        'X',
                        Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      numberSymbolButton(
                        numberBgColor2,
                        '4',
                        Colors.white,
                      ),
                      numberSymbolButton(
                        numberBgColor2,
                        '5',
                        Colors.white,
                      ),
                      numberSymbolButton(
                        numberBgColor2,
                        '6',
                        Colors.white,
                      ),
                      numberSymbolButton(
                        symbolBgColor,
                        '-',
                        Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      numberSymbolButton(
                        numberBgColor2,
                        '1',
                        Colors.white,
                      ),
                      numberSymbolButton(
                        numberBgColor2,
                        '2',
                        Colors.white,
                      ),
                      numberSymbolButton(
                        numberBgColor2,
                        '3',
                        Colors.white,
                      ),
                      numberSymbolButton(
                        symbolBgColor,
                        '+',
                        Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: numberBgColor2,
                          padding: const EdgeInsets.fromLTRB(35, 14, 128, 14),
                        ),
                        onPressed: () {},
                        child: const Text(
                          '0',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      numberSymbolButton(
                        numberBgColor2,
                        '.',
                        Colors.white,
                      ),
                      numberSymbolButton(
                        symbolBgColor,
                        '=',
                        Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

  Widget numberSymbolButton(
    Color color,
    String text,
    Color textColor,
  ) {
    bool isChange = buttonStates[text] ?? false;
    return GestureDetector(
      onTap: () => handleTap(text),
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:  isChange ? Colors.white38 : color,
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
