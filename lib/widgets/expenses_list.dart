import 'package:flutter/material.dart';
import 'package:notemaker/widgets/expense.dart';

class ExpensesListWidget extends StatefulWidget {
  const ExpensesListWidget({super.key});

  @override
  State<ExpensesListWidget> createState() => _ExpensesListWidgetState();
}

class _ExpensesListWidgetState extends State<ExpensesListWidget> {
  final List<Expense> _expenseList = [
    Expense(amount: 10, title: 'Expense', dateTime: DateTime.now()),
    Expense(amount: 11, title: 'Expense', dateTime: DateTime.now()),
    Expense(amount: 12, title: 'Expense', dateTime: DateTime.now()),
    Expense(amount: 12, title: 'Expense', dateTime: DateTime.now()),
    Expense(amount: 12, title: 'Expense', dateTime: DateTime.now()),
    Expense(amount: 12, title: 'Expense', dateTime: DateTime.now()),
    Expense(amount: 12, title: 'Expense', dateTime: DateTime.now()),
    Expense(amount: 12, title: 'Expense', dateTime: DateTime.now()),
    Expense(amount: 12, title: 'Expense', dateTime: DateTime.now()),
    Expense(amount: 12, title: 'Expense', dateTime: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey, width: 2)),
      height: 400,
      child: ListView.builder(
        itemCount: _expenseList.length,
        itemBuilder: (context, index) =>
            ExpenseWidget(expense: _expenseList[index]),
      ),
    );
  }
}
