import 'package:flutter/material.dart';

class HomePage_Sender extends StatefulWidget {
  const HomePage_Sender({super.key});

  @override
  State<HomePage_Sender> createState() => _HomePage_SenderState();
}

class _HomePage_SenderState extends State<HomePage_Sender> {
  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return const Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: Color(0xff1d272f),
          ),
          child: SizedBox(
            height : 300,
            child: Row(children: [
              Icon(Icons.pin_drop_outlined),
              Column(
                children: [
                  Text('Your Location',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color : Colors.white,
                      )),
                  Text(
                    'Mumbai Maharashtra',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color : Colors.white,
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ])),
    );
  }
}
