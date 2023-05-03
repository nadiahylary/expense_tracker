import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/widgets/new_transaction.dart';
import 'package:expense_tracker/widgets/transactions_list.dart';
import 'package:expense_tracker/widgets/user_transactions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        //colorScheme: ColorScheme.dark(),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  /*late String titleinput;
  late String amountInput;*/

  /*MyHomePage({super.key,
    this.titleinput = titleinput,
    this.amountInput = amountInput}
  );*/

  final titleController = TextEditingController();
  final amountController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: const Card(
              elevation: 5,
              color: Colors.deepOrangeAccent,
              child: Text(
                "Expenses Chart",
              ),
            ),
          ),
          UserTransactions(),
        ],
      ),
    );
  }
}
