import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentProvider extends ChangeNotifier {
  Future<void> addStudent(
      Map<String, dynamic> studentInfoMap, String id) async {
    await FirebaseFirestore.instance
        .collection("Students")
        .doc(id)
        .set(studentInfoMap);
    notifyListeners();
  }

  Future<Stream<QuerySnapshot>> getStudentDetails() async {
    return FirebaseFirestore.instance.collection("Students").snapshots();
  }

  Future<void> updateAttendance(String attendance, String id) async {
    await FirebaseFirestore.instance
        .collection("Students")
        .doc(id)
        .update({attendance: true});
    notifyListeners();
  }

  Future<void> deleteStudentData(String id) async {
    await FirebaseFirestore.instance.collection("Students").doc(id).delete();
    notifyListeners();
  }
}
