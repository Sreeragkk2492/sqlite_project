import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqlite_project/home.dart';
import 'package:sqlite_project/student.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
   final Database database = await openDatabase(
      join(await getDatabasesPath(), 'student.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE students(id INTEGER PRIMARY KEY,name TEXT,age INTEGER)');
      },
      version: 1,
    );

  Future<void> insertStudent(Student student) async {
    final db = await database;

    await db.insert('students', student.tomap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
  // var sreerag=Student(name: 'sreerag', age: 21);
  // insertStudent(sreerag);

  Future<List<Student>> fetchStudent() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('students');
   

    return List.generate(
      maps.length,
      (index) => Student(
        id: maps[index]['id'] as int,
        name: maps[index]['name'] as String,
        age: maps[index]['age'] as int,
      ),
    );
  }

   print(await fetchStudent());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}



