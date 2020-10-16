import 'package:flutter/material.dart';

import 'package:gpa_calculator/services/json_storage.dart';
import 'package:gpa_calculator/services/courses_model.dart';
import 'package:gpa_calculator/services/course_model.dart';

Widget newCourseFormField(BuildContext context, CourseList list) {

  String course;
  String grade;
  String creditHour;

  final _formKey = GlobalKey<FormState>();
//  return showDialog(
//      context: context,
//      builder: (BuildContext context) {
        return AlertDialog(
          content: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Course Name',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter Course Name';
                        }
                        value = value.trim();
                        course = value;
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Grade',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter either "A", "B", "C", "D", "F"';
                        }
                        else if (value.isNotEmpty) {
                          value = value.trim();
                          if (!(value == "A" || value == "B" || value == "C" || value == "D" || value == "F")) {
                            return 'Please enter either "A", "B", "C", "D", "F"';
                          }
                        }
                        grade = value;
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Credit Hours',
                      ),
                      validator: (value) {
                        bool isNumeric(String s) {
                          if(s == null) {
                            return false;
                          }

                          return double.tryParse(s) != null;
                        }
                        if (value.isEmpty) {
                          return 'Please enter a number 1-6';
                        }

                        if (isNumeric(value)) {
                          if ((int.parse(value) > 0 && int.parse(value) < 7)) {
                            value = value.trim();
                            creditHour = value;
                            return null;
                          }
                          else {
                            return 'Please enter a number 1-6';
                          }
                        }
                        else {
                          return 'Please enter a number 1-6';
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () async {
                              // Validate will return true if the form is valid, or false if
                              // the form is invalid.
                              if (_formKey.currentState.validate()) {
                                Course newCourse = Course(course, creditHour, grade);
                                list.courses.add(newCourse);
                                await writeCourseData(list);
                                Navigator.pop(context);
                              }
                            },
                            child: Text('Submit'),
                          ),
                          RaisedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Close'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
//      });
}
