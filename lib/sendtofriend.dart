import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SendToFriend extends StatefulWidget {
  const SendToFriend({super.key});

  @override
  State<SendToFriend> createState() => _SendToFriendState();
}

class _SendToFriendState extends State<SendToFriend> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              "Enter friend's name",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          const TextField(
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 20),
            child: Text(
              "Description",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          const TextField(
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 20),
            child: Text(
              "Enter Amount",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          const TextField(
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const Gap(20),
          Center(
            child: TextButton.icon(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(20),
                backgroundColor: const Color(0xff1d2a30),
                foregroundColor: Colors.black,
              ),
              label: const Text(
                'Send',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              icon: const Icon(
                Icons.send_rounded,
                color: Colors.white,
              ),
            ),
          ),
          const Gap(20)
        ],
      ),
    );
  }
}
