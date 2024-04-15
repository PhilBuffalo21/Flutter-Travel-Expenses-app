import 'package:flutter/material.dart';
import 'package:travel_app/widgets/expensesListWidget.dart';
import 'package:travel_app/models/expense.dart';

class Controller extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Controller();
  }
}

class _Controller extends State<Controller> {
  List<Expense> expenseList = [
    Expense(
        title: 'Valentine Dinner',
        amount: 399.99,
        date: DateTime(2024, 2, 14),
        category: Category.food),
    Expense(
        title: 'Concert Tickets',
        amount: 119.99,
        date: DateTime(2024, 3, 1),
        category: Category.experience),
    Expense(
        title: 'New Jacket',
        amount: 89.50,
        date: DateTime(2024, 3, 10),
        category: Category.shopping),
    Expense(
        title: 'Hotel in Rome',
        amount: 250.00,
        date: DateTime(2024, 4, 25),
        category: Category.accommodation),
    Expense(
        title: 'Grocery Shopping',
        amount: 60.30,
        date: DateTime(2024, 5, 2),
        category: Category.food),
    Expense(
        title: 'Museum Donation',
        amount: 50.00,
        date: DateTime(2024, 6, 18),
        category: Category.experience)
  ];
  // Add more expenses as needed];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Travel Expenses"),
          const Text("Chart goes here"),
          Expanded(child: expensesList(allExpenses: expenseList))
        ],
      ),
    );
  }
}
