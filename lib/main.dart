import 'package:expense_tracker/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final List<Transaction> transactions = [
    Transaction(
        id: "#NT0",
        title: "Weekly Groceries",
        amount: 18.25,
        date: DateTime.now()
    ),
    Transaction(
        id: "#NT1",
        title: "Hair Styling",
        amount: 24.99,
        date: DateTime.now()
    ),
    Transaction(
        id: "#NT2",
        title: "Monthly transport fair",
        amount: 31.60,
        date: DateTime.now()
    ),
    Transaction(
        id: "#NT3",
        title: "Jim Rohn Books",
        amount: 58.45,
        date: DateTime.now()
    ),
  ];
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: const Card(
              elevation: 5,
              color: Colors.deepOrangeAccent,
              child: Text("Expenses Chart",),
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 80,
                      height: 60,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.deepOrangeAccent,
                          width: 1,
                          )),
                      child: Text(
                        "\$${tx.amount.toString()}", //'\$'+ tx.amount.toString()
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Text(tx.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.teal,
                          )
                      ),
                      Text(DateFormat.yMMMd().format(tx.date),
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 13,
                            color: Colors.brown,
                          )
                      ),
                      ],
                    )
                  ],
                ),
              );
            }).toList()
          )
        ],
      ),
    );
  }
}
