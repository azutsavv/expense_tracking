import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

var _enteredTitle = '';

void _savetitleinnput(String inputValue) {
  _enteredTitle = inputValue;
}

class _NewExpenseState extends State<NewExpense> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const  EdgeInsets.all(16),
      child: Column(
        children: [
          const TextField(
            maxLength: 50,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              label: Text("title"),
            ),
            onChanged: _savetitleinnput,
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    print(_enteredTitle);
                  },
                  child:const Text("SAVE")),
            ],
          )
        ],
      ),
    );
  }
}
