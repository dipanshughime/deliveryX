import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

   Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }
  
  
   Future<User?> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final authResult = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return authResult.user;
    } catch (error) {
      return null;
    }
  }

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final authResult = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return authResult.user;
    } catch (error) {
      return null;
    }
  }

  


  // Add other authentication-related methods here
}
