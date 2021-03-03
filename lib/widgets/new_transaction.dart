import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function handleOnPressed;

  NewTransaction(this.handleOnPressed);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmoun = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmoun <= 0 || _selectedDate == null) {
      return;
    }
    widget.handleOnPressed(enteredTitle, enteredAmoun, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              TextField(
                  controller: _titleController,
                  decoration: InputDecoration(labelText: 'Title')),
              TextField(
                  onSubmitted: (_) => _submitData(),
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  decoration: InputDecoration(labelText: 'Amount')),
              Row(
                children: [
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No Date Chosen!'
                        : 'Picked date: ${DateFormat.yMd().format(_selectedDate)}'),
                  ),
                  TextButton(
                    onPressed: _presentDatePicker,
                    child: Text(
                      'Chosse date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: _submitData,
                child: Text('Add transaction'),
              )
            ]),
          )),
    );
  }
}
