import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mero_kharcha/models/constants.dart';
import '../models/transaction.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    'No kharcha added yet!',
                    style: kChartTextStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 300,
                    child: Image.asset(
                      'images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    color: kTxCardBgColor,
                    elevation: 8,
                    margin: EdgeInsets.all(6),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: kCircleAvatarColor,
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: FittedBox(
                            child: Text('\$${transactions[index].amount}',
                                style: kCircleAvatarAmountTextStyle),
                          ),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: kTxCardTitleTextStyle,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                        style: kTxCardDateTextStyle,
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          return showDialog(
                            context: context,
                            barrierDismissible: true, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                elevation: 50,
                                title: Center(
                                    child: Text(
                                  'Are you sure to delete ?',
                                  style: kAlertTextStyle,
                                )),
                                actions: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      FlatButton(
                                          child: Text('No',
                                              style: kAlertTextStyle),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          }),
                                      FlatButton(
                                          child: Text(
                                            'Yes',
                                            style: kAlertTextStyle,
                                          ),
                                          onPressed: () {
                                            deleteTx(transactions[index].id);
                                            Navigator.of(context).pop();
                                          }),
                                    ],
                                  )
                                ],
                              );
                            },
                          );
                        },
                        icon: Icon(
                          FontAwesomeIcons.trash,
                          color: kDeleteIconColor,
                        ),
                      ),
                    ),
                  );
                },
              ));
  }
}
// () => deleteTx(transactions[index].id),
