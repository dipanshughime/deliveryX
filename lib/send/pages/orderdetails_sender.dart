import 'dart:html';
import 'dart:js_interop';

import 'package:deliveryx/send/components/sender_location.dart';
import 'package:flutter/material.dart';

import '../components/details_label.dart';

class OrderDetails_Sender extends StatefulWidget {
  const OrderDetails_Sender({super.key});

  @override
  State<OrderDetails_Sender> createState() => _OrderDetails_SenderState();
}

class _OrderDetails_SenderState extends State<OrderDetails_Sender> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DetailsLabel(label: 'Name'),
            DecoratedBox(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Material(
                child: TextFormField(
                  validator: (value) {
                    if (value.isNull) {
                      return 'Please Enter Name';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Senders Name',
                    prefixIcon: const Icon(Icons.person),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.black12)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
            DetailsLabel(label: 'Phone Number'),
            DecoratedBox(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Material(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Senders Phone Number',
                    prefixIcon: const Icon(Icons.phone),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.black12)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
            const DetailsLabel(label: 'Block Number'),
            DecoratedBox(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Material(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Senders Block Number',
                    prefixIcon: const Icon(Icons.pin),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.black12)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
            const DetailsLabel(label: 'Street Name'),
            DecoratedBox(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Material(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Senders Street Name',
                    prefixIcon: const Icon(Icons.location_pin),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.black12)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
            const DetailsLabel(label: 'Landmark'),
            DecoratedBox(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Material(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Landmark',
                    prefixIcon: const Icon(Icons.location_pin),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.black12)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
            const DetailsLabel(label: 'City Name'),
            DecoratedBox(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Material(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter City',
                    prefixIcon: const Icon(Icons.location_city_outlined),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.black12)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
            const DetailsLabel(label: 'State'),
            DecoratedBox(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Material(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter State',
                    prefixIcon: const Icon(Icons.location_history),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.black12)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
            const DetailsLabel(label: 'Pin Code'),
            DecoratedBox(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Material(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Pin Code',
                    prefixIcon: const Icon(Icons.location_on),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.black12)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class DetailsLabel extends StatelessWidget {
//   final String label;
//   const DetailsLabel({
//     required this.label,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(15, 7, 0, 2),
//       child: Text('$label :',
//           textAlign: TextAlign.left, style: TextStyle(fontSize: 16)),
//     );
//   }
// }

// class OrderDetails_Sender extends StatelessWidget {
//   const OrderDetails_Sender({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SafeArea(
//         child: Directionality(
//           textDirection: TextDirection.ltr,
//           child: Scaffold(
//             backgroundColor: Colors.white,
//             body: Column(children: [
//               const DecoratedBox(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                 ),
//                 child: SenderLocationInfo(),
//               ),
//               TabBarStatus(),
//               const OrderDetails_Sender(),
//               // ElevatedButton(onPressed:  , child: const Text('Enter Recievers Details',style:TextStyle(backgroundColor: Colors.purple)))
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class TabBarStatus extends StatefulWidget {
//   const TabBarStatus({
//     super.key,
//   });

//   @override
//   State<TabBarStatus> createState() => _TabBarStatusState();
// }

// class _TabBarStatusState extends State<TabBarStatus>
//     with SingleTickerProviderStateMixin {
//   late TabController tabController;

//   @override
//   void initState() {
//     tabController = TabController(length: 2, vsync: this);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Container(
//           decoration: const BoxDecoration(
//             color: Colors.grey,
//             borderRadius: BorderRadius.all(
//               Radius.circular(25),
//             ),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(6.0),
//             child: TabBar(
//                 unselectedLabelColor: Colors.white70,
//                 labelColor: Colors.black,
//                 indicatorColor: Colors.white,
//                 indicatorWeight: 2,
//                 indicator: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 controller: tabController,
//                 tabs: [
//                   Tab(
//                     text: 'Senders Info',
//                   ),
//                   Tab(
//                     text: 'Recievers Info',
//                   ),
//                 ]),
//           ),
//         ),
//       ],
//       // Expanded(
//       //   child: TabBarView(
//       //     children : [const Text('reciever'),const Text('hello')]
//       //   )
//       // )
//     );
//   }
// }
