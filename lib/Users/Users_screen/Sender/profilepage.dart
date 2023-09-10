import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliveryx/Users/Users_screen/Sender/homepage.dart';
import 'package:deliveryx/Users/Users_screen/Traveller/homepage.dart';
import 'package:deliveryx/Users/Users_screen/Traveller/kyc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../login_screen.dart';

// void main() => runApp(const Profilepage_Sender());

class Profilepage_Sender extends StatefulWidget {
  const Profilepage_Sender({super.key});

  @override
  State<Profilepage_Sender> createState() => _Profilepage_SenderState();
}

class _Profilepage_SenderState extends State<Profilepage_Sender> {
  int _currentIndex = 0;

  String name = ""; // State variable for name
  String phoneNumber = "";

  @override
  void initState() {
    super.initState();
    // Fetch user data from Firestore when the widget is created
    fetchUserData();
  }

  // Function to fetch user data from Firestore
  void fetchUserData() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      print(currentUser);
      if (currentUser != null) {
        final userDoc =
            FirebaseFirestore.instance.collection("users").doc(currentUser.uid);

        final userData = await userDoc.get();

        if (userData.exists) {
          setState(() {
            name = userData.get(
                "name"); // Assuming 'name' is the field name for name in Firestore
            phoneNumber = userData.get(
                "phone"); // Assuming 'phoneNumber' is the field name for phone number in Firestore
          });
          print(name);
        }
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  void _signOut() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        // Update the user's role to -1 in the user collection
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .update({
          'role': -1,
        });
      }

      // Sign out the user
      await FirebaseAuth.instance.signOut();

      // Navigate to the login screen after successful logout
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()));
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  void navigateBasedOnRole() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final userDoc =
          FirebaseFirestore.instance.collection("users").doc(currentUser.uid);

      final userData = await userDoc.get();

      if (userData.exists) {
        final role = userData.get("role");
        final traveler = userData.get("traveler");

        if (role == 0 && !traveler) {
          // Update role to 1 and traveler to false
          await userDoc.update({"role": 1, "traveler": true});

          // Navigate to sender's home page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => KYCScreen(),
            ),
          );
        } else if (role == 0 && traveler) {
          // Update role to 1 and traveler to true
          await userDoc.update({"role": 1});

          // Navigate to traveler home page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        } else if (role == 1) {
          // Update role to 0
          await userDoc.update({"role": 0});

          // Navigate to traveler registration page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Homepage_Sender(),
            ),
          );
        }
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/profile.png', // Replace with your image asset
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        /*1*/
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /*2*/
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("My Profile",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                      )),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      // Add your logout logic here
                                      _signOut(); // Call your logout function when tapped
                                    },
                                    child: Icon(
                                      Icons.logout,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // ),
                            SizedBox(
                              height: 50,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      SizedBox(width: 15),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Hello!! $name",
                                              style: TextStyle(
                                                fontSize: 15,
                                                // fontWeight: FontWeight.w800,
                                                color: Colors.white,
                                              )),
                                          Text("+91 $phoneNumber",
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.white,
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                // SizedBox(
                                //   width: 15,
                                // ),
                                // Column(
                                //   crossAxisAlignment:
                                //       CrossAxisAlignment.start,
                                //   children: [
                                //     Text("Radhika",
                                //         style: TextStyle(
                                //           fontSize: 15,
                                //           // fontWeight: FontWeight.w800,
                                //           color: Colors.white,
                                //         )),
                                //     Text("+91 9156349749",
                                //         style: TextStyle(
                                //           fontSize: 22,
                                //           fontWeight: FontWeight.w800,
                                //           color: Colors.white,
                                //         )),
                                //   ],
                                // ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Icon(
                                    Icons.edit_square,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            // padding: EdgeInsets.only(
            //     bottom: 8, top: 8, left: 8), //apply padding to all four sides
            padding: EdgeInsets.all(16),
            child: Text(
              'Settings',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 8, vertical: 4), //apply padding to all four sides
            child: ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: Color.fromARGB(255, 203, 195, 195),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              leading: Icon(
                Icons.lock,
                color: Color(0xFFA084E8),
              ),
              title: Text(
                'Change Password',
                textAlign: TextAlign.left,
                style: TextStyle(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 8, vertical: 4), //apply padding to all four sides
            child: ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: Color.fromARGB(255, 203, 195, 195),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              leading: Icon(
                Icons.wallet,
                color: Color(0xFFA084E8),
              ),
              title: Text(
                'Wallet',
                textAlign: TextAlign.left,
                style: TextStyle(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 8, vertical: 4), //apply padding to all four sides
            child: InkWell(
              onTap: () {
                navigateBasedOnRole();
              },
              child: ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 1, color: Color.fromARGB(193, 210, 210, 210)),
                  borderRadius: BorderRadius.circular(10),
                ),
                leading: Icon(
                  Icons.person,
                  color: Color(0xFFA084E8),
                ),
                title: Text('Switch Role'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16), //apply padding to all four sides
            child: Text(
              'About Us',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 8, vertical: 4), //apply padding to all four sides
            child: ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 1, color: Color.fromARGB(193, 210, 210, 210)),
                borderRadius: BorderRadius.circular(10),
              ),
              leading: Icon(
                Icons.question_answer_outlined,
                color: Color(0xFFA084E8),
              ),
              title: Text('FAQ'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 8, vertical: 4), //apply padding to all four sides
            child: ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 1, color: Color.fromARGB(193, 210, 210, 210)),
                borderRadius: BorderRadius.circular(10),
              ),
              leading: Icon(
                Icons.security,
                color: Color(0xFFA084E8),
              ),
              title: Text('Privacy Policy'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 8, vertical: 4), //apply padding to all four sides
            child: ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 1, color: Color.fromARGB(193, 210, 210, 210)),
                borderRadius: BorderRadius.circular(10),
              ),
              leading: Icon(
                Icons.phone,
                color: Color(0xFFA084E8),
              ),
              title: Text('Contact Us'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16), //apply padding to all four sides
            child: Text(
              'Other',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 8, vertical: 4), //apply padding to all four sides
            child: ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 1, color: Color.fromARGB(193, 210, 210, 210)),
                borderRadius: BorderRadius.circular(10),
              ),
              leading: Icon(
                Icons.mobile_friendly_rounded,
                color: Color(0xFFA084E8),
              ),
              title: Text('Get the latest version'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: 8, top: 8, left: 8), //apply padding to all four sides
            child: ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 1, color: Color.fromARGB(193, 210, 210, 210)),
                borderRadius: BorderRadius.circular(10),
              ),
              leading: Icon(
                Icons.share,
                color: Color(0xFFA084E8),
              ),
              title: Text('Share'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          // Handle taps on each tab here
          setState(() {
            _currentIndex = index;
          });

          // Add logic based on the selected tab index
          if (index == 0) {
            // Handle Home icon tap
            // Add your logic for the Home icon here
          } else if (index == 1) {
            // Handle Map icon tap
            // Add your logic for the Map icon here
          } else if (index == 2) {
            // Handle Message icon tap
            // Add your logic for the Message icon here
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Profilepage_Sender()), // Replace 'AnotherPage()' with the page you want to navigate to
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on_outlined,
              color: Colors.grey,
            ),
            label: "Map",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message_outlined,
              color: Colors.grey,
            ),
            label: "Message",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
              color: Colors.grey,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
//       //BOTTOM NAV
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         unselectedItemColor:
//             Colors.black, // Set the unselected icon color to black
//         selectedItemColor: Colors.purple,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//               color: Colors.grey,
//             ),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.location_on_outlined,
//               color: Colors.grey,
//             ),
//             label: "Map",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.message_outlined,
//               color: Colors.grey,
//             ),
//             label: "Message",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.account_circle_outlined,
//               color: Colors.grey,
//             ),
//             label: "Profile",
//           ),
//         ],
//       ),
//     );
//   }
// }
