import 'package:deliveryx/Users/Users_screen/Sender/homepage.dart';
import 'package:deliveryx/Users/Users_screen/Sender/order_summary.dart';
import 'package:flutter/material.dart';
import '/util/colors.dart';

class PackageInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PackageFormState();
  }
}

class PackageFormState extends State<PackageInfo> {
  bool isInput1Visible = false;
  bool isInput2Visible = false;
  bool isChecked = false;
  var _dropdownValue1;
  var _dropdownValue2;
  var _dropdownValue3;

  var temp = 1;
  var temp2 = 0;
  TextEditingController _textEditingController = TextEditingController();
  void showAlert() {
    if (_textEditingController.text.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Package Value is 0'),
            content: const Text(
                "We won't be able to provide any insurance for your package"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  temp2--;
                  showModalBottomSheet(
                    elevation: 0,
                    isDismissible: false,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    context: context,
                    builder: (context) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.check_circle, // Green tick icon
                                color: Colors.green,
                                size: 60.0,
                              ),
                              SizedBox(height: 20),
                              const ListTile(
                                title: Align(
                                  alignment: Alignment
                                      .center, // Align title to the center
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 8.0),
                                    child: Text('Order Successful!',
                                        textAlign: TextAlign.center),
                                  ),
                                ),
                                subtitle: Text(
                                  'Your order request is successfully added. We will notify you when our traveler picks up your order.',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 20),
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Homepage_Sender()),
                                      );
                                      // Your first button action
                                    },
                                    child: Text(
                                      'Go to HomePage',
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all(20),
                                        backgroundColor: AppColors.primary,
                                        minimumSize: Size(double.infinity, 0),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                  ),
                                  SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => OrderClick()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all(20),
                                        backgroundColor: AppColors.white,
                                        minimumSize: Size(double.infinity, 0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          side: BorderSide(
                                              color: AppColors.primary,
                                              width: 2),
                                        )),
                                    child: Text(
                                      'View Order Summary',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  // Initial visibility state

  void toggleVisibility() {
    setState(() {
      isInput1Visible = !isInput1Visible; // Toggle visibility
    });
  }

  void toggleImage() {
    setState(() {
      isInput2Visible = !isInput2Visible; // Toggle visibility
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: const Text("Package Details")),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Value of Package",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        hintText: 'Enter value in INR',
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primary),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFA084E8)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the value';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Category",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      items: const [
                        DropdownMenuItem(
                          value: "Electronics",
                          child: Text("Electronics"),
                        ),
                        DropdownMenuItem(
                          value: "Food",
                          child: Text("Food"),
                        ),
                        DropdownMenuItem(
                          value: "Fabric",
                          child: Text("Fabric"),
                        ),
                        DropdownMenuItem(
                          value: "Document",
                          child: Text("Document"),
                        ),
                        DropdownMenuItem(
                          value: "Jewelery",
                          child: Text("Jewelery"),
                        ),
                        DropdownMenuItem(
                          value: "Other",
                          child: Text("Other"),
                        ),
                      ],
                      value: _dropdownValue1,
                      onChanged: (String? selectedValue1) {
                        if (selectedValue1 is String) {
                          setState(() {
                            _dropdownValue1 = selectedValue1;
                            if (selectedValue1 == "Other") {
                              toggleVisibility();
                              temp = 0;
                            } else if (selectedValue1 != "Other" && temp == 0) {
                              toggleVisibility();
                              temp++;
                            }
                            // Size size = MediaQuery.sizeOf();
                          });
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a category';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Select a category',
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primary),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFA084E8)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Visibility(
                      visible: isInput1Visible,
                      child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please describe your parcel';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Describe your Package',
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.primary),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFA084E8)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          )),
                    ),
                    SizedBox(height: 15),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Weight",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                        items: const [
                          DropdownMenuItem(
                            value: "Upto 1 kg",
                            child: Text("Upto 1 kg"),
                          ),
                          DropdownMenuItem(
                            value: "Upto 3 kg",
                            child: Text("Upto 3 kg"),
                          ),
                          DropdownMenuItem(
                            value: "Upto 5 kg",
                            child: Text("Upto 5 kg"),
                          ),
                        ],
                        value: _dropdownValue2,
                        onChanged: (String? selectedValue2) {
                          if (selectedValue2 is String) {
                            setState(() {
                              _dropdownValue2 = selectedValue2;
                            });
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a weight category';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Select a category',
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.primary),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFA084E8)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        )),
                    const SizedBox(height: 15),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Size",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                        items: const [
                          DropdownMenuItem(
                            value: "Small",
                            child: Text("Small"),
                          ),
                          DropdownMenuItem(
                            value: "Medium",
                            child: Text("Medium"),
                          ),
                          DropdownMenuItem(
                            value: "Large",
                            child: Text("Large"),
                          ),
                          DropdownMenuItem(
                            value: "Xtra Large",
                            child: Text("Xtra Large"),
                          ),
                        ],
                        value: _dropdownValue3,
                        onChanged: (String? selectedValue3) {
                          if (selectedValue3 is String) {
                            setState(() {
                              _dropdownValue3 = selectedValue3;
                            });
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a size category';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Select a category',
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.primary),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFA084E8)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        )),
                    const SizedBox(height: 15),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        setState(() {
                          toggleImage();
                        });
                      },
                      child: const Text(
                        'Size Guide',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Visibility(
                      visible: isInput2Visible,
                      child: Image.asset('assets/images/sizeguide.jpg'),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (bool? newValue) {
                              setState(() {
                                isChecked = newValue!;
                              });
                            },
                            activeColor: AppColors.primary,
                          ),
                          Text('I accept the terms and conditions')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                    onPressed: isChecked
                        ? () {
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              if (_textEditingController.text == '0') {
                                showAlert();
                                temp2++;
                              }
                              if (temp2 == 0) {
                                showModalBottomSheet(
                                  elevation: 0,
                                  isDismissible: false,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  context: context,
                                  builder: (context) {
                                    return Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons
                                                  .check_circle, // Green tick icon
                                              color: Colors.green,
                                              size: 60.0,
                                            ),
                                            SizedBox(height: 20),
                                            const ListTile(
                                              title: Align(
                                                alignment: Alignment
                                                    .center, // Align title to the center
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 8.0),
                                                  child: Text(
                                                      'Order Successful!',
                                                      textAlign:
                                                          TextAlign.center),
                                                ),
                                              ),
                                              subtitle: Text(
                                                'Your order request is successfully added. We will notify you when our traveler picks up your order.',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            Column(
                                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Homepage_Sender()),
                                                    );
                                                  },
                                                  child: Text(
                                                    'Go to HomePage',
                                                  ),
                                                  style: ElevatedButton.styleFrom(
                                                      padding:
                                                          EdgeInsets.all(20),
                                                      backgroundColor:
                                                          AppColors.primary,
                                                      minimumSize: Size(
                                                          double.infinity, 0),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20))),
                                                ),
                                                SizedBox(height: 20),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              OrderClick()),
                                                    );
                                                    // Your second button action
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  20),
                                                          backgroundColor:
                                                              AppColors.white,
                                                          minimumSize: Size(
                                                              double.infinity,
                                                              0),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            side: BorderSide(
                                                                color: AppColors
                                                                    .primary,
                                                                width: 2),
                                                          )),
                                                  child: Text(
                                                    'View Order Summary',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            }
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        backgroundColor: AppColors.primary,
                        minimumSize: Size(double.infinity, 0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text("Place Order")),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      // ),
    );
  }
}
