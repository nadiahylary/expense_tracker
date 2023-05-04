import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction(this.addHandler, {super.key});

  final Function addHandler;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submittedTrans() {
    print('in submittedTrans');
    final inputTitle = titleController.text;
    final inputAmt = double.parse(amountController.text);

    if (inputTitle.isEmpty || inputAmt <= 0) {
      print('errr');
      return;
    }

    widget.addHandler(
        titleController.text, double.parse(amountController.text));
    Navigator.of(context).pop();
  }

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
                onSubmitted: (_) => submittedTrans(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount of the expense'),
                controller: amountController,
                keyboardType: TextInputType.number,
                //numberWithOptions(decimal: true), if building for iOS too
                onSubmitted: (_) => submittedTrans(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              ElevatedButton(
                onPressed: submittedTrans,
                child: Text(
                  'Add Expense',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                style: ElevatedButton.styleFrom(
                    //backgroundColor: Colors.deepOrangeAccent,
                    //foregroundColor: Colors.black,
                    textStyle: TextStyle(fontWeight: FontWeight.w500)),
              ),
            ]),
      ),
    );
  }
}
