import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  static const routename = '/Expense';
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpense = [
    Expense(
        amount: 19.9,
        title: 'flutter',
        date: DateTime.now(),
        category: Category.work),
    Expense(
        amount: 15.69,
        title: 'cinema',
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openaddexpenseoverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(
              OnAddExpense: _addExpense,
            ));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpense.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpense.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EXPENSE TRACKER"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: _openaddexpenseoverlay, icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          const Text('chart'),
          Expanded(child: expenses_list(expenses: _registeredExpense , OnRemoveExpense: _removeExpense,)),
        ],
      ),
    );
  }
}
