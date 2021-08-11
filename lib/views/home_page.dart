import 'package:expense_planner/widgets/chart.dart';
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

  List<Transaction> get _recentTransactions {
    return _userTransactions
        .where((element) => element.dateTime
            .isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  void _addNewTransaction(String title, double amount, DateTime seletecdDate) {
    final _newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        dateTime: seletecdDate);

    setState(() {
      _userTransactions.add(_newTransaction);
    });
  }

  void _startAddingNewTransaction(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8))),
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

  void _deleteNewTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
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
                // height: 200,
                child: Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 20),
                    elevation: 4.0,
                    child: Chart(
                      recentTransactions: _recentTransactions,
                    )),
              ),
              TransactionList(
                userTransactions: _userTransactions,
                deleteTx: _deleteNewTransaction,
              )
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _startAddingNewTransaction(context);
        },
      ),
    );
  }
}
