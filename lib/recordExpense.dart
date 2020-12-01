import 'package:flutter/material.dart';
import 'package:nelson_store/home.dart';


enum ActionType {
  EXPENSES, INCOME, DETAILS
}

TextStyle style1 = TextStyle(color: Colors.grey[400]);
TextStyle style2 = TextStyle(color: Colors.black);

class RecordPage extends StatelessWidget {
  final ActionType actionType;
  RecordPage(this.actionType);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
        ),
        child: ListView(
        
          children: [
            SizedBox(height: 10,),
            appBar(context, actionType),
            heading('AMOUNT*'),
            SizedBox(height: 5),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.grey[200]),
              child: Text('N2000', style: actionType == ActionType.DETAILS ? style2 : style1),
            ),
            SizedBox(height: 10),
            heading('DATE*'),
            SizedBox(height: 5),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.grey[200]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('15/09/2020',  style: actionType == ActionType.DETAILS ? style2 : style1),
                  Icon(Icons.calendar_today, color: Colors.grey,)
                ],
              ),
            ),
            SizedBox(height: 10),
            heading('Note'),
            SizedBox(height: 5),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.grey[200]),
              height: 150,
              child: actionType == ActionType.DETAILS ? 
              Text('Sales of 5 laptops recorded for the day', style: style2):
              Text('Input something descriptive here', style: style1)
            ),

            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.black),
              child: Center(child: Text(actionType == ActionType.DETAILS ? 'SAVE': 'DONE', style: TextStyle(color: Colors.white),)),
            ),
          ],
        ),
      ),
    );
  }
}


Widget appBar(BuildContext context, ActionType actionType){
   return Container(
     margin: EdgeInsets.all(15),
     child: Row(
      children: [
        InkWell(
          onTap: ()=> Navigator.pop(context),
          child: Row(
            children: [
              Icon(Icons.arrow_back_ios, size: 18),  Text('Back')
            ],
          ),
        ),
        SizedBox(width: 60),
          Text(actionType == ActionType.INCOME ? 'Record Income' : actionType == ActionType.EXPENSES? 'Record Expense' : 'More Details'),
          Spacer(),
          actionType == ActionType.DETAILS ? Text('DELETE', style: TextStyle(color: Colors.red)) : SizedBox()
      ],
  ),
   );
}