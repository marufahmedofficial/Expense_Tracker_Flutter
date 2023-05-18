import 'package:flutter/material.dart';

import '../../models/expense.dart';
import 'expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: ((context, index) => Dismissible(
            background: Container(
              margin:
                  Theme.of(context).cardTheme.margin!.add(const EdgeInsets.all(4)),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.5),
                //shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            key: ValueKey(expenses[index]),
            onDismissed: (direction) {
              onRemoveExpense(expenses[index]);
            },
            child: ExpenseItem(
              expenses[index],
            ),
          )),
    );
  }
}
