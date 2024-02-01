import 'package:database_one/db/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';


ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

void addStudent(StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  final _id = await studentDB.add(value);
  studentListNotifier.value.add(value);
  value.id = _id;
  studentListNotifier.notifyListeners();
}

Future<void> getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(id) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentDB.delete(id);
  getAllStudents();
}

Future<void> updateStudent(int id, StudentModel updatedStudent) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  if (studentDB.containsKey(id)) {
    await studentDB.put(id, updatedStudent);
    studentListNotifier.notifyListeners();
  }
}