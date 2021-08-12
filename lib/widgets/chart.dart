import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart({this.recentTransactions});


  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {

      final weekDay = DateTime.now().subtract(Duration(days: index));

      double sum = 0.0;

      for(var i in recentTransactions) {
        if(i.dateTime.day == weekDay.day && 
          i.dateTime.month == weekDay.month &&
          i.dateTime.year == weekDay.year
        ) {
          sum += i.amount;
        }
      }
    print(DateFormat.E().format(weekDay).toString());
    print(sum.toString());
      return {'day': DateFormat.E().format(weekDay), 'amount':sum};
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactions.fold(0.0, (previousValue, element) => previousValue + element["amount"]);
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactions);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child:Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTransactions.map((data) {
          // return Text("${data["day"]}: ${data["amount"]} ");
          return ChartBar(
            spendingAmount: data["amount"],
            label: data["day"],
            spendingAmountPercent: totalSpending == 0.0 ? 0 : (data["amount"] as double)/totalSpending,
          );
        }).toList()
      )
    );
  }
}