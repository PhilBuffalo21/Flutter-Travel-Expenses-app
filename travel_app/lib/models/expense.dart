import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

enum Category { food, experience, shopping, accommodation }

Map categoryIcons = {
  Category.food: Icons.fastfood,
  Category.experience: Icons.beach_access,
  Category.shopping: Icons.shopping_bag_rounded,
  Category.accommodation: Icons.holiday_village
};
const uuid = Uuid();
final dateFormatter = DateFormat.yMd();

class Expense {
  Expense(
      {required this.title,
      required this.date,
      required this.amount,
      required this.category})
      : id = uuid.v1();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  String get formattedDate {
    return dateFormatter.format(date);
  }
}

class ExpenseContainer {
  ExpenseContainer({required this.list, required this.category});

  ExpenseContainer.forCategory(List<Expense> allExpenses, Category theCategory)
      : list = allExpenses
            .where((expense) => expense.category == theCategory)
            .toList(),
        category = theCategory;

  List<Expense> list;
  final Category category;

  double get getSumTotalofExpenses {
    double sum = 0.0;
    for (final expense in list) {
      sum += expense.amount;
    }
    return sum;
  }
}
