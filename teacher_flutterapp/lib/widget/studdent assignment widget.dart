



import 'package:flutter/material.dart';


class StudentAssignmentWidget extends StatefulWidget{

  final String studentName;

  StudentAssignmentWidget({this.studentName});

  StudentAssignmentWidgetState createState()=>StudentAssignmentWidgetState();
}

class StudentAssignmentWidgetState extends State<StudentAssignmentWidget>{
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.studentName,style: TextStyle(fontSize: 14.0,color: Colors.redAccent)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Download",style: TextStyle(fontSize: 14.0,color: Colors.blue),),
              )
            ],
            ),
          ),
        ),
      ),
    );
  }
}