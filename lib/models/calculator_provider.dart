import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class CalculatorProvider extends ChangeNotifier {
  String _displayText = '0';

  String get displayText => _displayText;

  void setValue(String value) {
    if (_displayText == '0' && value != '=') {
      _displayText = value;
    } else {
      switch (value) {
        // function for AC
        case 'AC':
          _displayText = '0';
          break;
        // for multiplication
        case 'X':
          _displayText += '*';
          break;
        // for equal sign
        case '=':
          calculate();
          break;
        default:
          _displayText += value;
      }
    }
    notifyListeners();
  }

  void calculate() {
    try {
      String expression = _displayText.replaceAll('X', '*');
      num result = expression.interpret();
      _displayText = result == result.toInt()
          ? result.toInt().toString()
          : result.toString();
    } catch (e) {
      _displayText = 'Error';
    }
    notifyListeners();
  }
}
