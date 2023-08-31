import 'package:flutter/material.dart';

import '../button_values.dart';

Color getBtnColor(value) {
  return [Btn.del, Btn.clr].contains(value)
      ? Colors.blueGrey
      : [
          Btn.per,
          Btn.multiply,
          Btn.subtract,
          Btn.divide,
          Btn.calculate,
          Btn.add,
        ].contains(value)
          ? Colors.orange
          : Colors.black;
}
