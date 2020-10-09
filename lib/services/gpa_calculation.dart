import 'package:gpa_calculator/services/courses_model.dart';

double getGPA (CourseList list) {
  int length = list.courses.length;
  double total = 0.0;
  int courseHours = 0;

  for (int i = 0; i < length; i++) {

    if (list.courses[i].grade == "A") {
      total += 4.0 * int.parse(list.courses[i].number);
    }
    else if (list.courses[i].grade == "B") {
      total += 3.0 * int.parse(list.courses[i].number);
    }
    else if (list.courses[i].grade == "C") {
      total += 2.0 * int.parse(list.courses[i].number);
    }
    else if (list.courses[i].grade == "D") {
      total += 1.0 * int.parse(list.courses[i].number);
    }
    else if (list.courses[i].grade == "F") {
      total += 0.0 * int.parse(list.courses[i].number);
    }
  }

  for (int i = 0; i < length; i++) {
    courseHours += int.parse(list.courses[i].number);
  }

  return total / courseHours;
}