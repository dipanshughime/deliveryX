import 'package:deliveryx/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _register() async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // User registration successful, update display name
      await userCredential.user!.updateDisplayName(_nameController.text);

      // You can store additional user data to Firestore or other databases if needed

      // Navigate to another screen after registration
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
    } catch (e) {
      print("Error during registration: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                    labelText: 'Name', hintText: 'Enter your name')),
            SizedBox(height: 10),
            TextField(
                controller: _contactNumberController,
                decoration: const InputDecoration(
                    labelText: 'Contact Number',
                    hintText: 'Enter your number')),
            SizedBox(height: 10),
            TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                    labelText: 'Email', hintText: 'Enter your email')),
            SizedBox(height: 10),
            TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: 'Password', hintText: 'Password')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _register, child: Text('Register')),
          ],
        ),
      ),
    );
  }
}
