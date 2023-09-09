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
  final List<Expense> _registeredExpenses = [];
  final List<Expense> _updatedExpenses = [];

  void _updateExpenses() {
    setState(() {
      _registeredExpenses.clear();
      _registeredExpenses.addAll(_updatedExpenses);
    });
  }

  void _openAddOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => AddExpense(
              oldExpense: _updatedExpenses,
              updateExpenses: _updateExpenses,
            ));
  }

  void _removeExpenses(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
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
          Expanded(
              child: ExpensesList(
            expensesList: _registeredExpenses,
            onRemoveExpense: _removeExpenses,
          ))
        ],
      ),
    );
  }
}
