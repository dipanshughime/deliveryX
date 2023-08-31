import 'package:deliveryx/Users/Users_screen/home_screens.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'KYCScreen.dart';
// import 'KYCScreen.dart';

class Onboarding extends StatefulWidget {
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              SizedBox(height: 80),
              Container(
                child: CarouselSlider(
                  items: [
                    Container(
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/woman_gps.png',
                            height: size.height * 0.4,
                          ),
                          Text(
                            'Seamless Sending, Hassle-Free Delivery.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/bike_man.png',
                            height: size.height * 0.4,
                          ),
                          Text(
                            'Earn While You Journey, Deliver with Ease.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/connect_bgrm.png',
                            height: size.height * 0.4,
                          ),
                          Text(
                            'Connect, Deliver, Empower Together.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    height: size.height * 0.5,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.9,
                  ),
                ),
              ),
              Container(
                child: Text(
                  'Welcome to DeliveryX',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFA084E8),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Text(
                  'Choose to be a sender of the package or choose to deliver it on the go...',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF8297A8),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFA084E8),
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 5,
                  minimumSize: Size(double.infinity, 0), // Full width
                ),
                onPressed: () {},
                child: Text(
                  'Send a package',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Text(
                  'Deliver a package',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}