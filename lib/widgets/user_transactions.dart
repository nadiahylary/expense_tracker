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


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        /*NewTransaction(_addTransaction),
        TransactionList(_userTransactions, _deleteExpense),*/
      ],
    );
  }
}
