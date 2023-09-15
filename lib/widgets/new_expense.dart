import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.OnAddExpense});

  final void Function(Expense expense) OnAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titlecontroller = TextEditingController();
  final _expenseController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  void _presentDay() async {
    final now = DateTime.now();
    final firstDay = DateTime(now.year - 1, now.month, now.day);

    final _pickedDate = await showDatePicker(
        context: context, initialDate: now, firstDate: firstDay, lastDate: now);

    setState(() {
      _selectedDate = _pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_expenseController.text);
    final amountisValid = enteredAmount == null || enteredAmount <= 0;

    if (_titlecontroller.text.trim().isEmpty ||
        amountisValid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
            title: const Text("Invaild Input"),
            content: const Text("please make sure input values are valid"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text("Okay"),
              ),
            ]),
      );

      return;
    }

    widget.OnAddExpense(Expense(
        amount: enteredAmount,
        title: _titlecontroller.text,
        date: _selectedDate!,
        category: _selectedCategory));
  }

  @override
  void dispose() {
    _titlecontroller.dispose();
    _expenseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titlecontroller,
            maxLength: 50,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              label: Text("title"),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _expenseController,
                  maxLength: 6,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: "\$ ",
                    label: Text("Total Amount"),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null
                        ? "NO date selected"
                        : formatter.format(_selectedDate!)),
                    IconButton(
                        onPressed: _presentDay,
                        icon: const Icon(Icons.calendar_month))
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                          )))
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              ElevatedButton(
                  onPressed: _submitExpenseData, child: const Text("SAVE")),
            ],
          )
        ],
      ),
    );
  }
}
