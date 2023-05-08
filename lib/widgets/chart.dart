import 'dart:ffi';

import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  const Chart(this.recentTransactions, {super.key});

  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupedTransactionValues{
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      print(weekDay);

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
    }).reversed.toList();
  }

  /*datestrings.sort((a, b){ //sorting in ascending order
  return DateTime.parse(a).compareTo(DateTime.parse(b));
  });

  print(datestrings);*/

  double get _totalWeeklyExpenses{
    return groupedTransactionValues.fold(0.0, (previousValue, element) {
      return previousValue + double.parse(element['amount'].toString());
    });

  }
  
  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Container(
          height: 250,
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionValues.map((e) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    e['day'].toString(),
                    double.parse(e['amount'].toString()),
                    _totalWeeklyExpenses == 0.0 ? 0.0 : double.parse((e['amount'].toString()))/_totalWeeklyExpenses
                ),
              );
            }).toList()
          ),
        ),
      ),
    );
  }
}
