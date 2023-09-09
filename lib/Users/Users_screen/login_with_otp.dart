import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliveryx/Users/Users_screen/home_screens.dart';
import 'package:deliveryx/Users/Users_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Onboarding.dart';
import 'registration.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'SignInWithGoogle.dart';

class LoginScreenOTP extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenOTP> {
  final _formKey = GlobalKey<FormState>();
  String selectedCountryCode = '+91';
  bool _showPhoneNumberInput = true;

  void _toggleView() {
    setState(() {
      _showPhoneNumberInput = !_showPhoneNumberInput;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 25),
                Container(
                  alignment: Alignment.topLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color.fromARGB(255, 203, 195, 195),
                        width: 1,
                      ),
                    ),
                    child: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.arrowLeft,
                        color: Colors.black,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      iconSize: 30,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  'Cheaper and faster delivery',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Get great experience with DeliveryX :)',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 35),
                // buildTextField('Email', Icons.email, 'Enter your email',
                //     validator: (value) {
                //   if (value!.isEmpty) {
                //     return 'Please enter your email';
                //   }
                //   if (!RegExp(
                //           //r"^(?!.*(\.{1,}|[-!#$%&\'*+/=?^_`{|~]))[a-zA-Z0-9.!#$%&\'*+\/=?^_`{|~-]{1,64}@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                //           r"^([a-zA-Z0-9\._]+)@([a-zA-Z0-9])+.([a-z]+)(.[a-z]+)?$")
                //       .hasMatch(value)) {
                //     return 'Please enter a valid email';
                //   }
                //   return null;
                // }),
                // SizedBox(height: 16),
                // buildTextField(
                //   'Password',
                //   Icons.lock,
                //   'Enter your password',
                //   isPassword: true,
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter your password';
                //     }
                //     return null;
                //   },
                // ),

                if (_showPhoneNumberInput)
                  PhoneNumberInputSection(
                    toggleView: _toggleView,
                  )
                else
                  OTPInputSection(
                    toggleView: _toggleView,
                  ),

                SizedBox(height: 32),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to the registration page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()),
                      );
                    },
                    child: Center(
                      child: Text(
                        'New user? Register here',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: Text('Or'),
                ),
                SizedBox(height: 16),
                Center(
                  child: Column(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          // Perform sign up with Google logic
                              Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.black,
                          size: 15,
                        ),
                        label: Text(
                          'Login with Email',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.all(20),
                          side: BorderSide(
                            width: 2,
                            color: Color(0xFFA084E8),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          elevation: 5,
                          minimumSize: Size(double.infinity, 0), // Full width
                        ),
                      ),
                      SizedBox(height: 8),
                      // ElevatedButton.icon(
                      //   onPressed: () {
                      //     // Perform sign up with apple logic
                      //   },
                      //   icon: Icon(Icons.apple_outlined, color: Colors.black),
                      //   label: Text(
                      //     'Sign in with Apple',
                      //     style: TextStyle(
                      //       color: Colors.black,
                      //       fontSize: 18,
                      //     ),
                      //   ),
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Colors.white,
                      //     padding: EdgeInsets.all(20),
                      //     side: BorderSide(
                      //       width: 2,
                      //       color: Color(0xFFA084E8),
                      //     ),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(30.0),
                      //     ),
                      //     elevation: 5,
                      //     minimumSize: Size(double.infinity, 0), // Full width
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PhoneNumberInputSection extends StatefulWidget {
  final void Function() toggleView;

  PhoneNumberInputSection({required this.toggleView});

  @override
  _PhoneNumberInputSectionState createState() =>
      _PhoneNumberInputSectionState();
}

class _PhoneNumberInputSectionState extends State<PhoneNumberInputSection> {
  TextEditingController _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String selectedCountryCode = '+91';
  // TextEditingController _otpController = TextEditingController();

  // late String _verificationId = "";
  // FirebaseAuth _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;
  static late String verificationId;
  static late PhoneAuthCredential credential;
  Future<void> dataindb(String phone) async {
    final snapshot =
        await _db.collection("users").where("phone", isEqualTo: phone).get();
    if (snapshot.size == 0) {
      Fluttertoast.showToast(
          msg: "Please Enter registered phone no.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      //  Navigator.push(
      //       context, MaterialPageRoute(builder: (c) => RegisterScreen()));
    } else {
      sendOTP();
      widget.toggleView();
    }
  }

  // Future<void> _verifyPhoneNumber() async {
  //   String phoneNumber = _phoneNumberController.text;
  //   String first = phoneNumber.substring(0, 4);
  //   String second = phoneNumber.substring(4, 7);
  //   String third = phoneNumber.substring(7, 10);

  //   await _auth.verifyPhoneNumber(
  //     phoneNumber: '$selectedCountryCode $first $second $third',
  //        verificationCompleted: (credential) async {
  //       await _auth.signInWithCredential(credential);
  //       print('Verification completed automatically');
  //     },
  //     verificationFailed: (authException) {
  //       print('Verification failed: ${authException.message}');
  //     },
  //     codeSent: (verificationId, resendToken) {
  //       setState(() {
  //         _verificationId = verificationId;
  //       });
  //       print('Code sent');
  //     },
  //     codeAutoRetrievalTimeout: (verificationId) {
  //       setState(() {
  //         _verificationId = verificationId;
  //       });
  //       print('Auto retrieval timeout');
  //     },
  //     timeout: Duration(seconds: 60),
  //   );
  // }

  // Future<void> _signInWithPhoneNumber(String smsCode) async {

  //   try {
  //       print("$smsCode , $_verificationId");
  //     AuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: _verificationId,
  //       smsCode: smsCode,
  //     );
  //     await _auth.signInWithCredential(credential);
  //     print('Successfully signed in');
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  // void callotp(String otp) {
  //   _signInWithPhoneNumber(otp);
  // }

  Future<void> sendOTP() async {
    try {
      String phoneNumber = _phoneNumberController.text;
      String first = phoneNumber.substring(0, 4);
      String second = phoneNumber.substring(4, 7);
      String third = phoneNumber.substring(7, 10);
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "$selectedCountryCode $first $second $third",
        verificationCompleted: (credential) {
          _PhoneNumberInputSectionState.credential = credential;
          setState(() {});
        },
        verificationFailed: (error) {
          print(error);
        },
        codeSent: (verificationId, forceResendingToken) {
          _PhoneNumberInputSectionState.verificationId = verificationId;
          setState(() {});
        },
        codeAutoRetrievalTimeout: (verificationId) {
          _PhoneNumberInputSectionState.verificationId = verificationId;
          setState(() {});
          // print('Auto retrieval timeout');
        },
        timeout: Duration(seconds: 30),
      );
    } catch (e) {
      print(e);
    }
  }

  // Future<void> verifyOTP() async {
  //   try {
  //     await FirebaseAuth.instance.signInWithCredential(credential);
  //       Fluttertoast.showToast(
  //         msg: "Logged In Successfully",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.CENTER,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Color.fromARGB(255, 125, 113, 241),
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //      Navigator.push(
  //           context, MaterialPageRoute(builder: (c) => HomeScreen()));
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone Number ',
          style: TextStyle(
            // fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Color.fromARGB(255, 203, 195, 195),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedCountryCode,
                    onChanged: (newValue) {
                      setState(() {
                        selectedCountryCode = newValue!;
                      });
                    },
                    items: <String>['+91', '+1', '+44', '+81']
                        .map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ),
            SizedBox(width: 5),
            Expanded(
                child: TextFormField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your phone number';
                }
                if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                  return 'Please enter 10 digits';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Enter your registered phone number',
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 203, 195, 195)),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFA084E8)),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            )),
          ],
        ),
        // SizedBox(height: 32),
        // buildTextField('OTP', Icons.lock, 'Enter the OTP received'),
        // SizedBox(height: 20),
        // TextField(
        //   controller: _otpController,
        //   keyboardType: TextInputType.number, // Corrected input type
        //   decoration: InputDecoration(
        //     hintText: "Enter Otp", // Changed hint text
        //     prefixIcon: Icon(Icons.lock),
        //     contentPadding: EdgeInsets.symmetric(horizontal: 20),
        //     border: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(30),
        //     ),
        //   ),
        //   onChanged: (value) {
        //     credential = PhoneAuthProvider.credential(
        //       verificationId: verificationId,
        //       smsCode: value,
        //     );
        //   },
        // ),
        SizedBox(height: 32),
        ElevatedButton(
          onPressed: () {
            dataindb(_phoneNumberController.text.trim());
            //   widget.toggleView();
          },
          child: Text(
            'Send OTP',
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
        // SizedBox(height: 32),
        // ElevatedButton(
        //   onPressed: () {
        //     // dataindb(_phoneNumberController.text.trim());
        //     // verifyOTP();
        //     //   widget.toggleView();
        //   },
        //   child: Text(
        //     'Sign In',
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontSize: 18,
        //     ),
        //   ),
          // style: ElevatedButton.styleFrom(
          //   primary: Color(0xFFA084E8), // Button color
          //   onPrimary: Colors.black, // Text color
          //   padding: EdgeInsets.all(20),
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(30.0),
          //   ),
          //   minimumSize: Size(double.infinity, 0), // Full width
          // ),
        
      ],
    );
  }

//   Widget buildTextField(String label, IconData icon, String hint,
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
//             // addListener: (value) {
//             //   credential = PhoneAuthProvider.credential(
//             //     verificationId: verificationId,
//             //     smsCode: value,
//             //   );
//             // },
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Color(0xFFA084E8)),
//               borderRadius: BorderRadius.circular(15),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
}

class OTPInputSection extends StatefulWidget {
  final void Function() toggleView;

  OTPInputSection({required this.toggleView});

  @override
  _OTPInputSectionState createState() => _OTPInputSectionState();
}

class _OTPInputSectionState extends State<OTPInputSection> {
  TextEditingController _otpController = TextEditingController();
  // void _loginotp() async {
  //   try {
  //     AuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: _PhoneNumberInputSectionState()._verificationId,
  //       smsCode: _otpController.text.trim(),
  //     );
  //     await auth.signInWithCredential(credential);
  //     print("OTP Sign-in successful");
  //   } catch (e) {
  //     print("Error signing in with OTP: $e");
  //   }
  // }

  Future<void> verifyOTP() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInWithCredential(_PhoneNumberInputSectionState.credential);
      print(_PhoneNumberInputSectionState);
      
    final user = userCredential.user;
      if(user!=null){

        

        Fluttertoast.showToast(
          msg: "Logged In Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 125, 113, 241),
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(context, MaterialPageRoute(builder: (c) => Onboarding()));
      }
      else{
        Fluttertoast.showToast(
          msg: "Log In Fail",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 125, 113, 241),
          textColor: Colors.white,
          fontSize: 16.0);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // buildTextField('OTP', Icons.lock, 'Enter the OTP received'),
          SizedBox(height: 20),
        TextField(
          controller: _otpController,
          keyboardType: TextInputType.number, // Corrected input type
          decoration: InputDecoration(
            hintText: "Enter Otp", // Changed hint text
            prefixIcon: Icon(Icons.lock),
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onChanged: (value) {
            _PhoneNumberInputSectionState.credential = PhoneAuthProvider.credential(
              verificationId: _PhoneNumberInputSectionState.verificationId,
              smsCode: value,
            );
          },
        ),
        SizedBox(height: 32),
        ElevatedButton(
          onPressed: () {

            verifyOTP();
          },
          child: Text(
            'Sign In',
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
        SizedBox(
          height: 16,
        ),
        ElevatedButton(
          onPressed: () {
            widget.toggleView();
          },
          child: Text(
            'Back',
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
      ],
    );
  }

  // Widget buildTextField(String label, IconData icon, String hint,
  //     {bool isPassword = false,
  //     TextInputType? keyboardType,
  //     FormFieldValidator<String>? validator}) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         label,
  //         style: TextStyle(
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //       SizedBox(height: 8),
  //       TextFormField(
  //         obscureText: isPassword,
  //         keyboardType: keyboardType,
  //         validator: validator, // Validator function
  //         decoration: InputDecoration(
  //           prefixIcon: Icon(icon, color: Color(0xFFA084E8)),
  //           hintText: hint,
  //           border: OutlineInputBorder(),
  //           enabledBorder: OutlineInputBorder(
  //             borderSide: BorderSide(color: Color.fromARGB(255, 203, 195, 195)),
  //             borderRadius: BorderRadius.circular(8),
  //           ),
         
  //           focusedBorder: OutlineInputBorder(
  //             borderSide: BorderSide(color: Color(0xFFA084E8)),
  //             borderRadius: BorderRadius.circular(15),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
