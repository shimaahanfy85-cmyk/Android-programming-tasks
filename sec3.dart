import 'dart:io';
import 'dart:math';

void main() {
  List<String> studentNames = [];
  List<List<double>> studentGrades = [];

  
  int numberOfStudents = 0;

  while (true) {
    stdout.write("Enter number of students: ");
    String? input = stdin.readLineSync();

    try {
      numberOfStudents = int.parse(input!);

      if (numberOfStudents <= 0) {
        print("Please enter a positive number.");
        continue;
      }

      break;
    } catch (e) {
      print("Invalid input! Please enter a valid integer.");
    }
  }

  
  for (int i = 0; i < numberOfStudents; i++) {
    print("\nStudent ${i + 1}");

    
    stdout.write("Enter student name: ");
    String name = stdin.readLineSync() ?? "Unknown";

    
    int numberOfSubjects = 0;

    while (true) {
      stdout.write("Enter number of subjects: ");
      String? subjectInput = stdin.readLineSync();

      try {
        numberOfSubjects = int.parse(subjectInput!);

        if (numberOfSubjects <= 0) {
          print("Please enter a positive number.");
          continue;
        }

        break;
      } catch (e) {
        print("Invalid input! Please enter a valid integer.");
      }
    }

    
    List<double> grades = [];

    for (int j = 0; j < numberOfSubjects; j++) {
      while (true) {
        stdout.write("Enter grade for subject ${j + 1}: ");
        String? gradeInput = stdin.readLineSync();

        try {
          double grade = double.parse(gradeInput!);

          if (grade < 0 || grade > 100) {
            print("Grade must be between 0 and 100.");
            continue;
          }

          grades.add(grade);
          break;
        } catch (e) {
          print("Invalid input! Please enter a valid number.");
        }
      }
    }

    studentNames.add(name);
    studentGrades.add(grades);
  }

  while (true) {
    print("\n========== MENU ==========");
    print("1. Show All Results");
    print("2. Search Student");
    print("3. Exit");

    stdout.write("Choose an option: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print("\n===== ALL RESULTS =====");

        for (int i = 0; i < studentNames.length; i++) {
          double sum = 0;

          for (double grade in studentGrades[i]) {
            sum += grade;
          }

          double average = sum / studentGrades[i].length;

          String letterGrade;

          if (average >= 85) {
            letterGrade = 'A';
          } else if (average >= 70) {
            letterGrade = 'B';
          } else if (average >= 50) {
            letterGrade = 'C';
          } else {
            letterGrade = 'F';
          }

          print(
              "Student: ${studentNames[i].toUpperCase()} | Average: ${average.toStringAsFixed(2)} | Grade: $letterGrade");
        }
        break;

      case '2':
        stdout.write("Enter student name to search: ");
        String searchName = stdin.readLineSync() ?? "";

        bool found = false;

        for (int i = 0; i < studentNames.length; i++) {
          if (studentNames[i].toLowerCase() ==
              searchName.toLowerCase()) {
            double sum = 0;

            for (double grade in studentGrades[i]) {
              sum += grade;
            }

            double average = sum / studentGrades[i].length;

            print(
                "${studentNames[i]} average grade: ${average.round()}");

            found = true;
            break;
          }
        }

        if (!found) {
          print("Student not found!");
        }

        break;

      case '3':
        print("Program terminated.");
        return;

      default:
        print("Invalid choice! Please choose 1, 2, or 3.");
    }
  }
}