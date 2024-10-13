import 'package:attendance_app/pages/add_student.dart';
import 'package:attendance_app/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    getontheload();
    super.initState();
  }

  getontheload() async {
    StudentStream = await DatabaseMethods().getStudentDetails();
    setState(() {});
  }

  Stream? StudentStream;

  Widget ShowstudentList() {
    return StreamBuilder(
        stream: StudentStream,
        builder: (context, AsyncSnapshot snapshots) {
          if (!snapshots.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshots.data.docs.length,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              DocumentSnapshot ds = snapshots.data.docs[index];
              return Material(
                borderRadius: BorderRadius.circular(15.0),
                elevation: 5.0,
                child: Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Student Name:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              ds["Name"],
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            GestureDetector(
                                onTap: () async {
                                  await DatabaseMethods()
                                      .deleteStudentData(ds.id);
                                },
                                child: const Icon(Icons.delete_outline_sharp)),
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Roll No:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              ds["RollNo"],
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Student Age:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              ds["Age"],
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Attendance:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 19.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            ds["Present"] == false
                                ? GestureDetector(
                                    onTap: () async {
                                      await DatabaseMethods()
                                          .updateAttendance("Present", ds.id);
                                    },
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Center(
                                        child: Text(
                                          "P",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 35,
                                    height: 35,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Center(
                                      child: Text(
                                        "P",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                            const SizedBox(
                              width: 10,
                            ),
                            ds["Absent"] == false
                                ? GestureDetector(
                                    onTap: () async {
                                      await DatabaseMethods()
                                          .updateAttendance("Absent", ds.id);
                                    },
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Center(
                                        child: Text(
                                          "A",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 35,
                                    height: 35,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Center(
                                      child: Text(
                                        "A",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ],
                    )),
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddStudent()));
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 30.0, left: 40.0, right: 40.0),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Student",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Attendance",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              ShowstudentList(),
            ],
          ),
        ),
      ),
    );
  }
}
