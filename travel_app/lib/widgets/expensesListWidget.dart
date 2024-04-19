import 'package:flutter/material.dart';
import 'package:travel_app/models/expense.dart';
import 'package:travel_app/widgets/expenseItem.dart';

class expensesList extends StatelessWidget {
  expensesList(
      {super.key,
      required this.allExpenses,
      required this.removeExpenseFunction});
  final Function(Expense e) removeExpenseFunction;
  List<Expense> allExpenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: allExpenses.length,
        itemBuilder: (listContext, index) => Dismissible(
            onDismissed: (direction) =>
                removeExpenseFunction(allExpenses[index]),
            key: ValueKey(allExpenses[index].id),
            background: Container(
              color: Theme.of(context).colorScheme.error,
              margin: Theme.of(context).cardTheme.margin,
            ),
            child: expenseItem(expense: allExpenses[index])));
  }
}
