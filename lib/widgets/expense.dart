import 'package:expense_project/widgets/add_expense.dart';
import 'package:expense_project/widgets/expenses_list/expense_list.dart';
import 'package:flutter/material.dart';

import '../models/expense_model.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter Course',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Cinema',
        amount: 15.69,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openAddOverlay() {
    showModalBottomSheet(
        context: context, builder: (ctx) => const AddExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Flutter Expense Tracker",
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            IconButton(onPressed: _openAddOverlay, icon: const Icon(Icons.add))
          ]),
      body: Column(
        children: [
          const Text(
            "The chart",
          ),
          Expanded(child: ExpensesList(expensesList: _registeredExpenses))
        ],
      ),
    );
  }
}
