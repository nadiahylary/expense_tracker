import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar( this.day, this.dailyExpense, this.expensePercentage, {super.key});
  final String day;
  final double dailyExpense;
  final double expensePercentage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 20,
          child: FittedBox(
              child: Text('\$${dailyExpense.toStringAsFixed(1)}')
          ),
        ), // OR Text('${expensePercentage  * 100}%'), To show the daily percentage of all the week expenses
        SizedBox(
          height: 10,
        ),
        Container(
          height: 120,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.brown,
                      width: 1
                  ),
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              FractionallySizedBox(heightFactor: expensePercentage,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(20),
                ),
              ),)
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(day)
      ],
    );
  }
}
