import 'package:flutter/material.dart';

import 'package:gpa_calculator/services/courses_model.dart';

void main() {
  runApp(new MaterialApp(
    home: new Home(),
 ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CourseList courseList;

  // FIXME: override initState and pass in CourseList to 'readCourseData'

  // FIXME: add json_management dart file

  // FIXME: import path provider

  // FIXME: add list builder

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("GPA Calculator"),
      centerTitle: true,
      ),
      body: Column(

        children: <Widget>[
          RaisedButton(
            onPressed: (){
              print("1");
            },
            child: Text(
              "Test 1",
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.orangeAccent[400],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
