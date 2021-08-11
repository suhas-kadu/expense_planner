import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTx;

  NewTransaction({this.addNewTx});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController titleController = new TextEditingController();
  final TextEditingController amountController = new TextEditingController();

  void submitData() {
    double amount = double.tryParse(amountController.text);
    print("amount: " + amount.toString());
    if (amount != null && amount >= 0) {
      widget.addNewTx(titleController.text, amount);
      Navigator.of(context).pop();
    } else {
      Fluttertoast.showToast(
          msg: "Price cannot contain letters & should be positive",
          backgroundColor: Colors.grey.shade100,
          textColor: Colors.black,
          toastLength: Toast.LENGTH_LONG,
          fontSize: 16.0);
    }
  }

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
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              autocorrect: true,
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (value) => submitData(),
            ),
            Container(
              margin: const EdgeInsets.all(16.0),
              child: TextButton(
                child: Text("Add Transaction"),
                onPressed: () {
                  submitData();
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
