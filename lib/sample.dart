import 'package:flutter/material.dart';
import 'package:flutter_application_1/cards.dart';

class Sample extends StatelessWidget {
  const Sample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Sunday",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Text(
                "20 November",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ],
          ),
        ),
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: const SingleChildScrollView(
        child: Cards(),
      ),
    );
  }
}
