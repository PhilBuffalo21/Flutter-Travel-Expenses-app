import 'package:flutter/material.dart';
import 'package:travel_app/models/expense.dart';

class expensesList extends StatelessWidget {
  expensesList({super.key, required this.allExpenses});

  List<Expense> allExpenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: allExpenses.length,
        itemBuilder: (listContext, index) => Text(allExpenses[index].title));
  }
}
