// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseWidget extends StatelessWidget {
  final Expense expense;
  const ExpenseWidget({required this.expense, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      padding: const EdgeInsets.all(5),
      child: Card(
        child: InkWell(
          splashColor: Colors.grey.withOpacity(.5),
          onTap: () => print('tapped'),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Text(
                            expense.title,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )),
                    ),
                    Expanded(
                      child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(
                            DateFormat.yMMMd()
                                .add_jm()
                                .format(expense.dateTime),
                            style: TextStyle(fontSize: 14),
                          )),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  "\$${expense.amount}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Expense {
  double amount;
  String title;
  String? description;
  DateTime dateTime;

  Expense(
      {required this.amount,
      required this.title,
      required this.dateTime,
      this.description});
}
