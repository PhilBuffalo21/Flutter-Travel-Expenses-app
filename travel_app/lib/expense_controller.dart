import 'package:flutter/material.dart';
import 'package:travel_app/new_expense.dart';
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
  void _addButtonOverlay() {
    showModalBottomSheet(
        //isScrollControlled: true,
        context: context,
        builder: (context) => newExpense(
              addExpenseFunc: addExpense,
            ));
  }

  void addExpense(Expense e) {
    setState(() {
      expenseList.add(e);
    });
  }

  void removeExpense(Expense e) {
    final itemIndex = expenseList.indexOf(e);
    setState(() {
      expenseList.remove(e);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Expense deleted"),
      duration: const Duration(minutes: 10),
      action: SnackBarAction(
          label: "redo ${e.title}?",
          onPressed: () {
            setState(() {
              expenseList.insert(itemIndex, e);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget defaultScreen =
        // default screen when there isn't an item in the expense list.
        const Center(
      child: Text("aint nothing to see here."),
    );
    if (expenseList.isNotEmpty) {
      defaultScreen = expensesList(
        allExpenses: expenseList,
        removeExpenseFunction: removeExpense,
      );
    }
    ;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to the app"),
        actions: [
          IconButton(onPressed: _addButtonOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          const Text("Chart goes here"),
          Expanded(child: defaultScreen)
        ],
      ),
    );
  }
}
