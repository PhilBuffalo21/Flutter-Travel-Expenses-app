import 'package:flutter/material.dart';

class newExpense extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _newExpense();
  }
}

class _newExpense extends State<newExpense> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            maxLength: 64,
            decoration: InputDecoration(label: Text("Title")),
          )
        ],
      ),
    );
  }
}
