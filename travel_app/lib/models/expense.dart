import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum Category { food, experience, shopping, accommodation }

Map categoryIcons = {
  Category.food: Icons.fastfood,
  Category.experience: Icons.beach_access,
  Category.shopping: Icons.shopping_bag_rounded,
  Category.accommodation: Icons.holiday_village
};
const uuid = Uuid();

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
}
