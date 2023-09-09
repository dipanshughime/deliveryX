// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Sender/order_details.dart';

class OrderClickT extends StatefulWidget {
  // final String orderId; //FIREBASE!!!!

  // final String? cost;
  final String? senderName;
  final String? receiverName;
  final String? senderAddress;
  final String? receiverAddress;
  final String? pCategory;
  final String? pweight;
  final String? pSize;
  final String cost;

  const OrderClickT(
      {
      // required this.orderId, //FIREBASE!!!!

      // required this.cost,
      required this.senderName,
      required this.receiverName,
      required this.senderAddress,
      required this.receiverAddress,
      required this.pCategory,
      required this.pweight,
      required this.pSize,
      required this.cost});

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
        title: Text("Order Summary"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //CHILD-1 Category and Item Name
            Text("Category",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            SizedBox(
              height: 10,
            ),

            // Category Details
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color.fromARGB(255, 194, 194, 194),
                    width: 1,
                  )),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/box.png',
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(width: 16),
                  Text("${widget.pweight}", style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),

            //CHILD-2 (2 COLUMNs INSIDE ROW)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //COLUMN 1 weight
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Weight",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 10,
                      ),

                      // Weight Details
                      Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color.fromARGB(255, 194, 194, 194),
                              width: 1,
                            )),
                        child: Row(
                          children: [
                            Text("${widget.pweight}",
                                style: TextStyle(fontSize: 16)),
                            SizedBox(width: 70),
                            Container(
                              height: 16,
                              width: 1,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 8),
                            Text('kg', style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  width: 30,
                ),

                //COLUMN 2 size
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Dimension:",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 10,
                      ),

                      // dimension Details
                      Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color.fromARGB(255, 194, 194, 194),
                              width: 1,
                            )),
                        child: Row(
                          children: [
                            Text("${widget.pSize}",
                                style: TextStyle(fontSize: 16)),
                            SizedBox(width: 70),
                            Container(
                              height: 16,
                              width: 1,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 8),
                            Text('cm', style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),

            //CHILD-3 pickup location (sender's address)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pickup Location",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color.fromARGB(255, 194, 194, 194),
                        width: 1,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${widget.senderAddress}",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),

            //CHILD-4 Drop Location (receiver's address)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Drop Location",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color.fromARGB(255, 194, 194, 194),
                        width: 1,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${widget.receiverAddress}",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),

            //COST
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Cost -",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                SizedBox(width: 10),
                Text(
                  "Rs",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(width: 5),
                Text(
                  "${widget.cost}",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),

            //button
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderDetails()),
                  );
                },
                child: Text(
                  'Deliver',
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
    );
  }
}
