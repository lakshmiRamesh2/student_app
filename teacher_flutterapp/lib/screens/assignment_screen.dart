


import 'package:flutter/material.dart';


class AssignmentScreen extends StatefulWidget {
  @override
  AssignmentScreenState createState() => AssignmentScreenState();
}
  class AssignmentScreenState extends State<AssignmentScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text("Student Name"),

        ],
      ),
    );
  }
Widget assignmentWidget(String studentName,String studentUrl) {
  return Card(child: Column(
    children: <Widget>[
      Text(studentUrl),
      RaisedButton(onPressed: () {}, child: Text("download"))
    ],
  ),);
}

  Widget statusButton(String status){
    return  RaisedButton(onPressed: (){}, child:Text(status));
  }
}