import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliveryx/Users/Users_screen/Sender/order_details.dart';
import 'package:deliveryx/Users/Users_screen/Sender/order_summary.dart';
import 'package:deliveryx/Users/Users_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Homepage_Sender extends StatefulWidget {
  const Homepage_Sender({super.key});

  @override
  State<Homepage_Sender> createState() => _Homepage_SenderState();
}

class _Homepage_SenderState extends State<Homepage_Sender> {
  int _currentIndex = 0;

  Stream<QuerySnapshot>? _ordersStream;

  @override
  void initState() {
    super.initState();
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      _ordersStream = FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .collection('orders')
          .orderBy('Timestamp',descending: true)
          .snapshots();
    }
  }

  void _signOut() async {
  try {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      // Update the user's role to -1 in the user collection
      await FirebaseFirestore.instance.collection('users').doc(currentUser.uid).update({
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // grey container on top
            Container(
              width: double.infinity,
              height: 170,
              decoration: BoxDecoration(color: Color(0xff1d272f)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Your location",
                                    style: TextStyle(
                                      fontSize: 15,
                                      // fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                    )),
                                Text("Mumbai, India",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: _signOut, // Call the _signOut function when tapped
                          child: Image(
                            image: AssetImage("assets/images/user.png"),
                            width: 50,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            //recent packages text
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Recent packages sent",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
            ),

            //listview
                       Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Container(
                height: 350,
                child: StreamBuilder<QuerySnapshot>(
                  stream: _ordersStream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }

                    final orders = snapshot.data!.docs;

                    if (orders.isEmpty) {
                      return Center(child: Text("No recent orders"));
                    }

                    return ListView.builder(
                      itemCount: orders.length,
                      itemBuilder: (BuildContext context, int index) {
                        final orderData = orders[index].data() as Map<String, dynamic>;
                        final orderId = orders[index].id;
                        final timestamp = orderData['Timestamp'] as Timestamp;
                        final formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(timestamp.toDate());

                        return SingleChildScrollView(
                          child: Card(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OrderClick(),
                                  ),
                                );
                              },
                              child: ListTile(
                                leading: Image.asset(
                                  'assets/images/package.png',
                                  width: 40,
                                  height: 40,
                                ),
                                title: Text(orderId ?? ''),
                                subtitle: Text(formattedDate ?? ''),
                                trailing: Text(orderData['Status'] ?? ''),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            //button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderDetails()),
                  );
                },
                child: Text(
                  'Send Package',
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
            ),
          ],
        ),
      ),

      //BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
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
