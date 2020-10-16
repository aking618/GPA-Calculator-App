import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class Course {

  Course(this.title, this.number, this.grade);

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'number')
  String number;

  @JsonKey(name: 'grade')
  String grade;

  factory Course.fromJson (Map<String, dynamic> json) {
    return Course(
      json['title'] as String,
      json['number'] as String,
      json['grade'] as String,
    );
  }
}

String courseToJson(List<Course> courses) {
  String courseString = "";

  for (int i = 0; i < courses.length; i++) {
    courseString += '{"title": "${courses[i].title}",'
        '"number": "${courses[i].number}",'
        '"grade": "${courses[i].grade}"}';

    if (!(i == courses.length - 1)) {
      courseString += ',';
    }
  }

  return courseString;
}