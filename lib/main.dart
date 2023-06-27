import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '0';
  double _num1 = 0;
  double _num2 = 0;
  String _operator = '';
  bool _isOperatorClicked = false;

  void _onNumberClick(String value) {
    setState(() {
      if (_output == '0' && value != '.') {
        _output = value;
      } else if (value == '.') {
        if (!_output.contains('.')) {
          _output += value;
        }
      } else {
        _output += value;
      }
    });
  }

  void _onOperatorClick(String operator) {
    setState(() {
      _num1 = double.parse(_output);
      _operator = operator;
      _output = '0';
      _isOperatorClicked = true;
    });
  }

  void _onEqualClick() {
    setState(() {
      _num2 = double.parse(_output);
      switch (_operator) {
        case '+':
          _output = (_num1 + _num2).toString();
          break;
        case '-':
          _output = (_num1 - _num2).toString();
          break;
        case '*':
          _output = (_num1 * _num2).toString();
          break;
        case '/':
          _output = (_num1 / _num2).toString();
          break;
      }
      _num1 = 0;
      _num2 = 0;
      _operator = '';
      _isOperatorClicked = false;
    });
  }

  void _onClearClick() {
    setState(() {
      _output = '0';
      _num1 = 0;
      _num2 = 0;
      _operator = '';
      _isOperatorClicked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Divider(height: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildOperatorButton('/'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildOperatorButton('*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildOperatorButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('.'),
              _buildButton('0'),
              _buildEqualButton(),
              _buildOperatorButton('+'),
            ],
          ),
          SizedBox(height: 16),
          _buildClearButton(),
        ],
      ),
    );
  }

  Widget _buildButton(String text) {
    return ElevatedButton(
      onPressed: () => _onNumberClick(text),
      child: Text(text),
    );
  }

  Widget _buildOperatorButton(String text) {
    return ElevatedButton(
      onPressed: () => _onOperatorClick(text),
      child: Text(text),
    );
  }

  Widget _buildEqualButton() {
    return ElevatedButton(
      onPressed: _onEqualClick,
      child: Text('='),
    );
  }

  Widget _buildClearButton() {
    return ElevatedButton(
      onPressed: _onClearClick,
      child: Text('Clear'),
    );
  }
}
