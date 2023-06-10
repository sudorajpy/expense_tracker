import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formater = DateFormat.yMd();

const uuid = Uuid();

enum Category { food, travel, shopping, bills, others }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight,
  Category.shopping: Icons.shopping_bag,
  Category.bills: Icons.receipt,
  Category.others: Icons.more_horiz,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;


  String get formatedDate {
    return formater.format(date);
  }
}


class ExpenseBucket {
  ExpenseBucket({required this.category, required this.expenses});
  final Category category;
  final List<Expense> expenses;

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses.where((expense) => expense.category == category)
      .toList();
       

  double get totalExpense {
    return expenses.fold(0.0, (sum, expense) => sum + expense.amount);
  }
}