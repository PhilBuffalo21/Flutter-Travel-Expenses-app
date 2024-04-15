import 'package:flutter/material.dart';
import 'package:travel_app/models/expense.dart';

class expenseItem extends StatelessWidget {
  expenseItem({super.key, required this.expense});
  Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            children: [
              Text(expense.title),
              Row(
                children: [
                  Row(
                    children: [
                      Text("\$ ${expense.amount.toStringAsFixed(2)}"),
                      const SizedBox(width: 30),
                      Row(
                        children: [
                          const Icon(Icons.fastfood),
                          Text(expense.date.toString())
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
