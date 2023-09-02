import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUserToFirestore({
    required String userId,
    required String name,
    required String email,
    required String phone,
    required String location,
  }) async {
    try {
      final userMap = {
        "id": userId,
        "name": name,
        "email": email,
        "phone": phone,
        "location": location,
        "sender": false,
        "receiver": false,
      };

      await _firestore.collection('users').doc(userId).set(userMap);
    } catch (error) {
      // Handle errors here
    }
  }

  Future<void> updateUserAsSender(User user) async {
    try {
      Map<String, dynamic> updatedData = {
        "sender": true,
        "role": 0, // Set to true to mark as a sender
      };

      await _firestore.collection("users").doc(user.uid).update(updatedData);
    } catch (e) {
      print("Error updating user as sender: $e");
    }
  }

  Future<void> updateUserAsTraveler(User user) async {
    try {
      Map<String, dynamic> updatedData = {
        "traveler": true,
        "role": 1, // Set to false to mark as not a traveler
      };

      await _firestore.collection("users").doc(user.uid).update(updatedData);

      DocumentSnapshot userSnapshot = await _firestore
          .collection("users")
          .doc(user.uid)
          .get();

      if (userSnapshot.exists) {
        String email = userSnapshot.get("email");
        String name = userSnapshot.get("name");
        String phone = userSnapshot.get("phone");
        String location = userSnapshot.get("location");

        await _firestore
            .collection("users")
            .doc(user.uid)
            .collection("travelers")
            .doc(user.uid)
            .set({
          "email": email,
          "name": name,
          "phone": phone,
          "location": location,
        });
      }
    } catch (e) {
      print("Error updating user as traveler: $e");
    }
  }



  // Add other Firestore-related methods here
}
