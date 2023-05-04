import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  const Chart(this.recentTransactions, {super.key});

  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupedTransactionValues{
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalExpenses = 0.0;
      for(var i=0; i<recentTransactions.length; i++){
        if(recentTransactions[i].date.day == weekDay.day
            && recentTransactions[i].date.month == weekDay.month
            && recentTransactions[i].date.year == weekDay.year ){
          totalExpenses += recentTransactions[i].amount;
        }
      }
      print(DateFormat.E().format(weekDay).substring(0,1));
      print(totalExpenses);
      return {
        'day': DateFormat.E().format(weekDay).substring(0,1),
        'amount': totalExpenses.toStringAsFixed(2),
      };
    });
  }
  
  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Container(
          //width: double.infinity,
          height: 200,
      child: Card(
        elevation: 5,
          margin: EdgeInsets.all(20),
        child: Row(
          children: groupedTransactionValues.map((e) {
            return Text('${e['day']}: ${e['amount']}');
          }).toList()
        ),
      ),
    );
  }
}
