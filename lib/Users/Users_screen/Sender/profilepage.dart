import 'package:flutter/material.dart';

// void main() => runApp(const Profilepage_Sender());

class Profilepage_Sender extends StatefulWidget {
  const Profilepage_Sender({super.key});

  @override
  State<Profilepage_Sender> createState() => _Profilepage_SenderState();
}

class _Profilepage_SenderState extends State<Profilepage_Sender> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/profile.png', // Replace with your image asset
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                        /*1*/
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /*2*/
                            Container(
                              padding: const EdgeInsets.only(bottom: 100),
                              child: const Text(
                                'My Profile',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Hello,Radhika",
                              style: TextStyle(
                                // fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "+91 9156349749",
                              style: TextStyle(
                                // fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      /*3*/
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Icon(
                          Icons.edit_square,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            // padding: EdgeInsets.only(
            //     bottom: 8, top: 8, left: 8), //apply padding to all four sides
            padding: EdgeInsets.all(16),
            child: Text(
              'Settings',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 8, vertical: 4), //apply padding to all four sides
            child: ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: Color.fromARGB(255, 203, 195, 195),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              leading: Icon(
                Icons.lock,
                color: Color(0xFFA084E8),
              ),
              title: Text(
                'Change Password',
                textAlign: TextAlign.left,
                style: TextStyle(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 8, vertical: 4), //apply padding to all four sides
            child: ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: Color.fromARGB(255, 203, 195, 195),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              leading: Icon(
                Icons.wallet,
                color: Color(0xFFA084E8),
              ),
              title: Text(
                'Wallet',
                textAlign: TextAlign.left,
                style: TextStyle(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 8, vertical: 4), //apply padding to all four sides
            child: ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 1, color: Color.fromARGB(193, 210, 210, 210)),
                borderRadius: BorderRadius.circular(10),
              ),
              leading: Icon(Icons.person,color: Color(0xFFA084E8),),
              title: Text('Switch Role'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16), //apply padding to all four sides
            child: Text(
              'About Us',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 8, vertical: 4),  //apply padding to all four sides
            child: ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 1, color: Color.fromARGB(193, 210, 210, 210)),
                borderRadius: BorderRadius.circular(10),
              ),
              leading: Icon(Icons.question_answer_outlined,color: Color(0xFFA084E8),),
              title: Text('FAQ'),
            ),
          ),
          Padding(
             padding: EdgeInsets.symmetric(
                horizontal: 8, vertical: 4), //apply padding to all four sides
            child: ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 1, color: Color.fromARGB(193, 210, 210, 210)),
                borderRadius: BorderRadius.circular(10),
              ),
              leading: Icon(Icons.security,color: Color(0xFFA084E8),),
              title: Text('Privacy Policy'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 8, vertical: 4),  //apply padding to all four sides
            child: ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 1, color: Color.fromARGB(193, 210, 210, 210)),
                borderRadius: BorderRadius.circular(10),
              ),
              leading: Icon(Icons.phone,color: Color(0xFFA084E8),),
              title: Text('Contact Us'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16), //apply padding to all four sides
            child: Text(
              'Other',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
          ),
          Padding(
             padding: EdgeInsets.symmetric(
                horizontal: 8, vertical: 4),  //apply padding to all four sides
            child: ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 1, color: Color.fromARGB(193, 210, 210, 210)),
                borderRadius: BorderRadius.circular(10),
              ),
              leading: Icon(Icons.mobile_friendly_rounded,color: Color(0xFFA084E8),),
              title: Text('Get the latest version'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: 8, top: 8, left: 8), //apply padding to all four sides
            child: ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 1, color: Color.fromARGB(193, 210, 210, 210)),
                borderRadius: BorderRadius.circular(10),
              ),
              leading: Icon(Icons.share,color: Color(0xFFA084E8),),
              title: Text('Share'),
            ),
          ),
        ],
      ),

      //BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        unselectedItemColor:
            Colors.black, // Set the unselected icon color to black
        selectedItemColor: Colors.purple,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on_outlined,
              color: Colors.grey,
            ),
            label: "Map",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message_outlined,
              color: Colors.grey,
            ),
            label: "Message",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
              color: Colors.grey,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
