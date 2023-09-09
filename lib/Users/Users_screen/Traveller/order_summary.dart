// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Sender/order_details.dart';

class OrderClickT extends StatefulWidget {
  // final String orderId; //FIREBASE!!!!
  final String location;
  final String date;
  final String cost;

  const OrderClickT({
    // required this.orderId, //FIREBASE!!!!
    required this.location,
    required this.date,
    required this.cost,
  });

  @override
  State<OrderClickT> createState() => _OrderClickTState();
}

class _OrderClickTState extends State<OrderClickT> {
  // late Future<DocumentSnapshot<Map<String, dynamic>>> orderData;     firebase!!!!

  // @override
  // void initState() {
  //   super.initState();
  //   // Fetch data from Firebase Firestore
  //   orderData = FirebaseFirestore.instance
  //       .collection('orders')
  //       .doc(widget.orderId)
  //       .get();
  // }
  //FIREBASE!!!

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          child: Card(
            color: Colors.white,
            elevation: 8.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sender",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text("Name:", style: TextStyle(fontSize: 18)),
                      SizedBox(width: 10),
                      Text(
                        "Sender's name",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Address:", style: TextStyle(fontSize: 18)),
                      SizedBox(width: 10),
                      Text(
                        "Sender's addressss",
                        style: TextStyle(fontSize: 18),
                        overflow: TextOverflow
                            .ellipsis, // Add ellipsis when overflowing
                        maxLines: 1,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Receiver",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Text("Name:", style: TextStyle(fontSize: 18)),
                      SizedBox(width: 10),
                      Text(
                        "Receiver's name",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Address: ${widget.location}",
                          style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text("Cost",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        SizedBox(width: 10),
                        Text(
                          "Rs. ${widget.cost}",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        // //button
                        // Align(
                        //   alignment: Alignment.bottomCenter,
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(16.0),
                        //     child: ElevatedButton(
                        //       onPressed: () {
                        //         Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) => OrderDetails()),
                        //         );
                        //       },
                        //       child: Text(
                        //         'Accept Orders',
                        //         style: TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 18,
                        //         ),
                        //       ),
                        //       style: ElevatedButton.styleFrom(
                        //         primary: Color(0xFFA084E8), // Button color
                        //         onPrimary: Colors.black, // Text color
                        //         padding: EdgeInsets.all(20),
                        //         shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(30.0),
                        //         ),
                        //         minimumSize:
                        //             Size(double.infinity, 0), // Full width
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  //button
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderDetails()),
                          );
                        },
                        child: Text(
                          'Accept Orders',
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
