import 'package:cloud_firestore/cloud_firestore.dart';

class AuthMethods {
   Future<Map<String, dynamic>> getUserData(String uid) async {
    final userDoc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    return userDoc.data() as Map<String, dynamic>;
  }

}
