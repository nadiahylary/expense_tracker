import 'dart:ffi';

import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'new_transaction.dart';
import 'transactions_list.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

  final List<Transaction> _userTransactions = [
    Transaction(
        id: "#NT0",
        title: "Weekly Groceries",
        amount: 18.25,
        date: DateTime.now()),
    Transaction(
        id: "#NT1", title: "Hair Styling", amount: 24.99, date: DateTime.now()),
    Transaction(
        id: "#NT2",
        title: "Monthly transport fair",
        amount: 31.60,
        date: DateTime.now()),
    Transaction(
        id: "#NT3",
        title: "Jim Rohn Books",
        amount: 58.45,
        date: DateTime.now()),
  ];
  void _addTransaction(String title, double amount){
    final Transaction transaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now()
    );
    setState(() {
      _userTransactions.add(transaction);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(),
        TransactionList(_userTransactions),
      ],
    );
  }
}
