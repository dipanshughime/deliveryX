import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../services/auth.dart';
import '../../services/firestore.dart';
import 'login_screen.dart';
import 'login_with_otp.dart';
// Import the auth.dart file with Firebase-related functions

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  List<String> cities = [
    'Mumbai',
    'Nagpur',
    'Ahmedabad',
    'Bangalore',
    'Chennai',
    'Delhi',
    'Hyderabad',
    'Jaipur',
    'Kolkata',
    'Pune'
  ];
  String? selectedCity;
  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();
  final nameTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  final phoneTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  bool passwordVisible = false;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      try {
        final user = await _authService.signUpWithEmailAndPassword(
          emailTextEditingController.text.trim(),
          passwordTextEditingController.text.trim(),
        );

        if (user != null) {
          await _firestoreService.addUserToFirestore(
            userId: user.uid,
            name: nameTextEditingController.text.trim(),
            email: emailTextEditingController.text.trim(),
            phone: phoneTextEditingController.text.trim(),
            location: selectedCity!,
          );

          await Fluttertoast.showToast(msg: "Successfully Registered");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (c) => LoginScreen()),
          );
        }
      } catch (error) {
        Fluttertoast.showToast(msg: "Error occurred:\n$error");
      }
    } else {
      Fluttertoast.showToast(msg: "Not all fields are valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25),
                Container(
                  alignment: Alignment.topLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color.fromARGB(255, 203, 195, 195),
                        width: 1,
                      ),
                    ),
                    child: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.arrowLeft,
                        color: Colors.black,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      iconSize: 30,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  'Cheaper and faster delivery',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Get great experience with DeliveryX :)',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 35),
                buildTextField('Full Name', Icons.person, 'Enter your name',
                    controller: nameTextEditingController, validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  if (!RegExp(r"^[a-zA-Z ]+$").hasMatch(value)) {
                    return 'Name should only contain alphabets';
                  }
                  return null;
                }),
                SizedBox(height: 16),
                Text(
                  'City/Province',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: selectedCity,
                  items: cities.map((city) {
                    return DropdownMenuItem<String>(
                      value: city,
                      child: Text(city),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCity = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a city/province';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon:
                        Icon(Icons.location_city, color: Color(0xFFA084E8)),
                    hintText: 'Select a city/province',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 203, 195, 195)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFA084E8)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                buildTextField(
                  'Phone Number',
                  Icons.phone,
                  'Enter your number',
                  controller: phoneTextEditingController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return 'Please enter 10 digits';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                buildTextField('Email', Icons.email, 'Enter your email',
                    controller: emailTextEditingController, validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(
                          r"^([a-zA-Z0-9\._]+)@([a-zA-Z0-9])+.([a-z]+)(.[a-z]+)?$")
                      .hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                }),
                SizedBox(height: 16),
                buildTextField('Password', Icons.lock, 'Enter your password',
                    controller: passwordTextEditingController,
                    isPassword: true, validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  if (!RegExp(
                          r'^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$')
                      .hasMatch(value)) {
                    return 'Password must include letters, numbers, and special characters';
                  }
                  return null;
                }),
                SizedBox(height: 32),
                Center(
                  child: ElevatedButton(
                    onPressed: _submit,
                    child: Text(
                      'Create Account',
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
                      elevation: 5,
                      minimumSize: Size(double.infinity, 0), // Full width
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Implement Already Have Account logic here
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => LoginScreenOTP()));
                  },
                  child: Center(
                    child: Text(
                      'Already have an account? Sign in',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
    String label,
    IconData icon,
    String hint, {
    bool isPassword = false,
    TextEditingController? controller,
    TextInputType? keyboardType,
    FormFieldValidator<String>? validator,
  }) {
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
          keyboardType: keyboardType,
          validator: validator,
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
