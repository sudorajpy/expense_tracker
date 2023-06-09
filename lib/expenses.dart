import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {

  final List<Expense> _registeredExpenses = [
    Expense(title: 'title', amount: 786, date: DateTime.now(), category: Category.bills),
    Expense(title: 'title 333', amount: 7876, date: DateTime.now(), category: Category.food),
    Expense(title: 'title 444', amount: 7686, date: DateTime.now(), category: Category.shopping),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Expenses'),
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}