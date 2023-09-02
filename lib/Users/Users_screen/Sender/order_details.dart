import 'package:deliveryx/Users/Users_screen/Sender/package_info.dart';
import 'package:flutter/material.dart';

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
                            labelColor: Colors.purple,
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
                        SenderInfoTab(),
                        TravelerInfoTab(),
                      ]),
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
  const SenderInfoTab({super.key});

  @override
  State<SenderInfoTab> createState() => _SenderInfoTabState();
}

class _SenderInfoTabState extends State<SenderInfoTab> {
  final _formKey = GlobalKey<FormState>();
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
                'Enter Senders Name',
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
                'Enter Senders number',
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
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform registration logic
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => LoginScreen()),
                    // );
                  }
                },
                child: Text(
                  'Enter Package Details',
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
                  elevation: 5,
                  minimumSize: Size(double.infinity, 0), // Full width
                ),
              ),
            ]),
      ),
    );
  }

  Widget buildTextField(String label, IconData icon, String hint,
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
          validator: validator, // Validator function
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
  const TravelerInfoTab({super.key});

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
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform registration logic
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PackageInfo()),
                    );
                  }
                },
                child: Text(
                  'Enter Package Details',
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
                  elevation: 5,
                  minimumSize: Size(double.infinity, 0), // Full width
                ),
              ),
            ]),
      ),
    );
  }

  Widget buildTextField(String label, IconData icon, String hint,
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
          validator: validator, // Validator function
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