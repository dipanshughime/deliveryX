import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliveryx/Users/Users_screen/Sender/package_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../services/firestore.dart';

class PackageData {
  String senderName = '';
  String senderPhone = '';
  String senderAddress = '';
  String senderCity = '';
  String senderState = '';
  String senderPincode = '';

  String receiverName = '';
  String receiverPhone = '';
  String receiverAddress = '';
  String receiverCity = '';
  String receiverState = '';
  String receiverPincode = '';
}

class OrderDetails extends StatefulWidget {
  const OrderDetails({
    super.key,
  });

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

//The main Page of Order
class _OrderDetailsState extends State<OrderDetails> {
  final _formKey = GlobalKey<FormState>();
  final FirestoreService _firestoreService = FirestoreService();

  TextEditingController senderName = TextEditingController();
  TextEditingController senderPhone = TextEditingController();
  TextEditingController senderAddress = TextEditingController();
  TextEditingController senderCity = TextEditingController();
  TextEditingController senderState = TextEditingController();
  TextEditingController senderPincode = TextEditingController();

  TextEditingController receiverName = TextEditingController();
  TextEditingController receiverPhone = TextEditingController();
  TextEditingController receiverAddress = TextEditingController();
  TextEditingController receiverCity = TextEditingController();
  TextEditingController receiverState = TextEditingController();
  TextEditingController receiverPincode = TextEditingController();

  final PackageData packageData = PackageData();

  

  User? currentUser;

  @override
  void initState() {
    super.initState();
    currentUser = FirebaseAuth.instance.currentUser;
    print(currentUser);
  }

  Future<void> saveOrder(PackageData packageData) async {
    if (currentUser == null) {
      // Handle the case where the user is not logged in
      return;
    }

    final senderId = currentUser!.uid;
    final ordersCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(senderId)
        .collection('orders');

    await ordersCollection.add({
      "userid": senderId,
      'Sender Name': packageData.senderName,
      'Sender Phone': packageData.senderPhone,
      'Sender Address': packageData.senderAddress,
      'Sender City': packageData.senderCity,
      'Sender State': packageData.senderState,
      'Sender Pincode': packageData.senderPincode,
      'Receiver Name': packageData.receiverName,
      'Receiver Phone': packageData.receiverPhone,
      'Receiver Address': packageData.receiverAddress,
      'Receiver City': packageData.receiverCity,
      'Receiver State': packageData.receiverState,
      'Receiver Pincode': packageData.receiverPincode,
      'Status': 'Active',
      'Time Stamp': FieldValue.serverTimestamp(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: DefaultTabController(
            length: 2,
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60),

                    //tabs
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: TabBar(
                            unselectedLabelColor: Colors.black,
                            labelColor: Colors.purple[200],
                            indicatorColor: Colors.white,
                            indicatorWeight: 2,
                            indicator: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            // controller: tabController,
                            tabs: [
                              Tab(
                                text: 'Senders Info',
                              ),
                              Tab(
                                text: 'Recievers Info',
                              ),
                            ]),
                      ),
                    ),

                    SizedBox(height: 32),

                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: TabBarView(children: [
                        SenderInfoTab(
                          nameController: senderName,
                          phoneController: senderPhone,
                          addressController: senderAddress,
                          cityController: senderCity,
                          stateController: senderState,
                          pincodeController: senderPincode,
                          packageData: packageData,
                        ),
                        TravelerInfoTab(
                          nameController: receiverName,
                          phoneController: receiverPhone,
                          addressController: receiverAddress,
                          cityController: receiverCity,
                          stateController: receiverState,
                          pincodeController: receiverPincode,
                          packageData: packageData,
                        ),
                      ]),
                    ),

                    SizedBox(height: 16),

                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          final packageInfoWidget = PackageInfo(
                            senderName: packageData.senderName,
                            senderPhone: packageData.senderPhone,
                            senderAddress: packageData.senderAddress,
                            senderCity: packageData.senderCity,
                            senderState: packageData.senderState,
                            senderPincode: packageData.senderPincode,
                            receiverName: packageData.receiverName,
                            receiverPhone: packageData.receiverPhone,
                            receiverAddress: packageData.receiverAddress,
                            receiverCity: packageData.receiverCity,
                            receiverState: packageData.receiverState,
                            receiverPincode: packageData.receiverPincode,
                          );

                          //  await saveOrder(packageData
                          //   // packageData.senderName,
                          //   // packageData.senderPhone,
                          //   // packageData.senderAddress,
                          //   // packageData.senderCity,
                          //   // packageData.senderState,
                          //   // packageData.senderPincode,
                          //   // packageData.receiverName,
                          //   // packageData.receiverPhone,
                          //   // packageData.receiverAddress,
                          //   // packageData.receiverCity,
                          //   // packageData.receiverState,
                          //   // packageData.receiverPincode
                          //  );

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => packageInfoWidget),
                          );
                          // Handle button press here
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple[200],
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          "Enter Package Details",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),

                    // Wrap TabBarView in a ListView with AlwaysScrollableScrollPhysics
                    // Expanded(
                    //   child: ListView(
                    //     physics: AlwaysScrollableScrollPhysics(),
                    //     children: [
                    //       Container(
                    //         height: MediaQuery.of(context).size.height,
                    //         child: TabBarView(
                    //           children: [
                    //             SenderInfoTab(),
                    //             TravelerInfoTab(),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    // Wrap TabBarView in a Flexible widget
                    // Flexible(
                    //   child: Container(
                    //     height: MediaQuery.of(context).size.height,
                    //     child: TabBarView(
                    //       children: [
                    //         SenderInfoTab(),
                    //         TravelerInfoTab(),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

class SenderInfoTab extends StatefulWidget {
  
  final TextEditingController nameController ;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final TextEditingController cityController;
  final TextEditingController stateController;
  final TextEditingController pincodeController;
  final PackageData packageData;

  const SenderInfoTab({
    Key? key,
    required this.nameController,
    required this.phoneController,
    required this.addressController,
    required this.cityController,
    required this.stateController,
    required this.pincodeController,
    required this.packageData,
  }) : super(key: key);

  @override
  State<SenderInfoTab> createState() => _SenderInfoTabState();
}

class _SenderInfoTabState extends State<SenderInfoTab> {
  final _formKey = GlobalKey<FormState>();

  final currentUser = FirebaseAuth.instance.currentUser;

  

  Future<void> fetchUserData() async {
  if (currentUser == null) {
    return;
  }

  final senderId = currentUser!.uid;
  final userDoc = await FirebaseFirestore.instance.collection('users').doc(senderId).get();

  if (userDoc.exists) {
    final userData = userDoc.data() as Map<String, dynamic>;

    setState(() {
      // Set the initial values for the sender's info fields
      widget.nameController.text = userData['name'] ?? '';
      widget.phoneController.text = userData['phone'] ?? '';
      // widget.addressController.text = userData['address'] ?? '';
      // widget.cityController.text = userData['city'] ?? '';
      // widget.stateController.text = userData['state'] ?? '';
      // widget.pincodeController.text = userData['pincode'] ?? '';
      // Set other sender's info fields as needed
    });
    widget.packageData.senderName = widget.nameController.text;
    widget.packageData.senderPhone = widget.phoneController.text;
    // print(widget.nameController.text);
  }
}

@override
void initState() {
  super.initState();
  fetchUserData(); // Call the fetchUserData method here

}


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // Ensure minimum height
            children: [
              buildTextField(
                'Name',
                Icons.person,
                
                widget.nameController.text,
                widget.nameController,
                
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Name is required';
                //   }
                //   return null;
                // },
              ),
              SizedBox(height: 16),
              buildTextField(
                'Phone Number',
                Icons.phone,
                widget.phoneController.text,
                widget.phoneController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone Number is required';
                  }
                  if (int.tryParse(value) == null || value.length != 10) {
                    return 'Enter a Valid Number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              buildTextField(
                'Address',
                Icons.pin,
                'Enter Building Number/Block/Landmark',
                widget.addressController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Location is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              buildTextField(
                'City',
                Icons.location_city_outlined,
                'Enter Senders City Name',
                widget.cityController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'City is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              buildTextField(
                'State',
                Icons.location_on,
                'Enter Senders State',
                widget.stateController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'State is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              buildTextField(
                'Pin Code',
                Icons.location_city_outlined,
                'Enter Senders Pin Code',
                widget.pincodeController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'PinCode is required';
                  }
                  if (int.tryParse(value) == null || value.length != 6) {
                    return 'Invalid PinCode';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              // ElevatedButton(
              //   onPressed: () {
              //     if (_formKey.currentState!.validate()) {
              //       // Perform registration logic
              //       // Navigator.push(
              //       //   context,
              //       //   MaterialPageRoute(
              //       //       builder: (context) => LoginScreen()),
              //       // );
              //     }
              //   },
              //   child: Text(
              //     'Enter Package Details',
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 18,
              //     ),
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     primary: Color(0xFFA084E8), // Button color
              //     onPrimary: Colors.black, // Text color
              //     padding: EdgeInsets.all(20),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(30.0),
              //     ),
              //     elevation: 5,
              //     minimumSize: Size(double.infinity, 0), // Full width
              //   ),
              // ),
            ]),
      ),
    );
  }

  Widget buildTextField(String label, IconData icon, String hint,
      TextEditingController controller,
      {bool isPassword = false,
      TextInputType? keyboardType,
      FormFieldValidator<String>? validator}) {

         bool isEnabled = true;

  // Check if the label is "Name" or "Phone Number" and disable those fields
  if (label == 'Name' || label == 'Phone Number') {
    isEnabled = false;
  }

  // // Set the controller's text value based on the label
  // if (label == 'Name') {
  //   controller.text = widget.packageData.senderName;
  // } else if (label == 'Phone Number') {
  //   controller.text = widget.packageData.senderPhone;
  // }

  //    // Create an onChanged handler only for the "Name" and "Phone Number" fields
  //   void onChanged(String value) {
  //     if (label == 'Name') {
  //       widget.packageData.senderName = value;
  //     } else if (label == 'Phone Number') {
  //       widget.packageData.senderPhone = value;
  //     }
  //   }





    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          enabled: isEnabled,
          obscureText: isPassword,
          keyboardType: keyboardType,
          validator: validator,
          onChanged: (value) {
            // Update the corresponding field in packageData
            if (label == 'Name') {
              widget.packageData.senderName = widget.nameController.text;
            } else if (label == 'Phone Number') {
              widget.packageData.senderPhone = value;
            } else if (label == 'Address') {
              widget.packageData.senderAddress = value;
            } else if (label == 'City') {
              widget.packageData.senderCity = value;
            } else if (label == 'State') {
              widget.packageData.senderState = value;
            } else if (label == 'Pin Code') {
              widget.packageData.senderPincode = value;
            }
          }, // Validator function
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Color(0xFFA084E8)),
            hintText: hint,
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 203, 195, 195)),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFA084E8)),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ],
    );
  }
}

class TravelerInfoTab extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final TextEditingController cityController;
  final TextEditingController stateController;
  final TextEditingController pincodeController;
  final PackageData packageData;

  const TravelerInfoTab({
    Key? key,
    required this.nameController,
    required this.phoneController,
    required this.addressController,
    required this.cityController,
    required this.stateController,
    required this.pincodeController,
    required this.packageData,
  }) : super(key: key);

  @override
  State<TravelerInfoTab> createState() => _TravelerInfoTabState();
}

class _TravelerInfoTabState extends State<TravelerInfoTab> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min, // Ensure minimum height
            children: [
              buildTextField(
                'Name',
                Icons.person,
                'Enter Receivers Name',
                widget.nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              buildTextField(
                'Phone Number',
                Icons.phone,
                'Enter Receivers number',
                widget.phoneController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone Number is required';
                  }
                  if (int.tryParse(value) == null || value.length != 10) {
                    return 'Enter a Valid Number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              buildTextField(
                'Address',
                Icons.pin,
                'Enter Building Number/Block/Landmark',
                widget.addressController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Location is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              buildTextField(
                'City',
                Icons.location_city_outlined,
                'Enter Receivers City Name',
                widget.cityController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'City is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              buildTextField(
                'State',
                Icons.location_city_outlined,
                'Enter Receivers State',
                widget.stateController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'State is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              buildTextField(
                'Pin Code',
                Icons.location_city_outlined,
                'Enter Receivers Pin Code',
                widget.pincodeController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'PinCode is required';
                  }
                  if (int.tryParse(value) == null || value.length != 6) {
                    return 'Invalid PinCode';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              // Text(
              //   'Enter the Recievers Available Time',
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // SizedBox(height: 10),
              // Row(children: [
              //   Container(
              //     width: 100,
              //     child: buildTextField(
              //       'From',
              //       Icons.alarm,
              //       '08:00',
              //       validator: (value) {
              //         if (int.parse(value!) > 24 || int.parse(value!) < 0) {
              //           return 'Enter Correct Time';
              //         }
              //         return null;
              //       },
              //     ),
              //   ),
              //   SizedBox(width: 10),
              //   Text(':'),
              //   SizedBox(width: 10),
              //   Container(
              //     width: 100,
              //     child: buildTextField(
              //       'To',
              //       Icons.alarm,
              //       '13:00',
              //       validator: (value) {
              //         if (int.parse(value!) > 24 || int.parse(value) < 0) {
              //           return 'Enter correct time';
              //         }
              //         return null;
              //       },
              //     ),
              //   ),
              // ]),
              SizedBox(height: 16),
              // ElevatedButton(
              //   onPressed: () {

              //     if (_formKey.currentState!.validate()) {

              //       // Perform registration logic
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => PackageInfo()),
              //       );
              //     }
              //   },
              //   child: Text(
              //     'Enter Package Details',
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 18,
              //     ),
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     primary: Color(0xFFA084E8), // Button color
              //     onPrimary: Colors.black, // Text color
              //     padding: EdgeInsets.all(20),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(30.0),
              //     ),
              //     elevation: 5,
              //     minimumSize: Size(double.infinity, 0), // Full width
              //   ),
              // ),
            ]),
      ),
    );
  }

  Widget buildTextField(String label, IconData icon, String hint,
      TextEditingController controller,
      {bool isPassword = false,
      TextInputType? keyboardType,
      FormFieldValidator<String>? validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          obscureText: isPassword,
          keyboardType: keyboardType,
          validator: validator,
          onChanged: (value) {
            // Update the corresponding field in packageData
            if (label == 'Name') {
              widget.packageData.receiverName = value;
            } else if (label == 'Phone Number') {
              widget.packageData.receiverPhone = value;
            } else if (label == 'Address') {
              widget.packageData.receiverAddress = value;
            } else if (label == 'City') {
              widget.packageData.receiverCity = value;
            } else if (label == 'State') {
              widget.packageData.receiverState = value;
            } else if (label == 'Pin Code') {
              widget.packageData.receiverPincode = value;
            }
          }, // Validator function
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Color(0xFFA084E8)),
            hintText: hint,
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 203, 195, 195)),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFA084E8)),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ],
    );
  }
}
// .