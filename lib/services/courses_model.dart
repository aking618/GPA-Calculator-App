import 'course_model.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:gpa_calculator/services/course_model.dart';

@JsonSerializable(explicitToJson: true)
class CourseList {
  CourseList(this.courses);

  @JsonKey(name:'courses')
  List<Course> courses;

  String courseListToJson(CourseList courseList) {
    String courseList = "";

    if (courseList.length > 0) {
      courseList = '{"courses":[${courseToJson(courses)}]}';
    }

    return courseList;
  }


  factory CourseList.fromJson (Map<String, dynamic> json) {
    return CourseList(
      (json['courses'] as List)
          ?.map((e) =>
      e == null ? null : Course.fromJson(e as Map<String, dynamic>))
          ?.toList(),
    );
  }
}