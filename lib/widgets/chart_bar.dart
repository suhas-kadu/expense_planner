import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingAmountPercent;

  ChartBar({this.label, this.spendingAmount, this.spendingAmountPercent});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
          child: Column(children: [
        Text("\$$spendingAmount"),
        SizedBox(height: 8),
        Container(
          height: 60,
          width: 12,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.5,
                  ),
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingAmountPercent,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  color: Theme.of(context).primaryColor)  
                  ),
                  
              )
            ],
          ),
        ),
        Text(label)
      ]),
    );
  }
}
