import 'package:calculator_app/button_values.dart';
import 'package:calculator_app/widget/get_btn_color.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({Key? key}) : super(key: key);
  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  String number1 = ''; //0-9
  String operand = ''; // * - + /
  String number2 = ''; //0-9
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // output
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    '$number1$operand$number2'.isEmpty
                        ? '0'
                        : '$number1$operand$number2',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),
            //buttons
            Padding(
              padding: const EdgeInsets.only(
                left: 4.0,
              ),
              child: Wrap(
                children: Btn.buttonValues
                    .map(
                      (value) => SizedBox(
                        width: value == Btn.n0
                            ? (screenSize.width / 2.05)
                            : (screenSize.width / 4.1),
                        height: screenSize.height / 8.8,
                        child: buildButton(value),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(String value) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        color: getBtnColor(value),
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: Colors.white24,
          ),
        ),
        child: InkWell(
          onTap: () => onBtnTap(value),
          child: Center(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onBtnTap(String value) {
    if (value == Btn.del) {
      delete();
      return;
    }
    if (value == Btn.clr) {
      clearAll();
      return;
    }
    if (value == Btn.per) {
      convertToPercentage();
      return;
    }
    appendsValue(value);
  }

  void delete() {
    if (number2.isNotEmpty) {
      // 12345 => 1234
      number2 = number2.substring(0, number2.length - 1);
    } else if (operand.isNotEmpty) {
      operand = '';
    } else if (number1.isNotEmpty) {
      number1 = number1.substring(0, number1.length - 1);
    }
    setState(() {});
  }

  void appendsValue(String value) {
    // number 1 operand number2
    if (value != Btn.dot && int.tryParse(value) == null) {
      //
      if (operand.isNotEmpty && number2.isNotEmpty) {
        // TODO calculate the equation before assigning new
      }
      operand = value;
    } else if (number1.isEmpty || operand.isEmpty) {
      // "21" "+" "22"
      if (value == Btn.dot && number1.contains(Btn.dot)) return;
      if (value == Btn.dot && number1.isEmpty || number1 == Btn.dot) {
        value = '0.';
      }
      number1 += value;
    } else if (number2.isEmpty || operand.isEmpty) {
      // "21" "+" "22"
      if (value == Btn.dot && number2.contains(Btn.dot)) return;
      if (value == Btn.dot && number2.isEmpty || number2 == Btn.dot) {
        value = '0.';
      }
      number2 += value;
    }
    setState(() {});
  }

  void clearAll() {
    setState(() {
      number1 = '';
      operand = '';
      number2 = '';
    });
  }

  void convertToPercentage() {
    // ex: 434+325
    if (number1.isNotEmpty && operand.isNotEmpty && number2.isNotEmpty) {
      // calculate before conversion
      // TODO
    }
    if (operand.isNotEmpty) {
      // cannot be converted
      return;
    }
    final number = double.parse(number1);
    setState(() {
      number1 = '${(number / 100)}';
      operand = '';
      number2 = '';
    });
  }
}
