import 'package:expense_planner/widgets/user_transaction.dart';
import 'package:flutter/material.dart';
import '../widgets/new_transaction.dart';

class HomePage extends StatelessWidget {
  final titleController = new TextEditingController();
  final amountController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Planner"),
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
              UserTransaction()
            ]),
      ),
    );
  }
}

