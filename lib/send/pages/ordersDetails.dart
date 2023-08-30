// import 'dart:html';
// import 'dart:js_interop';
// import 'package:flutter/material.dart';

// import '../components/sender_location.dart';

// class DetailsLabel extends StatelessWidget {
//   final String label;
//   const DetailsLabel({
//     required this.label,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(15, 7, 0, 2),
//         child: Text('$label :',
//             textAlign: TextAlign.left, style: TextStyle(fontSize: 15)),
//       ),
//     );
//   }
// }

// class OrderDetails extends StatefulWidget {
//   const OrderDetails({
//     super.key,
//   });

//   @override
//   State<OrderDetails> createState() => _OrderDetailsState();
// }

// class _OrderDetailsState extends State<OrderDetails> {
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//           body: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Wrap(children: [
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: DecoratedBox(
//                   decoration: BoxDecoration(
//                     color: Colors.grey,
//                     borderRadius: BorderRadius.all(Radius.circular(30)),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(3.0),
//                     child: TabBar(
//                         unselectedLabelColor: Colors.black,
//                         labelColor: Colors.purple,
//                         indicatorColor: Colors.white,
//                         indicatorWeight: 2,
//                         indicator: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(25),
//                         ),
//                         // controller: tabController,
//                         tabs: [
//                           Tab(
//                             text: 'Senders Info',
//                           ),
//                           Tab(
//                             text: 'Recievers Info',
//                           ),
//                         ]),
//                   ),
//                 ),
//               ),
//               // SingleChildScrollView(child: OrderDetails_Sender()),
//               // Expanded(child: Text('hello'))
//               Expanded(
//                   child: TabBarView(children: [
//                          OrderDetails_Sender(),
//                          OrderDetails_Reciever()
//                       ])),
//               Center(
//                 child: SizedBox(
//                   height: 50,
//                   child: TextButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         // Form is valid, process the data
//                         // For demonstration, print a message
//                         print('Package details submitted');
//                       }
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
//                       child: Text('Enter Package Details'),
//                     ),
//                     style: ButtonStyle(
//                         shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(25))),
//                         backgroundColor:
//                             MaterialStateProperty.all(Colors.purple),
//                         foregroundColor:
//                             MaterialStateProperty.all(Colors.white),
//                         fixedSize:
//                             MaterialStateProperty.all(Size.fromHeight(30))),
//                   ),
//                 ),
//               )
//             ]),
//           ),
        
//       ),
//     );
//   }
// }

// class OrderDetails_Sender extends StatefulWidget {
//   const OrderDetails_Sender({super.key});

//   @override
//   State<OrderDetails_Sender> createState() => _OrderDetails_SenderState();
// }

// class _OrderDetails_SenderState extends State<OrderDetails_Sender> {
//   final _nameController = TextEditingController();
//   final _phoneNumberController = TextEditingController();
//   final _blockNumberController = TextEditingController();
//   final _streetNameController = TextEditingController();
//   final _cityController = TextEditingController();
//   final _landmarkController = TextEditingController();
//   final _stateController = TextEditingController();
//   final _pinCodeController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const DetailsLabel(label: 'Name'),
//             DecoratedBox(
//               decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(4))),
//               child: Material(
//                 child: TextFormField(
//                   controller: _nameController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Name is required';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     hintText: 'Enter Senders Name',
//                     prefixIcon: const Icon(Icons.person),
//                     focusedBorder: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(25)),
//                         borderSide: BorderSide(color: Colors.black12)),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                       borderSide: const BorderSide(color: Colors.grey),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             DetailsLabel(label: 'Phone Number'),
//             DecoratedBox(
//               decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(4))),
//               child: Material(
//                 child: TextFormField(
//                   controller: _phoneNumberController,
//                   keyboardType: TextInputType.phone,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Phone Number is required';
//                     }
//                     if (int.tryParse(value) == null || value.length != 10) {
//                       return 'Enter a Valid Number';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     hintText: 'Enter Senders Phone Number',
//                     prefixIcon: const Icon(Icons.phone),
//                     focusedBorder: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(25)),
//                         borderSide: BorderSide(color: Colors.black12)),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                       borderSide: const BorderSide(color: Colors.grey),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const DetailsLabel(label: 'Block Number'),
//             DecoratedBox(
//               decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(4))),
//               child: Material(
//                 child: TextFormField(
//                   controller: _blockNumberController,
//                   keyboardType: TextInputType.phone,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Block Number is required';
//                     }
//                     if (int.tryParse(value) == null) {
//                       return 'Enter a valid Block Number';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     hintText: 'Enter Senders Block Number',
//                     prefixIcon: const Icon(Icons.pin),
//                     focusedBorder: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(25)),
//                         borderSide: BorderSide(color: Colors.black12)),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                       borderSide: const BorderSide(color: Colors.grey),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const DetailsLabel(label: 'Street Name'),
//             DecoratedBox(
//               decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(4))),
//               child: Material(
//                 child: TextFormField(
//                   controller: _streetNameController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Street Name is required';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     hintText: 'Enter Senders Street Name',
//                     prefixIcon: const Icon(Icons.location_pin),
//                     focusedBorder: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(25)),
//                         borderSide: BorderSide(color: Colors.black12)),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                       borderSide: const BorderSide(color: Colors.grey),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const DetailsLabel(label: 'Landmark'),
//             DecoratedBox(
//               decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(4))),
//               child: Material(
//                 child: TextFormField(
//                   controller: _landmarkController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Landmark is required';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     hintText: 'Enter Landmark',
//                     prefixIcon: const Icon(Icons.location_pin),
//                     focusedBorder: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(25)),
//                         borderSide: BorderSide(color: Colors.black12)),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                       borderSide: const BorderSide(color: Colors.grey),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const DetailsLabel(label: 'City Name'),
//             DecoratedBox(
//               decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(4))),
//               child: Material(
//                 child: TextFormField(
//                   controller: _cityController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'City is required';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     hintText: 'Enter City',
//                     prefixIcon: const Icon(Icons.location_city_outlined),
//                     focusedBorder: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(25)),
//                         borderSide: BorderSide(color: Colors.black12)),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                       borderSide: const BorderSide(color: Colors.grey),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const DetailsLabel(label: 'State'),
//             DecoratedBox(
//               decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(4))),
//               child: Material(
//                 child: TextFormField(
//                   controller: _stateController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'State is required';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     hintText: 'Enter State',
//                     prefixIcon: const Icon(Icons.location_history),
//                     focusedBorder: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(25)),
//                         borderSide: BorderSide(color: Colors.black12)),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                       borderSide: const BorderSide(color: Colors.grey),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const DetailsLabel(label: 'Pin Code'),
//             DecoratedBox(
//               decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(4))),
//               child: Material(
//                 child: TextFormField(
//                   controller: _pinCodeController,
//                   keyboardType:
//                       TextInputType.phone, // Set keyboard type to phone
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'PinCode is required';
//                     }
//                     if (int.tryParse(value) == null || value.length != 6) {
//                       return 'Invalid PinCode';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     hintText: 'Enter Pin Code',
//                     prefixIcon: const Icon(Icons.location_on),
//                     focusedBorder: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(25)),
//                         borderSide: BorderSide(color: Colors.black12)),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                       borderSide: const BorderSide(color: Colors.grey),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class OrderDetails_Reciever extends StatefulWidget {
//   const OrderDetails_Reciever({super.key});

//   @override
//   State<OrderDetails_Reciever> createState() => _OrderDetails_RecieverState();
// }

// class _OrderDetails_RecieverState extends State<OrderDetails_Reciever> {
//   final _nameController = TextEditingController();
//   final _phoneNumberController = TextEditingController();
//   final _blockNumberController = TextEditingController();
//   final _streetNameController = TextEditingController();
//   final _cityController = TextEditingController();
//   final _landmarkController = TextEditingController();
//   final _stateController = TextEditingController();
//   final _pinCodeController = TextEditingController();
//   final _fromTimeController = TextEditingController();
//   final _toTimeController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const DetailsLabel(label: 'Name'),
//             DecoratedBox(
//               decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(4))),
//               child: Material(
//                 child: TextFormField(
//                   controller: _nameController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Name is required';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     hintText: 'Enter Recievers Name',
//                     prefixIcon: const Icon(Icons.person),
//                     focusedBorder: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(25)),
//                         borderSide: BorderSide(color: Colors.black12)),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             DetailsLabel(label: 'Phone Number'),
//             DecoratedBox(
//               decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(4))),
//               child: Material(
//                 child: TextFormField(
//                   controller: _phoneNumberController,
//                   keyboardType: TextInputType.phone,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Phone Number is required';
//                     }
//                     if (int.tryParse(value) == null || value.length != 10) {
//                       return 'Enter a Valid Number';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     hintText: 'Enter Recievers Phone Number',
//                     prefixIcon: const Icon(Icons.phone),
//                     focusedBorder: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(25)),
//                         borderSide: BorderSide(color: Colors.black12)),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const DetailsLabel(label: 'Block Number'),
//             DecoratedBox(
//               decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(4))),
//               child: Material(
//                 child: TextFormField(
//                   controller: _blockNumberController,
//                   keyboardType: TextInputType.phone,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Block Number is required';
//                     }
//                     if (int.tryParse(value) == null) {
//                       return 'Enter a valid Block Number';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     hintText: 'Enter Recievers Block Number',
//                     prefixIcon: const Icon(Icons.pin),
//                     focusedBorder: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(25)),
//                         borderSide: BorderSide(color: Colors.black12)),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                       borderSide: const BorderSide(color: Colors.grey),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const DetailsLabel(label: 'Street Name'),
//             DecoratedBox(
//               decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(4))),
//               child: Material(
//                 child: TextFormField(
//                   controller: _streetNameController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Street Name is required';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     hintText: 'Enter Recievers Street Name',
//                     prefixIcon: const Icon(Icons.location_pin),
//                     focusedBorder: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(25)),
//                         borderSide: BorderSide(color: Colors.black12)),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                       borderSide: const BorderSide(color: Colors.grey),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const DetailsLabel(label: 'Landmark'),
//             DecoratedBox(
//               decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(4))),
//               child: Material(
//                 child: TextFormField(
//                   controller: _landmarkController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Landmark is required';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     hintText: 'Enter Landmark',
//                     prefixIcon: const Icon(Icons.location_pin),
//                     focusedBorder: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(25)),
//                         borderSide: BorderSide(color: Colors.black12)),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                       borderSide: const BorderSide(color: Colors.grey),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const DetailsLabel(label: 'City Name'),
//             DecoratedBox(
//               decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(4))),
//               child: Material(
//                 child: TextFormField(
//                   controller: _cityController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'City is required';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     hintText: 'Enter City',
//                     prefixIcon: const Icon(Icons.location_city_outlined),
//                     focusedBorder: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(25)),
//                         borderSide: BorderSide(color: Colors.black12)),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                       borderSide: const BorderSide(color: Colors.grey),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const DetailsLabel(label: 'State'),
//             DecoratedBox(
//               decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(4))),
//               child: Material(
//                 child: TextFormField(
//                   controller: _stateController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'City is required';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     hintText: 'Enter State',
//                     prefixIcon: const Icon(Icons.location_history),
//                     focusedBorder: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(25)),
//                         borderSide: BorderSide(color: Colors.black12)),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                       borderSide: const BorderSide(color: Colors.grey),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const DetailsLabel(label: 'Pin Code'),
//             DecoratedBox(
//               decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(4))),
//               child: Material(
//                 child: TextFormField(
//                   controller: _pinCodeController,
//                   keyboardType:
//                       TextInputType.phone, // Set keyboard type to phone
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'PinCode is required';
//                     }
//                     if (int.tryParse(value) == null || value.length != 6) {
//                       return 'Invalid PinCode';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     hintText: 'Enter Pin Code',
//                     prefixIcon: const Icon(Icons.location_on),
//                     focusedBorder: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(25)),
//                         borderSide: BorderSide(color: Colors.black12)),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                       borderSide: const BorderSide(color: Colors.grey),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const DetailsLabel(label: 'Enter Recievers Available Time'),
//             Row(children: [
//               SizedBox(
//                 width: 100,
//                 child: DecoratedBox(
//                   decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(4))),
//                   child: Material(
//                     child: TextFormField(
//                       controller: _fromTimeController,
//                       keyboardType:
//                           TextInputType.phone, // Set keyboard type to phone
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'PinCode is required';
//                         }
//                         if (int.tryParse(value) == null || value.length != 4) {
//                           return 'Invalid PinCode';
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         hintText: '12:00',
//                         prefixIcon: const Icon(Icons.location_on),
//                         focusedBorder: const OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(25)),
//                             borderSide: BorderSide(color: Colors.black12)),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(25),
//                           borderSide: const BorderSide(color: Colors.grey),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: Text(' - '),
//               ),
//               SizedBox(
//                 width: 100,
//                 child: DecoratedBox(
//                   decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(4))),
//                   child: Material(
//                     child: TextFormField(
//                       controller: _toTimeController,
//                       keyboardType:
//                           TextInputType.phone, // Set keyboard type to phone
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'PinCode is required';
//                         }
//                         if (int.tryParse(value) == null || value.length != 4) {
//                           return 'Invalid PinCode';
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         hintText: '24:00',
//                         prefixIcon: const Icon(Icons.location_on),
//                         focusedBorder: const OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(25)),
//                             borderSide: BorderSide(color: Colors.black12)),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(25),
//                           borderSide: const BorderSide(color: Colors.grey),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ])
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget buildTextField(String label, IconData icon, String hint,
//       {bool isPassword = false,
//       TextInputType? keyboardType,
//       FormFieldValidator<String>? validator}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 8),
//         TextFormField(
//           obscureText: isPassword,
//           keyboardType: keyboardType,
//           validator: validator, // Validator function
//           decoration: InputDecoration(
//             prefixIcon: Icon(icon, color: Color(0xFFA084E8)),
//             hintText: hint,
//             border: OutlineInputBorder(),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Color.fromARGB(255, 203, 195, 195)),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Color(0xFFA084E8)),
//               borderRadius: BorderRadius.circular(15),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

