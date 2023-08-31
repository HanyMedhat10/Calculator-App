  import 'package:flutter/material.dart';

import '../button_values.dart';

Widget buildButton(String value) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        color: [Btn.del, Btn.clr].contains(value)
            ? Colors.blueGrey
            : [
                Btn.per,
                Btn.multiply,
                Btn.subtract,
                Btn.divide,
                Btn.calculate,
              ].contains(value)? Colors.orange:Colors.black,
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: Colors.white24,
          ),
        ),
        child: InkWell(
          onTap: () {},
          child: Center(
            child: Text(value),
          ),
        ),
      ),
    );
  }
