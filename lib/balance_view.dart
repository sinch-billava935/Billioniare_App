import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BalanceView extends StatelessWidget {
  double balance;
  BalanceView({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Bank Balance:'),
          SizedBox(height: 20),
          Text(
            '\$ $balance',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          // OutlinedButton(  //button that triggers to balance stored locally to handle button not to be shown we use initstate()
          //   onPressed: loadBalance,
          //   child: Text('Load Balance'),
          // ),
        ],
      ),
    );
  }
}
