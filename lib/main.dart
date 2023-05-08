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
        fontFamily: 'Changa',
        textTheme: ThemeData.dark().textTheme.copyWith(
              titleLarge: TextStyle(
                fontFamily: 'Changa',
                fontWeight: FontWeight.bold,
                color: Colors.brown,
                fontSize: 20,
              ),
              labelLarge: TextStyle(
                fontFamily: 'Changa',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
              bodyLarge: TextStyle(
                fontFamily: 'Changa',
                fontWeight: FontWeight.w600,
                color: Colors.deepOrangeAccent,
                fontSize: 18,
              ),
              bodyMedium: TextStyle(
                fontFamily: 'Changa',
                fontWeight: FontWeight.normal,
                color: Colors.teal,
                fontSize: 15,
              ),
              titleSmall: TextStyle(
                fontFamily: 'Changa',
                fontWeight: FontWeight.w300,
                color: Colors.teal,
                fontSize: 13,
              ),
            ),
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                fontFamily: 'Changa',
                fontSize: 20,
                fontWeight: FontWeight.w800)),
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

  void _addTransaction(String title, double amount, DateTime selectedDate) {
    final Transaction transaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: selectedDate);
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
        actions: <Widget>[
          IconButton(
            onPressed: () => _displayAddForm(context),
            icon: Icon(
              Icons.add,
              //color: Colors.deepOrangeAccent,
              size: 30.0,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                size: 30.0,
              ))
        ],
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
          size: 30.0,
        ),
      ),
    );
  }
}
