import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddExpenseState();
  }
}

class _AddExpenseState extends State<AddExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        TextField(
          controller: _titleController,
          maxLength: 50,
          decoration: const InputDecoration(label: Text("title")),
        ),
        TextField(
          controller: _amountController,
          keyboardType: TextInputType.number,
          maxLength: 20,
          decoration: const InputDecoration(label: Text("Amount")),
        ),
        Row(
          children: [
            TextButton(onPressed: () {}, child: const Text("Cancel")),
            ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                },
                child: const Text("Save Expense"))
          ],
        )
      ]),
    );
  }
}
