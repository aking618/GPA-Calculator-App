import 'package:flutter/material.dart';

import 'package:gpa_calculator/services/courses_model.dart';
import 'package:gpa_calculator/services/json_storage.dart';
import 'package:gpa_calculator/services/gpa_calculation.dart';
import 'package:gpa_calculator/services/formfield.dart';

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
  double gpa = 4.0;

  void removeCourse(int index) async {
    courseList.courses.removeAt(index);
    await writeCourseData(courseList);
  }

  @override
  void initState() {
    super.initState();
    readCourseData().then((CourseList list) {
      setState(() => courseList = list);
    });
  }

  @override
  Widget build(BuildContext context) {

    setState(() {
      gpa = getGPA(courseList);
    });

    return Scaffold(
      appBar: AppBar(
          title: Text("GPA Calculator"),
      centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            //newCourseFormField(context, courseList);
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return newCourseFormField(context, courseList);
              }
          ).then((_) => setState((){}));
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
        width: double.maxFinite,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ListView.builder(
                  itemCount: courseList.courses.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          courseList.courses[index].title,
                      ),
                      subtitle: Text(
                        courseList.courses[index].number,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            courseList.courses[index].grade,
                          ),
                          IconButton(
                            icon: Icon(Icons.delete_forever),
                            onPressed: () async {
                              removeCourse(index);
                              CourseList newCourseList = await readCourseData();
                              setState(() {
                                courseList = newCourseList;
                              });
                            },
                          )
                        ],
                      ),
                      onTap: () {},
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 15.0,),
            Container(
              child: RichText(
                text: TextSpan(
                  text: 'Current : ${gpa.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 36.0
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
