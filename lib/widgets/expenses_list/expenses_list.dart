import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class expenses_list extends StatelessWidget {
  const expenses_list({super.key, required this.expenses, required this.OnRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) OnRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
          key: ValueKey(expenses[index]),
          onDismissed: (direction) {
            OnRemoveExpense(expenses[index]);
          },
          child: Expense_item(expenses[index])),
    );
  }
}
