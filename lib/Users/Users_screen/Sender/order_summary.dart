import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderClick extends StatefulWidget {
  // final String orderId; //FIREBASE!!!!
  // final String distance;
  // final String location;
  // final String cost;

  // const OrderClick({
  //   // required this.orderId, //FIREBASE!!!!
  //   required this.distance,
  //   required this.location,
  //   required this.cost,
  // });

  @override
  State<OrderClick> createState() => _OrderClickState();
}

class _OrderClickState extends State<OrderClick> {
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
                        "Sender's addresssss",
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
                      Text("Address: ",
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
                          "Rs.",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
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