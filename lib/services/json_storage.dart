import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:gpa_calculator/services/courses_model.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/courseData.json');
}

Future<CourseList> readCourseData() async {
  try {
    final file = await _localFile;
    String contents = await file.readAsString();
    final jsonResponse = jsonDecode(contents);

    CourseList courseList = CourseList.fromJson(jsonResponse);
    return courseList;
  }
  catch (e) {
    print(e);
    return loadFillerCourseData();
  }
}

Future<File> writeCourseData(CourseList courseList) async {
  final file = await _localFile;
  return file.writeAsString(courseList.courseListToJson(courseList));
}

/* Load filler asset */
Future<String> _loadCourseListAsset () async {
  return await rootBundle.loadString('assets/filler.json');
}

Future<CourseList> loadFillerCourseData () async {
  String jsonString = await _loadCourseListAsset();
  final jsonResponse = jsonDecode(jsonString);
  CourseList courseList = CourseList.fromJson(jsonResponse);

  return courseList;
}
