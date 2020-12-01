import 'package:flutter/material.dart';
import 'package:nelson_store/expenses.dart';
import 'package:nelson_store/home.dart';
import 'package:nelson_store/recordExpense.dart';


List<String> categories = ['Sales', 'Salary', 'Gift', 'Investment'];
List<Activity> activities = [
  Activity(name: 'Sales', date: '15/09/2020', amount: 'N10000'),
  Activity(name: 'Investment', date: '15/09/2020', amount: 'N15000'),
  Activity(name: 'Gift', date: '15/09/2020', amount: 'N15000'),
  Activity(name: 'Awards', date: '15/09/2020', amount: 'N15000'),
];


class IncomePage extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          timeSpan('N500,000'),
          heading('QUICK CATEGPORIES'),
          buildQuickCategories(categories, Icons.house_outlined),
          heading('RECENT ACTIVITIES'),
          buildRecentActivities(context, activities),
          SizedBox(height: 10,)
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: ()=> recordExpense(context, ActionType.INCOME)
      ),
    );
  }
}