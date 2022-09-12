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
        child: Container(
          padding: EdgeInsets.all(5),
          child: InkWell(
            splashColor: Colors.grey.withOpacity(.5),
            onTap: () => print('tapped'),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(expense.title,
                              style: Theme.of(context).textTheme.titleMedium)),
                      Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(
                            DateFormat.yMMMd()
                                .add_jm()
                                .format(expense.dateTime),
                            style: Theme.of(context).textTheme.bodySmall,
                          )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    "\$${expense.amount}",
                    style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
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
