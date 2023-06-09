import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.deleteExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) deleteExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: expenses.length ,itemBuilder: (context, index) {
      return  Dismissible(key: ValueKey(expenses[index].id),
      onDismissed:(direction){
        deleteExpense(expenses[index]);
      },
      
        child: ExpenseItem(expenses[index]
       )
       );
    });
  }
}
