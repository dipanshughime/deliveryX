import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliveryx/Users/Users_screen/Sender/homepage.dart';
import 'package:deliveryx/Users/Users_screen/SignInWithGoogle.dart';
import 'package:deliveryx/Users/Users_screen/Traveller/homepage.dart';
import 'package:deliveryx/Users/Users_screen/home_screens.dart';
import 'package:deliveryx/Users/Users_screen/login_screen.dart';
import 'package:deliveryx/Users/Users_screen/login_with_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    Future<User?> checkSession() async {
  
      return FirebaseAuth.instance.currentUser;
      
    }

    Future<String?> checkUserRole() async {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // User is signed in, check their role in your Firebase Firestore users collection.
        // Replace 'your_firestore_collection' with your actual collection name.
        final userData = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (userData.exists) {
          final role = userData['role'];
          return role.toString();
        }
      }
      return null; // User is not signed in or their role is not found.
    }

    // Delayed navigation based on the session and user role
    Future.delayed(Duration(seconds: 3), () async {
      final user = await checkSession();

      if (user == null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()));
        return;
      }

      if (user != null) {
        final role = await checkUserRole();
        if (role != null) {
          if (role == '0') {
            // User is a sender, navigate to sender homepage
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Homepage_Sender()));
          } else if (role == '1') {
            // User is a traveler, navigate to traveler homepage
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()));
          }
        } else {
          // Role not found, navigate to login page
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginScreen()));
        }
      } else {
        // User is not signed in, navigate to login page
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/images/logo.png"),
              width: 600,
            ),
            SizedBox(height: 30),
            SpinKitSquareCircle(
              color: Colors.grey,
              size: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}





// import 'package:deliveryx/Users/Users_screen/Sender/homepage.dart';
// import 'package:deliveryx/Users/Users_screen/home_screens.dart';
// import 'package:deliveryx/Users/Users_screen/login_with_otp.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: SplashScreen(),
//   ));
// }



// class SplashScreen extends StatelessWidget {
  
//   @override
//   Widget build(BuildContext context) {
//     Future<bool> checkSession() async {
//   final user = FirebaseAuth.instance.currentUser;
//   return user != null;
// }

    
//    // Delayed navigation based on the session
//     Future.delayed(Duration(seconds: 5), () async {
//       bool isLoggedIn = await checkSession();
//       if (isLoggedIn) {
//         // User is logged in, navigate to the home page
//         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Homepage_Sender()));
//       } else {
//         // User is not logged in, navigate to the login page
//         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
//       }
//     });

//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image(
//               image: AssetImage("assets/images/logo.png"),
//               width: 600,
//             ),
//             SizedBox(height: 30),
//             SpinKitSquareCircle(
//               color: Colors.grey,
//               size: 20.0,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

















