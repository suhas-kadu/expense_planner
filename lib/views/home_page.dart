import 'package:flutter/material.dart';
import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';
import '../models/transaction.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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

  void _startAddingNewTransaction(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(8))),
        context: context,
        builder: (context) {
          return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: NewTransaction(
                addNewTx: _addNewTransaction,
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Planner"),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 14.0),
              icon: Icon(Icons.add_box_outlined),
              onPressed: () {
                _startAddingNewTransaction(context);
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 100,
                child: Card(
                  margin: const EdgeInsets.all(16.0),
                  elevation: 4.0,
                  child: Center(
                    child: Text(
                      "Charts",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      // textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              TransactionList(
                userTransactions: _userTransactions,
              )
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {_startAddingNewTransaction(context);},
      ),
    );
  }
}
