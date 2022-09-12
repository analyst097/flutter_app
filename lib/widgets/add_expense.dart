// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'expense.dart';

class AddExpense extends StatelessWidget {
  final Expense newExpense;
  final Function addExpenseFn;
  const AddExpense(
      {super.key, required this.newExpense, required this.addExpenseFn});

  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController();
    var amountController = TextEditingController();

    return Card(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Title'),
              // onChanged: (value) {
              //   newExpense.title = value;
              //   print(newExpense.title);
              // },
              controller: titleController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (value) {
              //   newExpense.amount = double.parse(value);
              //   print(newExpense.amount);
              // },
              controller: amountController,
            ),
            OutlinedButton(
                onPressed: () {
                  try {
                    newExpense.title = titleController.text;
                    var amount = amountController.text.length > 0
                        ? amountController.text
                        : "0.0";
                    newExpense.amount = double.parse(amount);
                    if (newExpense.title.length > 0 &&
                        newExpense.amount > 1.0) {
                      addExpenseFn(newExpense);
                      Navigator.of(context).pop();
                      print(newExpense);
                    } else {
                      print("please enter a title and amount");
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text('Add'))
          ],
        ),
      ),
    );
  }
}
