import 'package:flutter/material.dart';
import 'package:notemaker/widgets/expense.dart';

class ExpenseListWidget extends StatelessWidget {
  final List<Expense> expenseList;
  const ExpenseListWidget({super.key, required this.expenseList});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey, width: 2)),
      height: 400,
      child: ListView.builder(
        itemCount: expenseList.length,
        itemBuilder: (context, index) =>
            ExpenseWidget(expense: expenseList[index]),
      ),
    );
  }
}
