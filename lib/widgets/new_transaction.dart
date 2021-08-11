import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTx;

  NewTransaction({this.addNewTx});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController titleController = new TextEditingController();
  final TextEditingController amountController = new TextEditingController();
  DateTime selectedDate;

  void submitData() {
    double amount = double.tryParse(amountController.text);
    String titleText = titleController.text;
    // print("amount: " + amount.toString());
    validateData(titleText, amount);
  }

  void validateData(String titleText, double amount) {
    if (titleText == "" && amount == null) {
      Fluttertoast.showToast(
          msg: "Title & Price cannot be empty",
          backgroundColor: Colors.grey.shade100,
          textColor: Colors.black,
          toastLength: Toast.LENGTH_SHORT,
          fontSize: 16.0);
    } else if (titleText == "") {
      Fluttertoast.showToast(
          msg: "Title cannot be empty",
          backgroundColor: Colors.grey.shade100,
          textColor: Colors.black,
          toastLength: Toast.LENGTH_SHORT,
          fontSize: 16.0);
    } else if (amount == null) {
      Fluttertoast.showToast(
          msg: "Price cannot be empty",
          backgroundColor: Colors.grey.shade100,
          textColor: Colors.black,
          toastLength: Toast.LENGTH_SHORT,
          fontSize: 16.0);
    } else if (selectedDate == null) {
      Fluttertoast.showToast(
          msg: "Please select a Date",
          backgroundColor: Colors.grey.shade100,
          textColor: Colors.black,
          toastLength: Toast.LENGTH_SHORT,
          fontSize: 16.0);
    } else if (amount != null && amount >= 0) {
      widget.addNewTx(titleText, amount, selectedDate);
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

  void pickDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(DateTime.now().year),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(selectedDate == null
                      ? "No Date chosen"
                      : "Date: ${DateFormat().add_yMMMd().format(selectedDate)}"),
                  TextButton(onPressed: pickDate, child: Text("Pick a Date"))
                ],
              ),
            ),
            ElevatedButton(
              child: Text("Add Transaction"),
              onPressed: () {
                submitData();
                print("${titleController.text}\n${amountController.text}");
              },
            )
          ],
        ),
      ),
    );
  }
}
