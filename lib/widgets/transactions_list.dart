import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transactions, {super.key});
  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      border: Border.all(
                        color: Colors.deepOrangeAccent,
                        width: 1,
                      )),
                  child: Text(
                    "\$${tx.amount.toString()}",
                    //'\$'+ tx.amount.toString()
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
                        )),
                    Text(DateFormat.yMMMd().format(tx.date),
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          color: Colors.brown,
                        )),
                  ],
                )
              ],
            ),
          );
        }).toList());
  }
}
