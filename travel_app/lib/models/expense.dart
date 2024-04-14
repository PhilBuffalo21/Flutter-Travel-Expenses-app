import 'package:uuid/uuid.dart';

enum Category { food, experience, shopping, accommendation }

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
