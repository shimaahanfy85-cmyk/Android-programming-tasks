Set<String> students = {};

void addStudent(String name) {
  students.add(name);
}

void printStudents(List<String> list, int index) {
  if (index >= list.length) {
    return;
  }

  print(list[index]);
  printStudents(list, index + 1);
}

Map<String, List<Map<String, dynamic>>> studentCourses = {};

void addCourse(String studentName, String courseName, {double grade = 0}) {
  studentCourses.putIfAbsent(studentName, () => []);

  studentCourses[studentName]!.add({
    "course": courseName,
    "grade": grade
  });
}

double averageGrade(String studentName) {
  if (!studentCourses.containsKey(studentName) ||
      studentCourses[studentName]!.isEmpty) {
    return 0;
  }

  var grades = studentCourses[studentName]!;

  double total = grades.fold(
      0,
      (sum, item) =>
          sum + (item["grade"] as double));

  return total / grades.length;
}

void main() {
  addStudent("Ali");
  addStudent("Sara");
  addStudent("Ali");

  students.forEach((student) => print(student));

  printStudents(students.toList(), 0);

  Set<String> newStudents = {"Mona", "Omar"};

  Set<String> allStudents = {
    ...students,
    ...newStudents
  };

  print(allStudents);

  addCourse("Ali", "Math", grade: 90);
  addCourse("Ali", "Physics", grade: 80);
  addCourse("Sara", "English", grade: 95);

  print(averageGrade("Ali"));
  print(averageGrade("Sara"));
}