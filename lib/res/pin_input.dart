import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var code = "";

class PinInput extends StatelessWidget {
  PinInput({required this.first, required this.last});
  final bool first, last;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        code = code + value;
        //autofill
        if (value.length == 1 && last == false) {
          FocusScope.of(context).nextFocus();
        }
        if (value.length == 0 && first == false) {
          FocusScope.of(context).previousFocus();
        }
      },
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: const InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(255, 147, 210, 243),
          enabledBorder: InputBorder.none),
    );
  }
}
