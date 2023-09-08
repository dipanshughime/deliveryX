import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliveryx/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PackageData {
  String senderName = '';
  String senderPhone = '';
  String senderAddress = '';
  String senderCity = '';
  String senderState = '';
  String senderPincode = '';

  String receiverName = '';
  String receiverPhone = '';
  String receiverAddress = '';
  String receiverCity = '';
  String receiverState = '';
  String receiverPincode = '';
}
class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthService _authService = AuthService();



  

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
        "traveller": false,
        "role": -1
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

  User? currentUser;

  @override
  void initState() {
    currentUser = FirebaseAuth.instance.currentUser;
    print(currentUser);
  }

  Future<void> saveOrder(
  String senderName,
  String senderPhone ,
  String senderAddress ,
  String senderCity ,
  String senderState ,
  String senderPincode ,

  String receiverName ,
  String receiverPhone ,
  String receiverAddress ,
  String receiverCity ,
  String receiverState ,
  String receiverPincode ,
    String category,
    String weight,
    String size,
    bool acceptedTerms,
  ) async {
    try {
   
      if (currentUser != null) {
        final userId = currentUser!.uid;


          final data = {
            'Sender Name' : senderName,
            'Sender Phone' : senderPhone,
            'Sender Address': senderAddress,
            'Sender City' : senderCity,
            'Sender State': senderState,
            'Sender Pincode':senderPincode,

             'Receiver Name' : receiverName,
            'Receiver Phone' : receiverPhone,
            'Receiver Address': receiverAddress,
            'Receiver City' : receiverCity,
            'Receiver State': receiverState,
            'Receiver Pincode':receiverPincode,

            'category': category,
            'weight': weight,
            'size': size,
            'acceptedTerms': acceptedTerms,
          };

          final packageSubcollectionRef = _firestore
              .collection('users')
              .doc(userId)
              .collection('orders');

          await packageSubcollectionRef.add(data);
        } else {
          // No orders found for the current user
        }
      
    } catch (error) {
      print('Error saving order: $error');
      throw error;
    }
  }
}
  



  // Future<void> saveOrder(PackageData packageData) async {
      
  // if (currentUser == null) {
  //   // Handle the case where the user is not logged in
  //   return;
  // }

  // final senderId = currentUser!.uid;
  // final ordersCollection = FirebaseFirestore.instance
  //     .collection('users')
  //     .doc(senderId)
  //     .collection('orders');

  // await ordersCollection.add({
  //   "userid": senderId,
  //   'Sender Name': packageData.senderName,
  //   'Sender Phone': packageData.senderPhone,
  //   'Sender Address': packageData.senderAddress,
  //   'Sender City': packageData.senderCity,
  //   'Sender State': packageData.senderState,
  //   'Sender Pincode': packageData.senderPincode,
  //   'Receiver Name': packageData.receiverName,
  //   'Receiver Phone': packageData.receiverPhone,
  //   'Receiver Address': packageData.receiverAddress,
  //   'Receiver City': packageData.receiverCity,
  //   'Receiver State': packageData.receiverState,
  //   'Receiver Pincode': packageData.receiverPincode,
  //   'Status': 'Active',
  //   'Time Stamp': FieldValue.serverTimestamp(),
  // });





  



  // Add other Firestore-related methods here
