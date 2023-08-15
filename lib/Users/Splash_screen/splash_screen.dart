import 'package:deliveryx/pallete.dart';
import 'package:deliveryx/Users/Users_screen/registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animate_do/animate_do.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => RegisterScreen()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Pallete.splash1, Pallete.splash2],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlideInDown(
            duration: Duration(seconds: 2),
            child: Image.asset(
              'assets/images/delivery-girl.png',
              height: 150,
              width: 160,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          // Text(
          //   'DeliveryX',
          //   style: TextStyle(fontSize: 35),
          // ),
          SlideInLeft(
            duration: Duration(seconds: 2),
            child: Image.asset(
              'assets/images/DELIVERYX.png',
            ),
          ),
        ],
      ),
    ));
  }
}
