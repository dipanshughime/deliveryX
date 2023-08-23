import 'package:flutter/material.dart';

class SenderLocationInfo extends StatelessWidget {
  const SenderLocationInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 200,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(children: [
          Icon(Icons.pin_drop_outlined, color: Colors.black),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Location',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              Text(
                'Mumbai Maharashtra',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
