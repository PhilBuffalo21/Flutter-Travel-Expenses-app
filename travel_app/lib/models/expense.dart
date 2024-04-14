enum Category { food, experience, shopping, accommendation }

class Expense {
  Expense(
      {required this.id,
      required this.title,
      required this.date,
      required this.amount,
      required this.category});
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final String category;
}
