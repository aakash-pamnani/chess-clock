
import 'package:flutter/material.dart';

import 'package:numberpicker/numberpicker.dart';

class PickerDailog extends StatelessWidget {
  const PickerDailog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<CustomNumberPickerState>();
    return AlertDialog(
      title: const Text("Select Timer"),
      content: CustomNumberPicker(1, key: key),
      actions: [
        ElevatedButton(
          onPressed: () {
            
            Navigator.of(context, rootNavigator: true)
                .pop<int>(key.currentState?.currentValue);
          },
          child: const Text("OK"),
        )
      ],
    );
  }
}


class CustomNumberPicker extends StatefulWidget {
  const CustomNumberPicker(
    this.value, {
    Key? key,
  }) : super(key: key);

  final int value;

  @override
  State<CustomNumberPicker> createState() => CustomNumberPickerState();
}



class CustomNumberPickerState extends State<CustomNumberPicker> {
  int _currentValue = 1;

  int get currentValue => _currentValue;
  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      value: currentValue,
      maxValue: 60,
      minValue: 1,
      onChanged: (value) {
        setState(() {
          _currentValue = value;
        });
      },
    );
  }
}
