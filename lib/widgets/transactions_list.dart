import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transactions, this.deleteExpense, {super.key});

  final List<Transaction> transactions;
  final Function deleteExpense;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Container(
                  height: 200,
                  margin: EdgeInsets.only(top: 30),
                  child: Image.asset(
                    "assets/images/empty-shopping-cart.png", //processing.gif",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "You have no expenses yet.",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 10,
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: FittedBox(
                            child: Text('\$${transactions[index].amount}'))),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(DateFormat.yMMMd()
                      .format(transactions[index].date),
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 13,
                        color: Colors.deepOrangeAccent,
                      )
                  ),
                  trailing: IconButton(
                    //color: Colors.deepOrangeAccent,
                    onPressed: () => deleteExpense(index),
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).primaryColorDark,
                      size: 32.0,
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
/*
Alternative to ListTile
Container(
                  width: double.infinity,
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 80,
                          height: 60,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            border: Border.all(
                              color: Colors.deepOrangeAccent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            //backgroundBlendMode:
                          ),
                          child: Text(
                            "\$${transactions[index].amount}", //.toStringAsFixed(2)
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            FittedBox(
                              child: Text(
                                transactions[index].title,
                                style: Theme.of(context).textTheme.titleLarge,
                                /*style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.teal,
                          )*/
                              ),
                            ),
                            Text(
                                DateFormat.yMMMd()
                                    .format(transactions[index].date),
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13,
                                  color: Colors.deepOrangeAccent,
                                )),
                          ],
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              IconButton(
                                //color: Colors.deepOrangeAccent,
                                onPressed: () => deleteExpense(index),
                                icon: Icon(
                                  Icons.delete,
                                  color: Theme.of(context).primaryColorDark,
                                  size: 32.0,
                                ),
                              ),
                            ])
                      ],
                    ),
                  ),
                );
 */
/*
Alternative to ListView.builder
child: ListView(
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
          }).toList()),*/
