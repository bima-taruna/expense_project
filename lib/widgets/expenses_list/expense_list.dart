import 'package:expense_project/models/expense_model.dart';
import 'package:expense_project/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expensesList});

  final List<Expense> expensesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expensesList.length,
        itemBuilder: (ctx, index) {
          return ExpenseItem(
            expense: expensesList[index],
          );
        });
  }
}
