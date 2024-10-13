import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addStudent(Map<String, dynamic> studentInfoMap, String id) async {
    await FirebaseFirestore.instance
        .collection("Students")
        .doc()
        .set(studentInfoMap);
  }

  Future<Stream<QuerySnapshot>> getStudentDetails() async {
    return await FirebaseFirestore.instance.collection("Students").snapshots();
  }

  updateAttendance(String attendanse, String id) async {
    return await FirebaseFirestore.instance
        .collection("Students")
        .doc(id)
        .update({attendanse: true});
  }

  deleteStudentData(String id) async {
    return await FirebaseFirestore.instance
        .collection("Students")
        .doc(id)
        .delete();
  }
}
