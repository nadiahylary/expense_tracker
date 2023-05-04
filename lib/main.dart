import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/widgets/chart.dart';
import 'package:expense_tracker/widgets/new_transaction.dart';
import 'package:expense_tracker/widgets/transactions_list.dart';
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
      title: 'Personal Expense Tracker',
      theme: ThemeData(
          primarySwatch: Colors.brown,
          fontFamily: 'Ubuntu',
          textTheme: ThemeData.dark().textTheme.copyWith(
                titleLarge: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ),
                bodyLarge: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent,
                  fontSize: 18,
                ),
                bodyMedium: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.normal,
                  color: Colors.teal,
                  fontSize: 18,
                ),
              ),
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 20,
                  fontWeight: FontWeight.bold))
          //colorScheme: ColorScheme.dark(),
          ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    /*Transaction(
        id: "#NT2",
        title: "Gym Trimester Membership",
        amount: 64.60,
        date: DateTime.now()),
    Transaction(
        id: "#NT3",
        title: "Jim Rohn Books",
        amount: 58.45,
        date: DateTime.now()),*/
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }

  void _addTransaction(String title, double amount) {
    final Transaction transaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());
    setState(() {
      _userTransactions.add(transaction);
    });
  }

  void _deleteExpense(int index) {
    setState(() {
      _userTransactions.removeAt(index);
    });
  }

  void _displayAddForm(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Expense Tracker"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_userTransactions, _deleteExpense),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayAddForm(context),
        child: Icon(
          Icons.add,
          //color: Colors.deepOrangeAccent,
          size: 35.0,
        ),
      ),
    );
  }
}
