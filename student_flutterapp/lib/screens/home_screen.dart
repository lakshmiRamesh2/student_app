

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_flutterapp/widget/studdent assignment widget.dart';
import 'package:file_picker/file_picker.dart';



class HomeScreen extends StatefulWidget{

  final String name;
  HomeScreen({@required this.name});


  @override
  HomeScreenState createState() =>HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Home Screen"),),
      body: ListView(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Hi "+widget.name,style: TextStyle(fontSize: 25.0,color:Colors.purpleAccent,fontWeight: FontWeight.bold),),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Send Assignment ",style: TextStyle(fontSize:20.0,fontWeight:FontWeight.bold),),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(color: Colors.purpleAccent,),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: StudentAssignmentWidget(studentName: "Surya",),
        ),
          RaisedButton( onPressed: (){filePicker();},child:Text("UPLOAD Assignment"),color: Colors.purpleAccent,)

      ],)

    );
  }
  void filePicker()async{
  var  filePath = await FilePicker.getFilePath(type: FileType.ANY);
  print(filePath);
   // FilePicker.getFilePath();
  }

  Widget studentAssignmentWidget(String studentName,String downloadurl){
    return Card(child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children: <Widget>[ Text(studentName),Text("Download")],),);
  }
String teacherName="";
fetchData()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String teacherName = prefs.getString('name');
  setState(() {
    teacherName=teacherName;
  });
}
}