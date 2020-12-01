import 'package:flutter/material.dart';
import 'package:nelson_store/expensesAndIncome.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Nelson Store'),
      ),

      drawer: Container(),

      body: ListView(
        padding: EdgeInsets.only(top:15),
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('Good morning Nelson'),
          ),
          SizedBox(height: 5),
          _buildCategory('Checkout', 'It is a long established fact that a reader will be distracted by the readable', Colors.green.shade800),
          _buildCategory('Add to Inventory', 'It is a long established fact that a reader will be distracted by the readable', Colors.orange),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ExpensesAndIncomePage()));
            },
            child: _buildCategory('Expenses and Income', 'It is a long established fact that a reader will be distracted by the readable', Colors.blue.shade700)
          ),
          
          heading('ITEMS SOLD THIS WEEK'),
          SizedBox(height: 15),
          Container(height: 130, child: _buildSoldThisWeek(context)),
          SizedBox(height: 15,),
          heading('RECENT ACTIVITIES'),
          _buildRecentActivities()

        ],
      ),

      bottomNavigationBar: bottomNavBar()
    );
  }
}

Widget _buildCategory(String title, String message, Color color){
  return Card(
    margin: EdgeInsets.only(bottom: 15, left: 15, right: 15),
     color: color,
    elevation: 3,
    child: Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 20, color: Colors.white)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(message, style: TextStyle(fontSize: 12, color: Colors.white))),
              SizedBox(width: 30),
              Icon(Icons.arrow_forward, color: Colors.white)
            ],
          )]
      ),
    ),
  );
}

Widget heading(String heading){
  return Padding(
    padding: const EdgeInsets.only(top:15.0, left: 15, right: 15),
    child: Text(heading, style: TextStyle(fontSize: 11, color: Colors.grey),),
  );
}

Widget _buildSoldThisWeek(BuildContext context){
  List<String> days = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];

  return ListView(
    padding: EdgeInsets.only(left: 15),
    scrollDirection: Axis.horizontal,
    children: days.map((day) =>
     Card(
      elevation: 3.0,
      child: Container(
        padding: EdgeInsets.all(15),
         color: Colors.blue.shade700,
         width: MediaQuery.of(context).size.width/3,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(day, style: TextStyle(color: Colors.white),),
             Text('24', style: TextStyle(color: Colors.white, fontSize:  40, fontWeight: FontWeight.w500, letterSpacing: 5))
           ],
         ),
       ),
     )
    ).toList().cast<Widget>(),
  );
}


Widget _buildRecentActivities(){
  List<List> activities = [
    [Icons.inventory, 'Added Laptops to the Inventory', '21 hours ago', 'BY AKINWUNMI'],
    [Icons.point_of_sale_sharp, 'Sold 2 MackBook Pro', '21 hours ago', 'BY JOSEPH'],
    [Icons.point_of_sale_sharp, 'Sold 2 MackBook Pro', '21 hours ago', 'BY AKINWUMNI'],
    [Icons.inventory, 'Added Laptops to the Inventory', '21 hours ago', 'BY JOSEPH'],
  ];

  return Column(
    children: activities.map((activity) => 
    ListTile(
      leading: Container(
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[200]),
        child: Icon(activity[0], color: Colors.red)
      ),
      title: Text(activity[1], style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
      subtitle: Row(
        children: [
          Text(activity[2], style: TextStyle( fontSize: 12),), 
          SizedBox(width: 3,),
          Text(activity[3], style: TextStyle(color: Colors.red, fontSize: 10),)
        ],
      ),
    )
    ).toList().cast<Widget>(),
  );
}

Widget bottomNavBar(){
  return BottomNavigationBar(
    elevation: 3,
    selectedFontSize: 12,
    showSelectedLabels: true,
    showUnselectedLabels: true,              
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.dashboard),
        label: 'Dashboard',
      ),
      BottomNavigationBarItem(
        icon:Icon(Icons.inventory),
        label: 'Inventory',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.point_of_sale_sharp),
        label: 'Sales'
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.analytics),
        label: 'Analytics'
      )
    ],
  );
}