import 'package:flutter/material.dart';
import 'package:travel_app/models/expense.dart';

class newExpense extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _newExpense();
  }
}

class _newExpense extends State<newExpense> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? chosenDate;
  Category chosenCategory = Category.food;
  @override
  void controllersDisposer() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  void openDatePicker() async {
    final today = DateTime.now();
    final firstDate =
        DateTime(today.year - 10, today.month - 10, today.day - 10);
    final lastDate =
        DateTime(today.year + 10, today.month + 10, today.day + 10);
    final pickedDate = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: lastDate);
    setState(() {
      chosenDate = pickedDate;
    });
  }

  void submitExpenseCheck() {
    final enteredMoneyAmount = double.tryParse(amountController.text);
    final bool isInvalidAmount =
        (enteredMoneyAmount == null || enteredMoneyAmount <= 0);
    final bool isTitleEmpty = titleController.text.trim().isEmpty;
    if (isTitleEmpty || isInvalidAmount || chosenDate == null) {}
    showDialog(
        context: context,
        builder: (dcontext) => AlertDialog(
              title: const Text('Invalid Input'),
              content: const Text('Check your input'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(dcontext);
                    },
                    child: const Text("Close"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            maxLength: 64,
            decoration: const InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  maxLength: 64,
                  decoration: const InputDecoration(
                      label: Text("Amount"), prefixText: "\$"),
                ),
              ),
              const SizedBox(width: 35),
              Text(chosenDate == null
                  ? "Select Date"
                  : dateFormatter
                      .format(chosenDate!)), // '!' to ensure the dart system
              // that the value won't be null at the point where it's used.
              IconButton(
                  onPressed: openDatePicker,
                  icon: const Icon(Icons.calendar_month)),
            ],
          ),
          Row(
            children: [
              const Text("Category"),
              const SizedBox(
                width: 30,
              ),
              DropdownButton(
                  value: chosenCategory,
                  items: Category.values
                      .map((category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toUpperCase()),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    } else {
                      setState(() {
                        chosenCategory = value;
                      });
                    }
                  })
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: submitExpenseCheck,
                  child: const Text("Save Expense")),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"))
            ],
          )
        ],
      ),
    );
  }
}
