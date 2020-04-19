import 'package:flutter/material.dart';
import 'package:mero_kharcha/widgets/new_transaction.dart';
import 'widgets/transaction_list.dart';
import 'models/transactions.dart';
import './widgets/user_transaction.dart';

void main() {
  runApp((MyHomePage()));
}

class MyHomePage extends StatelessWidget {
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Mero Kharcha')),
        ),
        body: SingleChildScrollView(
          child: Column(
//          mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  elevation: 6,
                  color: Colors.purple,
                  child: Center(
                    child: Text(
                      'Chart',
                    ),
                  ),
                ),
              ),
              UserTransaction(),
            ],
          ),
        ),
      ),
    );
  }
}
