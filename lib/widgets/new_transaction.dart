import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mero_kharcha/models/constants.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime _pickedDate;

  void _submitData() {
    if (_titleController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    final pickedDate = _pickedDate;

    if (enteredTitle.isEmpty || enteredAmount <= 0 || pickedDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      pickedDate,
    );

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
        _pickedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 400,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
                // onChanged: (val) {
                //   titleInput = val;
                // },
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
                // onChanged: (val) => amountInput = val,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(_pickedDate == null
                    ? 'No Date Chosen!'
                    : 'Picked Date: ${DateFormat.yMMMd().format(_pickedDate)}'),
                FlatButton(
                  textColor: kChooseDateColor,
                  child: Text(
                    'Choose Date',
                    style: kChooseDateTextStyle,
                  ),
                  onPressed: _presentDatePicker,
                )
              ],
            ),
            RaisedButton(
              color: kAddTransactionColor,
              child: Text(
                'Add Transaction',
                style: kAppBarTextStyle,
              ),
              textColor: Colors.white,
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}
