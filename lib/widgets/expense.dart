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
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text('expense deleted'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('no expense yet, try adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expensesList: _registeredExpenses,
        onRemoveExpense: _removeExpenses,
      );
    }

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
          Expanded(child: mainContent)
        ],
      ),
    );
  }
}
