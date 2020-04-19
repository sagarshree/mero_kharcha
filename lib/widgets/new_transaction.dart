import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function newTx;
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();

  NewTransaction(this.newTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleInputController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountInputController,
            ),
            FlatButton(
              child: Text('Add Kharcha'),
              textColor: Colors.purple,
              onPressed: () {
                newTx(
                  titleInputController.text,
                  double.parse(amountInputController.text),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
