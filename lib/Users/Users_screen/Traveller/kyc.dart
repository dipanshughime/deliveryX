import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliveryx/Users/Users_screen/Traveller/homepage.dart';
import 'package:deliveryx/backend/kycapi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class KYCScreen extends StatefulWidget {
  @override
  _KYCScreenState createState() => _KYCScreenState();
}

class _KYCScreenState extends State<KYCScreen> {
  String? aadharVerificationResult;
  String? panVerificationResult;
  TextEditingController aadhaarController = TextEditingController();
  TextEditingController panController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed to avoid memory leaks.
    aadhaarController.dispose();
    panController.dispose();
    super.dispose();
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black, // Change to the desired background color
      textColor: Colors.white, // Change to the desired text color
      fontSize: 16.0,
    );
  }

  Future<String?> checkUserRole() async {
    final user = FirebaseAuth.instance.currentUser;

    print(user);
    if (user != null) {
      // User is signed in, check their role in your Firebase Firestore users collection.
      // Replace 'your_firestore_collection' with your actual collection name.
      final userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userData.exists) {
        final name = userData['name'];
        return name;
      }
    }
    return null; // User is not signed in or their role is not found.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KYC Verification'),
        backgroundColor: Colors.black,
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Text(
                'Aadhaar Verification',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Please enter your Aadhaar and PAN details',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 35),
              buildTextField('Aadhaar Number', Icons.credit_card,
                  'Enter your Aadhaar number', aadhaarController),
              SizedBox(height: 16),
              buildTextField('PAN Number', Icons.person,
                  'Enter your PAN number', panController),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () async {
                  // Get the values from the controllers
                  String aadhaarNumber = aadhaarController.text;
                  String panNumber = panController.text;
                  print(aadhaarNumber);

                  // final panResult = await verifyPan(panNumber);
                  aadharVerificationResult = await verifyAadhar(aadhaarNumber);

                  // Perform PAN verification logic
                  panVerificationResult = await verifyPan(panNumber);

                  final panName = panVerificationResult?.toLowerCase();

                  final name = await checkUserRole();
                  final CollectionName = name?.toLowerCase();

                  if (aadharVerificationResult == 'completed' &&
                      panName == CollectionName) {
                    // Show a toast message indicating successful verification
                    showToast('Aadhar and PAN verified successfully');
                    final user = FirebaseAuth.instance.currentUser;
                    if (user != null) {
                      // Replace 'your_firestore_collection' with your actual collection name.
                      final userRef = FirebaseFirestore.instance
                          .collection('users')
                          .doc(user.uid);

                      await userRef.update({
                        'Aadhar Number': aadhaarNumber,
                        'PAN Number': panNumber,
                      });

                      // Navigate to the next page (replace 'YourNextPage' with the actual page name)
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }
                  } else {
                    // Handle the case where verification fails or conditions are not met
                    if (aadharVerificationResult != 'completed') {
                      showToast('Aadhar verification failed');
                    } else if (panVerificationResult != 'Name_lower') {
                      showToast(
                          'PAN verification failed or Name_lower condition not met');
                    }
                  }
                },
                child: Text(
                  'Verify Aadhaar and PAN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFA084E8), // Button color
                  onPrimary: Colors.black, // Text color
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  minimumSize: Size(double.infinity, 0), // Full width
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, IconData icon, String hint,
      TextEditingController controller,
      {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Color(0xFFA084E8)),
            hintText: hint,
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 203, 195, 195)),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFA084E8)),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ],
    );
  }
}
