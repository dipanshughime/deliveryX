import 'dart:ffi';
import 'package:deliveryx/Users/Users_screen/Sender/profilepage.dart';
import 'package:deliveryx/Users/Users_screen/Traveller/homepage.dart';
import 'package:flutter/material.dart';
import '../../services/auth.dart';
import 'registration.dart';
import 'login_with_otp.dart';
import 'onboarding.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  bool passwordVisible = false;

  void _login() async {
    try {
      final user = await _authService.signInWithEmailAndPassword(
        emailTextEditingController.text.trim(),
        passwordTextEditingController.text.trim(),
      );

      if (user != null) {
        // await storage.write(key: "token", value: "your_token_here");
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => Onboarding()));
      } else {
        // Handle login failure
        _showDialog("Login Failed", "Invalid credentials. Please try again.");
      }
    } catch (error) {
      // Handle login error
      print(error);
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 150),
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
              TextField(
                controller: emailTextEditingController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email, color: Color(0xFFA084E8)),
                  hintText: "Email",
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
              TextFormField(
                controller: passwordTextEditingController,
                obscureText: !passwordVisible,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: Color(0xFFA084E8)),
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
                  hintText: "Password",
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),
              Center(
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _login();
                    },
                    child: Text(
                      'Login',
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
                      //minimumSize: Size(double.infinity, 0), // Full width
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (c) => LoginScreenOTP()));
                    },
                    child: Text(
                      'Login with Phone Number',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.all(20),
                      side: BorderSide(
                        width: 2,
                        color: Color(0xFFA084E8),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      elevation: 5,
                      //minimumSize: Size(double.infinity, 0), // Full width
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("New user? "),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => RegisterScreen()));
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: Color(0xFFA084E8),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
