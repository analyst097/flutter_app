// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:notemaker/widgets/add_expense.dart';
import 'package:notemaker/widgets/chart.dart';
import 'package:notemaker/widgets/expense.dart';
import 'package:notemaker/widgets/expenses_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final List<Expense> _expenseList = [
    Expense(amount: 10, title: 'Expense', dateTime: DateTime.now()),
    Expense(amount: 12, title: 'Expense', dateTime: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.green,
            fontFamily: 'Quicksand',
            textTheme: Theme.of(context).textTheme.copyWith(
                titleSmall: TextStyle(
                    fontFamily: 'OpenSans', fontWeight: FontWeight.w500)),
            appBarTheme: AppBarTheme(
                titleTextStyle: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.w800))),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Expenses'),
            actions: [
              IconButton(
                  onPressed: () {
                    _startAddNewTx(context);
                  },
                  icon: Icon(Icons.add))
            ],
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              ChartWidget(),
              ExpenseListWidget(
                expenseList: _expenseList,
              ),
            ]),
          ),
          floatingActionButton: Builder(builder: (context) {
            return FloatingActionButton(
              onPressed: () => _startAddNewTx(context),
              child: Icon(Icons.add),
            );
          }),
        ),
      ),
    );
  }

  void addExpense(Expense expense) {
    setState(() {
      _expenseList.add(expense);
    });
  }

  void _startAddNewTx(BuildContext ctx) {
    print("clicked");
    showModalBottomSheet(
        context: ctx,
        builder: ((context) {
          return AddExpense(
              newExpense:
                  Expense(amount: 0.0, title: '', dateTime: DateTime.now()),
              addExpenseFn: addExpense);
        }));
  }
}
