import 'package:flutter/material.dart';
import 'package:nelson_store/expenses.dart';
import 'package:nelson_store/income.dart';

class ExpensesAndIncomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: Container(),
            appBar: AppBar(
              title: Text('Expenses and Income'),
              bottom: TabBar(
                indicatorColor: Colors.black,
                tabs: [
                  Tab(text: 'EXPENSES',),
                  Tab(text: 'INCOME',),
                ],
              ),

            ),
            body: TabBarView(
              children: [
                ExpensesPage(),
                IncomePage()
              ],
            ),
          ),

      
    );
  }
}