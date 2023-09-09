import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            child: Image.asset(
              'assets/images/topBgg.jpeg', // Replace with your image asset
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: Row(
              children: [
                Icon(Icons.location_on, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  'Your Current Location',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('orders')
                      .where('userId', isEqualTo: user!.uid)
                      .snapshots(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }
                    if (snapshot == null) {
                      return Center(
                        child: Text("Error"),
                      );
                    }
                    if (snapshot != null && snapshot.data != null) {
                      return ListView.builder(
                        itemCount: snapshot.data!.docs
                            .length, // Replace with the actual number of packages
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('Package #$index'),
                            subtitle: Text('Date: ${DateTime.now()}'),
                            trailing: Text(
                                'Delivered'), // Replace with the delivery status
                          );
                        },
                      );
                    }
                    // Your list view builder code goes here
                    // Replace with the code to display orders
                    return Container();
                  },
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              onPressed: () {
                // Handle sending a package
              },
              icon: Icon(Icons.send),
              label: Text('Send a Package'),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purple, // Set the background color to purple
        unselectedItemColor:
            Colors.black, // Set the unselected icon color to black
        selectedItemColor:
            Colors.purple, // Set the selected icon color to purple
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'My Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
