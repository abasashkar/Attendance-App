import 'package:attendance_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController rollnocontroller = new TextEditingController();
  TextEditingController agecontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50.0, left: 30.0, right: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                  ),
                ),
                const SizedBox(
                  width: 80.0,
                ),
                const Text(
                  "Add ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Student",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Student Name",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color.fromARGB(255, 238, 238, 238)),
              child: TextField(
                controller: namecontroller,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: ('Enter the student name')),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "Student Roll No",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color.fromARGB(255, 238, 238, 238)),
              child: TextField(
                controller: rollnocontroller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: ('Enter the student roll no')),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              "Student Age",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color.fromARGB(255, 238, 238, 238)),
              child: TextField(
                controller: agecontroller,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: ('Enter the student age')),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                if (namecontroller.text != "" &&
                    rollnocontroller.text != "" &&
                    agecontroller.text != "") {
                  String Addid = randomAlphaNumeric(10);
                  Map<String, dynamic> StudentInfoMap = {
                    "Name": namecontroller.text,
                    "RollNo": rollnocontroller.text,
                    "Age": agecontroller.text,
                    "Present": false,
                    "Absent": false,
                  };
                  DatabaseMethods().addStudent(StudentInfoMap, Addid).then(
                      (value) => ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                              backgroundColor: Colors.green,
                              content: Text(
                                "Student data has been uploded",
                                style: TextStyle(fontSize: 20.0),
                              ))));
                }
              },
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.blue,
                  ),
                  child: const Center(
                    child: Text(
                      "Enter",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



 //    onTap: () {
//                 if (namecontroller.text != "" &&
//                     rollnocontroller.text != "" &&
//                     agecontroller.text != "") {
//                   String addid = randomAlphaNumeric(10);
//                   Map<String, dynamic> studentInfoMap = {
//                     "Name": namecontroller.text,
//                     "RollNo": rollnocontroller.text,
//                     "Age": agecontroller.text,
//                     "Present": false,
//                     "Absent": false,
//                   };
//                   DatabaseMethods().addStudent(studentInfoMap, addid).then(
//                       (value) => ScaffoldMessenger.of(context)
//                           .showSnackBar(const SnackBar(
//                               backgroundColor: Colors.green,
//                               content: Text(
//                                 "Student data has been uploaded",
//                                 style: TextStyle(fontSize: 20.0),
//                               ))));
//                 }
//               },