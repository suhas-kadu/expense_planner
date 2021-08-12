import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTx;

  TransactionList({this.userTransactions, this.deleteTx});

  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? SingleChildScrollView(
                  child: Column(
            children: [
              SizedBox(height:8.0),
              Text(
                "No transactions added yet",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ))
            ]),
        )
        : Container(
            height: MediaQuery.of(context).size.height/1.5,
            child: ListView.builder(
              itemCount: userTransactions.length,
              padding: EdgeInsets.only(bottom: 64.0),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                    margin: const EdgeInsets.all(16.0),
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      leading: CircleAvatar(
                        radius: 30,
                        child: FittedBox(
                            child: Text(
                          "\$${userTransactions[index].amount}",
                        )),
                      ),
                      title: Text(userTransactions[index].title,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(DateFormat()
                          .add_yMMMd()
                          .format(userTransactions[index].dateTime)),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () => deleteTx(userTransactions[index].id),
                      ),
                    )
                    // CustomListTile(userTransactions: userTransactions),
                    );
              },
              // shrinkWrap: true,
            ),
          );
  }
}
