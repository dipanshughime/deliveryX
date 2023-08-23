import 'package:flutter/material.dart';

class DetailsLabel extends StatelessWidget {
  final String label;
  const DetailsLabel({
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 7, 0, 2),
        child: Text('$label :',
            textAlign: TextAlign.left, style: TextStyle(fontSize: 15)),
      ),
    );
  }
}
