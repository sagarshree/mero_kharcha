import 'package:flutter/material.dart';
import 'package:mero_kharcha/widgets/new_transaction.dart';
import 'widgets/transaction_list.dart';
import 'models/transactions.dart';
import './widgets/user_transaction.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(
      DevicePreview(
        builder: (context) => MyHomePage(),
      ),
    );

class MyHomePage extends StatelessWidget {
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.of(context).locale, // <--- Add the locale
      builder: DevicePreview.appBuilder, // <--- Add the builder
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
              ),
            )
          ],
          backgroundColor: Colors.purple,
          title: Text('Mero Kharcha'),
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
                  color: Colors.blueAccent,
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
        floatingActionButton: FloatingActionButton(
          child: Icon(FontAwesomeIcons.plus),
          onPressed: () {},
        ),
      ),
    );
  }
}
