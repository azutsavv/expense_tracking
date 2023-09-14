import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expense_item extends StatelessWidget {
  const Expense_item(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return  Card(child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: Column(
        children: [
          Text(expense.title),
          const SizedBox(height: 4,),

          Row(
            children: [
              Text('\$ ${expense.amount.toStringAsFixed(2)}'
              // 12.3334534=>12.33 by use of asfixed
              ),
              const Spacer(),
              
              Row(
                children: [
                  const Icon(Icons.alarm),
                  const SizedBox(width: 8,),
                  Text(expense.date.toString())
                ],

              )


            ],
          )
        ],

      )
    ),);
  }
}
