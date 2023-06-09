import 'dart:math';

import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'title',
        amount: 786,
        date: DateTime.now(),
        category: Category.bills),
    Expense(
        title: 'title 333',
        amount: 7876,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'title 444',
        amount: 7686,
        date: DateTime.now(),
        category: Category.shopping),
  ];

  void _addExpenseOverLay() {
   
    showModalBottomSheet(
      
        shape: const RoundedRectangleBorder(
          
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        // isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(
              onAddExpense: _addExpense,
            ));
      // isScrollControlled: true,
        // context: context,
        // builder: (ctx) => NewExpense(
        //       onAddExpense: _addExpense,
        //     ));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
    
  }

  void _deleteExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: _addExpenseOverLay, icon: const Icon(Icons.add))
        ],
        title: const Text('Expenses Tracker'),
      ),
      body: Column(
        children: [
          const Text('Expenses'),
          Expanded(child: ExpensesList(expenses: _registeredExpenses, deleteExpense: _deleteExpense,)),
        ],
      ),
    );
  }
}
