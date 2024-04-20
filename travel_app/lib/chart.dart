import 'package:flutter/material.dart';
import 'package:travel_app/models/expense.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});
  final List<Expense> expenses;

  List<ExpenseContainer> get individualExpenses {
    return [
      ExpenseContainer(list: expenses, category: Category.food),
      ExpenseContainer(list: expenses, category: Category.experience),
      ExpenseContainer(list: expenses, category: Category.accommodation),
      ExpenseContainer(list: expenses, category: Category.shopping),
    ];
  }

  // most expensive in all category
  double mostExpensive() {
    double mostExpensiveExpense = expenses[0].amount;
    for (final expense in individualExpenses) {
      if (expense.getSumTotalofExpenses > mostExpensiveExpense) {
        mostExpensiveExpense = expense.getSumTotalofExpenses;
      }
    }
    return mostExpensiveExpense;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [
            Theme.of(context).primaryColor.withOpacity(0.8),
            Theme.of(context).primaryColor.withOpacity(0.2)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (final bucket in individualExpenses)
            Text(bucket.getSumTotalofExpenses.toString())
        ],
      ),
    );
  }
}
