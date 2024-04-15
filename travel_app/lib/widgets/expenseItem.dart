import 'package:flutter/material.dart';
import 'package:travel_app/models/expense.dart';

class expenseItem extends StatelessWidget {
  expenseItem({super.key, required this.expense});
  Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(expense.title)),
    );
  }
}
