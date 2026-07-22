import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: 100, height: 100, color: Colors.red),
            SizedBox(width: 20),
            Container(width: 100, height: 200, color: Colors.blue),
            SizedBox(width: 20),
            Container(width: 100, height: 300, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
