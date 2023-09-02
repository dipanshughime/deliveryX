import 'package:deliveryx/Users/Users_screen/Sender/order_details.dart';
import 'package:deliveryx/Users/Users_screen/Sender/order_summary.dart';
import 'package:flutter/material.dart';

class Homepage_Sender extends StatefulWidget {
  const Homepage_Sender({super.key});

  @override
  State<Homepage_Sender> createState() => _Homepage_SenderState();
}

class _Homepage_SenderState extends State<Homepage_Sender> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // grey container on top
            Container(
              width: double.infinity,
              height: 170,
              decoration: BoxDecoration(color: Color(0xff1d272f)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Your location",
                                    style: TextStyle(
                                      fontSize: 15,
                                      // fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                    )),
                                Text("Mumbai, India",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          ],
                        ),
                        Image(
                          image: AssetImage("assets/images/user.png"),
                          width: 50,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            //recent packages text
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Recent packages sent",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
            ),

            //listview
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Container(
                height: 350,
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return SingleChildScrollView(
                      child: Card(
                        child: GestureDetector(
                          onTap: () {

                            Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderClick()),
                          );
                            // Add your onPressed or onTap logic here
                            //navigate wala code
                          },
                          child: ListTile(
                            leading: Image.asset(
                              'assets/images/package.png',
                              width: 40,
                              height: 40,
                            ),
                            title: Text('dftyeusajkj'),
                            subtitle: Text('12th oct 2023'),
                            trailing: Text('Delivered'),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            //button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderDetails()),
                          );
                },
                child: Text(
                  'Send Package',
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

      //BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
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