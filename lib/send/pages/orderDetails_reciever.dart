import 'package:flutter/material.dart';

import '../components/details_label.dart';

class OrderDetails_Reciever extends StatefulWidget {
  const OrderDetails_Reciever({super.key});

  @override
  State<OrderDetails_Reciever> createState() => _OrderDetails_RecieverState();
}

class _OrderDetails_RecieverState extends State<OrderDetails_Reciever> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DetailsLabel(label: 'Name'),
            DecoratedBox(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Material(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter Recievers Name',
                    prefixIcon: const Icon(Icons.person),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.black12)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
            ),
            DetailsLabel(label: 'Phone Number'),
            DecoratedBox(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Material(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Recievers Phone Number',
                    prefixIcon: const Icon(Icons.phone),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.black12)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
            ),
            const DetailsLabel(label: 'Block Number'),
            DecoratedBox(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Material(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Recievers Block Number',
                    prefixIcon: const Icon(Icons.pin),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.black12)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
            const DetailsLabel(label: 'Street Name'),
            DecoratedBox(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Material(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Recievers Street Name',
                    prefixIcon: const Icon(Icons.location_pin),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.black12)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
            const DetailsLabel(label: 'Landmark'),
            DecoratedBox(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Material(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Landmark',
                    prefixIcon: const Icon(Icons.location_pin),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.black12)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
            const DetailsLabel(label: 'City Name'),
            DecoratedBox(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Material(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter City',
                    prefixIcon: const Icon(Icons.location_city_outlined),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.black12)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
            const DetailsLabel(label: 'State'),
            DecoratedBox(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Material(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter State',
                    prefixIcon: const Icon(Icons.location_history),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.black12)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
            const DetailsLabel(label: 'Pin Code'),
            DecoratedBox(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Material(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Pin Code',
                    prefixIcon: const Icon(Icons.location_on),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.black12)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
            const DetailsLabel(label: 'Enter Recievers Available Time'),
            Row(children: [
              SizedBox(
                width: 100,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Material(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '12:00',
                        prefixIcon: const Icon(Icons.location_on),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            borderSide: BorderSide(color: Colors.black12)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(' - '),
              ),
              SizedBox(
                width: 100,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Material(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '24:00',
                        prefixIcon: const Icon(Icons.location_on),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            borderSide: BorderSide(color: Colors.black12)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
