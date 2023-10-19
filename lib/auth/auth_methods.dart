import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  Future<String> fetchCurrentUserUsername() async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final userDoc = await FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .get();
        if (userDoc.exists) {
          final userData = userDoc.data() as Map<String, dynamic>;
          if (userData.containsKey('username')) {
            return userData['username'];
          }
        }
      }

      // Return a default value or handle the case where the user or user document doesn't exist
      return "Unknown User";
    } catch (error) {
      // Handle any errors that occur during data retrieval
      print("Error fetching current user data: $error");
      return "Error Occurred";
    }
  }
}
