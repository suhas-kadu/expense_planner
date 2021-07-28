import 'package:flutter/material.dart';
import '../models/transaction.dart';

class HomePage extends StatelessWidget {
  final List transactions = <Transaction>[
    Transaction(
        id: "t1", title: "Product 1", amount: 5.55, dateTime: DateTime.now()),
    Transaction(
        id: "t2", title: "Product 2", amount: 5.75, dateTime: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Planner"),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 250,
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
            Column(
              children: transactions.map((transaction) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "\$ ${transaction.amount}",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              transaction.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                // color: Colors.purple,
                              ),
                            ),
                            Text("Date: ${transaction.dateTime.toString().substring(0,11)}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            )
          ]),
    );
  }
}
