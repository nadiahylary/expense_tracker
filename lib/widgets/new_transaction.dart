import 'package:flutter/material.dart';


class NewTransaction extends StatelessWidget {
  NewTransaction(this.addHandler, {super.key});
  final Function addHandler;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Expense motif'),
                controller: titleController,
              ),
              TextField(
                decoration:
                InputDecoration(labelText: 'Amount of the expense'),
                controller: amountController,
              ),
              ElevatedButton(
                onPressed: (){
                  addHandler(titleController.text, amountController.text);
                },
                child: Text('Add Expense'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                    foregroundColor: Colors.black,
                    textStyle: TextStyle(fontWeight: FontWeight.w500)),
              ),
            ]
        ),
      ),
    );
  }
}
