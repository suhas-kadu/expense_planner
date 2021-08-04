import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NewTransaction extends StatelessWidget {
  final TextEditingController titleController = new TextEditingController();
  final TextEditingController amountController = new TextEditingController();
  final Function addNewTx;

  NewTransaction({this.addNewTx});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              autocorrect: true,
              decoration: InputDecoration(hintText: "Title"),
              controller: titleController,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              autocorrect: true,
              decoration: InputDecoration(hintText: "Amount"),
              controller: amountController,
            ),
            Container(
              margin: const EdgeInsets.all(16.0),
              child: TextButton(
                child: Text("Add Transaction"),
                onPressed: () {
                  double amount = double.tryParse(amountController.text);
                  print("amount: " + amount.toString());
                  if (amount != null) {
                    addNewTx(titleController.text, amount);
                  } else {
                    return Fluttertoast.showToast(
                        msg: "Price cannot contain letters",
                        backgroundColor: Colors.grey.shade100,
                        textColor: Colors.black,
                        toastLength: Toast.LENGTH_LONG,
                        fontSize: 16.0);
                  }

                  print("${titleController.text}\n${amountController.text}");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
