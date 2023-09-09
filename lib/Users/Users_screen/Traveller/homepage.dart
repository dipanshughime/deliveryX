import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliveryx/Users/Users_screen/Sender/order_summary.dart';
import 'package:deliveryx/Users/Users_screen/Sender/profilepage.dart';
import 'package:deliveryx/Users/Users_screen/Traveller/order_summary.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  Stream<QuerySnapshot>? _stream;

  @override
  void initState() {
    super.initState();

    final currentUser = FirebaseAuth.instance.currentUser;
    _stream = FirebaseFirestore.instance
        .collectionGroup("orders")
        .where("Status", isEqualTo: "Active")
        .orderBy("userid", descending: true)
        .where("userid", isNotEqualTo: currentUser?.uid)
        .orderBy("Timestamp", descending: true)
        .snapshots();
  }

  late String location;
  late String date;
  late String cost;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // orders from location wala container
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(color: Color(0xff1d272f)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Orders",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            )),
                        Icon(
                          Icons.filter_alt_rounded,
                          size: 30,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    //ENTER LOCATION FIELD
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Color(0xFFA084E8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Icon(Icons.search),
                            SizedBox(width: 15),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Enter Your Location",
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Icon(Icons.location_on_outlined),
                          ],
                        ),
                      ),
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
              child: Text("Recent packages",
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
                  stream: _stream,
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
                        final Random random = new Random();
                        final int cost = random.nextInt(601) + 701;
                        final orderData =
                            orders[index].data() as Map<String, dynamic>;
                        final senderName = orderData['Sender Name'] as String?;
                        final receiverName =
                            orderData['Receiver Name'] as String?;
                        final receiverAddress =
                            orderData['Receiver Address'] as String?;
                        final senderAddress =
                            orderData['Sender Address'] as String?;
                        final pCategory = orderData['category'] as String?;
                        final pSize = orderData['size'] as String?;
                        final pweight = orderData['weight'] as String?;
                        final timestamp = orderData['Timestamp'] as Timestamp;
                        final formattedDate = DateFormat('yyyy-MM-dd HH:mm')
                            .format(timestamp.toDate());

                        return SingleChildScrollView(
                          child: Card(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OrderClickT(
                                      senderName: senderName,
                                      receiverName: receiverName,
                                      senderAddress: senderAddress,
                                      receiverAddress: receiverAddress,
                                      pCategory: pCategory,
                                      pSize: pSize,
                                      pweight: pweight,
                                    ),
                                  ),
                                );
                                // Add your onPressed or onTap logic here
                                //navigate wala code
                              },
                              child: ListTile(
                                leading: Image.asset(
                                  'assets/images/package.png',
                                  width: 40,
                                  height: 40,
                                ),
                                title: Text("${receiverAddress}"),
                                subtitle: Text("${formattedDate}"),
                                trailing: Text('Rs. ${cost ?? "N/A"}'),
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
          ],
        ),
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
