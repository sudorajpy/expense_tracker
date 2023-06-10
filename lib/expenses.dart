import 'dart:math';

import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/chart/chart_bar.dart';
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
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: const Color.fromARGB(255, 13, 13, 13),
      content:const Text('Expense deleted'),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: 'UNDO',
        onPressed: () {
          setState(() {
            _registeredExpenses.add(expense);
          });
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {

    Widget mainContent = const Center(child: Text('No expenses added yet!'));

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        deleteExpense: _deleteExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: _addExpenseOverLay, icon: const Icon(Icons.add))
        ],
        title: const Text('Expenses Tracker'),
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(child: mainContent ),
        ],
      ),
    );
  }
}
