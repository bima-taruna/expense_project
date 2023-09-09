import 'package:expense_project/models/expense_model.dart';
import 'package:expense_project/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expensesList, required this.onRemoveExpense});

  final List<Expense> expensesList;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expensesList.length,
        itemBuilder: (ctx, index) => Dismissible(
            key: ValueKey(expensesList[index]),
            onDismissed: (direction) {
              onRemoveExpense(expensesList[index]);
            },
            child: ExpenseItem(
              expense: expensesList[index],
            )));
  }
}
