import 'package:json_annotation/json_annotation.dart';
import 'course_model.dart';

@JsonSerializable(explicitToJson: true)
class CourseList {
  CourseList(this.courses);

  @JsonKey(name:'courses')
  List<Course> courses;

  //ToJson
  String courseListToJson(CourseList courseList) {
    String courseList = "";

    if (courseList.length > 0) {
      courseList = '{"courses":[${courseToJson(courses)}]}';
    }
  }


  //factory CourseList.fromJson
}