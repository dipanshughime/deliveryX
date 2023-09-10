import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Sender/order_details.dart';

class OrderClickS extends StatefulWidget {
  // final String orderId; //FIREBASE!!!!

  final String? senderName;
  final String? receiverName;
  final String? senderAddress;
  final String? receiverAddress;
  final String? pCategory;
  final String? pweight;
  final String? pSize;

  const OrderClickS({
    // required this.orderId, //FIREBASE!!!!
    required this.senderName,
    required this.receiverName,
    required this.senderAddress,
    required this.receiverAddress,
    required this.pCategory,
    required this.pweight,
    required this.pSize,
  });

  @override
  State<OrderClickS> createState() => _OrderClickSState();
}

class _OrderClickSState extends State<OrderClickS> {
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sender",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text("Name:${widget.senderName}",
                              style: TextStyle(fontSize: 18)),
                          SizedBox(width: 10),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Address:${widget.senderAddress}",
                            style: TextStyle(fontSize: 18),
                            overflow: TextOverflow
                                .ellipsis, // Add ellipsis when overflowing
                            maxLines: 1,
                          ),
                          SizedBox(width: 10),
                          // Text(
                          //   "Sender's addressss",
                          //   style: TextStyle(fontSize: 18),
                          //   overflow: TextOverflow
                          //       .ellipsis, // Add ellipsis when overflowing
                          //   maxLines: 1,
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Receiver",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Text("Name: ${widget.receiverName}",
                              style: TextStyle(fontSize: 18)),
                          SizedBox(width: 10),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Address: ${widget.receiverAddress}",
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
                      Center(
                        child: Column(
                          children: [
                            Text("Details",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold)),
                            SizedBox(width: 10),
                            Text(
                              "${widget.pCategory}",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text("${widget.pweight}",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold)),
                            SizedBox(width: 10),
                            Text(
                              "${widget.pSize}",
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
                              minimumSize:
                                  Size(double.infinity, 0), // Full width
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //------------------------------------------
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
                //         minimumSize: Size(double.infinity, 0), // Full width
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
