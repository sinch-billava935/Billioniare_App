import 'package:billioniare_app/add_money_button.dart';
import 'package:billioniare_app/balance_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//in flutter we represent strings in single codes 'hello'
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double balance = 0;

  void addMoney() async {
    setState(() {
      //to get the dynamic change of balance in the app
      balance += balance + 500;
    });

    // Obtain shared preferences from pub.dev
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(
      'balance',
      balance,
    ); //2 parameters, 1 for key for setting the value, 2 is the actual value
    if (kDebugMode) {
      print(balance);
    }
  }

  @override
  void initState() {
    loadBalance();
    super.initState();
  }

  void loadBalance() async {
    //this will read the value which is stored in 'balance'
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //?? is to assign the alternate value
    setState(() {
      balance =
          prefs.getDouble('balance') ??
          0; //?? refers if it is able to refer any value in balnce then fine or else its 0
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Billioniare App!'),
          backgroundColor: Colors.pink[200],
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          color: Colors.pink[50],
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BalanceView(balance: balance),
              AddMoneyButton(addMoneyFunction: addMoney),
            ],
          ),
        ),
      ),
    );
  }
}

//to understand flex,expanded concept for row we have this below code
// Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     flex: 1,
//                     child: Container(color: Colors.red, child: Text("1")),
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                       color: Colors.greenAccent,
//                       child: Text("2"),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 1,
//                     child: Container(
//                       color: Colors.blueAccent,
//                       child: Text("3"),
//                     ),
//                   ),
//                 ],
//               ),
