import 'package:flutter/material.dart';
import 'package:notemaker/widgets/chart.dart';
import 'package:notemaker/widgets/expenses_list.dart';
import 'widgets/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expenses'),
        ),
        body: Column(children: [
          ChartWidget(),
          ExpensesListWidget(),
        ]),
      ),
    );
  }
}
