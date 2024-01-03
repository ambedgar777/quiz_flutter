import 'package:cloud_firestore/cloud_firestore.dart';

//method to add data and query to the firebase database....
class DatabaseMethods {
  Future addQuizCategory(Map<String, dynamic> userQuizCategory, String category) async {
    return await FirebaseFirestore.instance.collection(category).add(userQuizCategory);
  }

//method to add query to the specific category to the homepage.
  Future<Stream<QuerySnapshot>> getCategoryQuiz(String category) async {
    return FirebaseFirestore.instance.collection(category).snapshots();
  }
}
