import 'package:expense_planner/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List _userTransactions = <Transaction>[
    Transaction(
        id: "t1", title: "Product 1", amount: 5.55, dateTime: DateTime.now()),
    
  ];

  void _addNewTransaction(String title, double amount) {
    final _newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        dateTime: DateTime.now());

  setState(() {
    _userTransactions.add(_newTransaction);
  });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(
          addNewTx: _addNewTransaction,
        ),
        TransactionList(
          userTransactions: _userTransactions,
        ),
      ],
    );
  }
}
