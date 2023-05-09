import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction(this.addHandler, {super.key});

  final Function addHandler;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  var _selectedDate;

  void _submittedTrans() {
    print('in submittedTrans');
    final inputTitle = _titleController.text;
    final inputAmt = double.parse(_amountController.text);

    if (inputTitle.isEmpty || inputAmt <= 0 || _selectedDate == null) {
      print('errr');
      return;
    }

    widget.addHandler(
        _titleController.text, double.parse(_amountController.text), _selectedDate);
    Navigator.of(context).pop();
  }

  void _datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if(pickedDate == null) {
        return;
      }
      else{
        setState(() {
          _selectedDate = pickedDate;
        });

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: <
            Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Expense motif'),
            controller: _titleController,
            onSubmitted: (_) => _submittedTrans(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount of the expense'),
            controller: _amountController,
            keyboardType: TextInputType.number,
            //numberWithOptions(decimal: true), if building for iOS too
            onSubmitted: (_) => _submittedTrans(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Container(
            height: 70,
            child: Row(
              children: <Widget>[
                //Expanded( child: ),
                  Text( _selectedDate == null ? "No date chosen" : DateFormat.yMMMd().format(_selectedDate),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                  onPressed: _datePicker,
                  child: Text(
                    'Chose a date',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black12),
                    foregroundColor: MaterialStatePropertyAll(Colors.brown),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton( //TODO change button position to the center of the form
            onPressed: _submittedTrans,
            child: Text(
              'Add Expense',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            style: ElevatedButton.styleFrom(
              //alignment: Alignment(-10, 0), //align button in center
              backgroundColor: Colors.deepOrangeAccent,
              //textStyle: TextStyle(fontWeight: FontWeight.w600)
            ),
          ),
        ]),
      ),
    );
  }
}
