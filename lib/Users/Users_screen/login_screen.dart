import 'package:flutter/material.dart';
import 'package:deliveryx/Users/Users_screen/registration.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home_screens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  bool passwordVisible = false;

  void _login() async {
    try {
      final authResult = await _auth.signInWithEmailAndPassword(
        email: emailTextEditingController.text.trim(),
        password: passwordTextEditingController.text.trim(),
      );

      if (authResult.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => HomeScreen()));
      } else {
        // Handle login failure
        _showDialog("Login Failed", "Invalid credentials. Please try again.");
      }
    } catch (error) {
      // Handle login error
      _showDialog("Login Error", "An error occurred while logging in.");
    }
  }

  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Cheaper and faster delivery ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Get great experience with Delivery',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: emailTextEditingController,
              keyboardType: TextInputType.emailAddress, // Corrected input type
              decoration: InputDecoration(
                hintText: "Email", // Changed hint text
                prefixIcon: Icon(Icons.email),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: passwordTextEditingController,
              obscureText: !passwordVisible,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(Icons.lock),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _login();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                primary: Colors.purple[200],
                onPrimary: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 24,
                ),
                child: Text('Login'),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("New user? "),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => RegisterScreen()));
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(color: Colors.purple[200]),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Perform Google sign-up logic here
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                primary: Color.fromARGB(255, 241, 240, 240),
                onPrimary: Color.fromARGB(255, 0, 0, 0),
              ),
              // icon: Image.asset(
              // 'path_to_google_icon.png'), // Replace with the actual path

              child: Text('Sign up with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
