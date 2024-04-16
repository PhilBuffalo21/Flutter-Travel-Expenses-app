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
  void titleControllerDisposer() {
    titleController.dispose();
    super.dispose();
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
          TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            maxLength: 64,
            decoration:
                const InputDecoration(label: Text("Amount"), prefixText: "\$"),
          ),
          Row(
            children: [
              ElevatedButton(onPressed: () {}, child: const Text("Save Title"))
            ],
          )
        ],
      ),
    );
  }
}
