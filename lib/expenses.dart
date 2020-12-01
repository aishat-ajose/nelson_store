import 'package:flutter/material.dart';
import 'package:nelson_store/home.dart';
import 'package:nelson_store/recordExpense.dart';

List<String> categories = ['Fuel', 'Food', 'Transport', 'Clothes'];
List<Activity> activities = [
  Activity(name: 'Feul', date: '15/09/2020', amount: 'N2000'),
  Activity(name: 'Food', date: '15/09/2020', amount: 'N15000'),
  Activity(name: 'Food', date: '15/09/2020', amount: 'N15000'),
  Activity(name: 'Food', date: '15/09/2020', amount: 'N15000'),
];

class ExpensesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          timeSpan('N200,000'),
          heading('QUICK CATEGPORIES'),
          buildQuickCategories(categories, Icons.copy),
          heading('RECENT ACTIVITIES'),
          buildRecentActivities(context, activities),
          SizedBox(height: 10,)
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: ()=> recordExpense(context, ActionType.EXPENSES),
      ),
    );
  }
}

Widget timeSpan(String amount){
  return Card(
    elevation: 3,
    margin: EdgeInsets.all(20),
    color: Colors.grey[100],
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7),),
    child: Row(
      children: [
        Container(
          width: 3,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),)
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _buildDate('Today', picked: true), 
                  _buildDate('Week'),
                  _buildDate('Month'),
                ],
              ),
              SizedBox(height: 20,),
              Text(amount, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildDate(String date ,{ bool picked = false}){
  return Container(
    margin: EdgeInsets.only(right: 10),
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12), color: picked ? Colors.grey[300]: Colors.grey[100],
      border: Border.all(style:BorderStyle.solid, color: Colors.grey[300])
      ),
    child: Text(date, style: TextStyle(fontSize: 13, color: picked ? Colors.red : Colors.grey[700], fontWeight: FontWeight.w500,))
  );
}

Widget buildQuickCategories(List<String> categories, IconData icon){
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(style: BorderStyle.solid, color: Colors.grey[200])
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: categories.map(
        (category) => Column(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[300]),
              child:  Icon(icon, size: 19),
            ),
            SizedBox(height: 5,),
            Text(category, style: TextStyle(color: Colors.red, fontSize: 11, fontWeight: FontWeight.bold),)
          ],
        )
      ).toList().cast<Widget>()
    ),
  );
}

Widget buildRecentActivities(BuildContext context, List<Activity> activities){
  return Container(
     margin: EdgeInsets.symmetric(horizontal: 15),
    child: Column(
      children: activities.map((activity) => 
        Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              title: Text(activity.name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              subtitle: Text(activity.date, style: TextStyle(fontSize: 12, color: Colors.grey[500])),
              trailing: Text(activity.amount, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey[700])),
              onTap:  ()=> recordExpense(context, ActionType.DETAILS),
            ),
            Container(color: Colors.grey[300],width: double.infinity, height: 1,)
          ],
        )
      ).toList().cast<Widget>(),
    ),
  );
}

recordExpense(BuildContext context, ActionType actionType){
   return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => DraggableScrollableSheet(
      initialChildSize: 0.70, 
      maxChildSize: 0.70, 
      minChildSize: 0.40,
      expand: true,
      builder: (context, scrollController) {
        return RecordPage(actionType); 
      }
    )
  );

}

class Activity{
  String name;
  String date;
  String amount;

  Activity({this.amount, this.date, this.name});
}