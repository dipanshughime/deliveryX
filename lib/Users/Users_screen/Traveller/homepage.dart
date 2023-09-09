import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliveryx/Users/Users_screen/Sender/order_summary.dart';
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
                        // SizedBox(
                        //   width: 200,
                        // ),
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
                        final orderData =
                            orders[index].data() as Map<String, dynamic>;
                        final orderId = orders[index].id;
                        final timestamp = orderData['Timestamp'] as Timestamp;
                        final formattedDate = DateFormat('yyyy-MM-dd HH:mm')
                            .format(timestamp.toDate());

                        return SingleChildScrollView(
                          child: Card(
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => OrderClick(),
                                //   ),
                                // );
                              },
                              child: ListTile(
                                leading: Image.asset(
                                  'assets/images/package.png',
                                  width: 40,
                                  height: 40,
                                ),
                                title: Text(orderId ?? ''),
                                subtitle: Text(formattedDate ?? ''),
                                trailing: Text(orderData['Cost'] ?? 'Rs.400'),
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
