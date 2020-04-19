import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView(
        children: transactions.map((tx) {
          return Card(
              child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple,
                    width: 2,
                  ),
                ),
                child: Text(
                  '\$${tx.amount}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      tx.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMd().format(tx.date),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ));
        }).toList(),
      ),
    );
  }
}
