import 'package:flutter/material.dart';

import 'package:sqflite/sqflite.dart';
import 'package:sqlite_project/student.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final List<Student> studentList=[];

  final nameController=TextEditingController();
  final ageController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("SQLite Demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Name",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Age",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                
                var age=int.parse(ageController.text);
                var student=Student(name: nameController.text, age: age);
                
                
               
              },
              child: Text("Submit"),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemBuilder: (context, index) => Card(
                    elevation: 10,
                    shadowColor: Colors.blue,
                    child: ListTile(
                      title: Text(studentList[index].name),
                      subtitle: Text(studentList[index].age.toString()),
                    ),
                  ),
                  itemCount: studentList.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Future <void> addstudent()async{
    
  }
}