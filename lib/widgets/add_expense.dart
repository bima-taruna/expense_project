import 'package:expense_project/models/expense_model.dart';
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
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _openDatePicker() async {
    final dateNow = DateTime.now();
    final firstDate = DateTime(dateNow.year - 1, dateNow.month, dateNow.day);

    final pickedDate = await showDatePicker(
        context: context,
        initialDate: dateNow,
        firstDate: firstDate,
        lastDate: dateNow);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        TextField(
          controller: _titleController,
          maxLength: 50,
          decoration: const InputDecoration(label: Text("title")),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    prefixText: 'Rp', label: Text("Amount")),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(_selectedDate == null
                    ? "no date selected"
                    : formatter.format(_selectedDate!)),
                IconButton(
                    onPressed: _openDatePicker,
                    icon: const Icon(Icons.calendar_month))
              ],
            ))
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map((value) => DropdownMenuItem(
                        value: value, child: Text(value.name.toUpperCase())))
                    .toList(),
                onChanged: (item) {
                  if (item == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = item;
                  });
                }),
            const Spacer(),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel")),
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
