import 'package:flutter/material.dart';

class AddMoneyButton extends StatelessWidget {
  final VoidCallback addMoneyFunction;

  const AddMoneyButton({super.key, required this.addMoneyFunction});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink,
          minimumSize: const Size(double.infinity, 0),
        ),
        onPressed: addMoneyFunction,
        child: const Text('Click here', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
