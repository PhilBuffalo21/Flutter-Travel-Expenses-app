import 'package:flutter/material.dart';

class newExpense extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _newExpense();
  }
}

class _newExpense extends State<newExpense> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
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
    print(pickedDate);
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
              const Text("Select Date"),
              IconButton(
                  onPressed: openDatePicker,
                  icon: const Icon(Icons.calendar_month)),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {}, child: const Text("Save Expense")),
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
