import 'package:deliveryx/homepage_sender.dart';
import 'package:deliveryx/send/pages/orderdetails_sender.dart';
import 'package:deliveryx/send/pages/ordersDetails.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OrderDetails(),
    );
  }
}
