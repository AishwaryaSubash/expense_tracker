import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class InputFields extends StatefulWidget {
  const InputFields({super.key});

  @override
  State<InputFields> createState() => _InputFieldsState();
}

class _InputFieldsState extends State<InputFields> {
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          const Gap(20),
          const Text(
            "Add Your Expenses",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Gap(20),
          Container(
            width: size.width * 0.6,
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      "Description",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                const TextField(
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Gap(10),
          Container(
            width: size.width * 0.6,
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      "Amount",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                const TextField(
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Gap(20),
          TextButton.icon(
            // autofocus: true,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(20),
              backgroundColor: const Color(0xff1d2a30),
              foregroundColor: Colors.white,
            ),
            onPressed: () {},
            label: const Text(
              'Add Expense',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            icon: const Icon(
              Icons.add,
            ),
          ),
          const Gap(50),
        ],
      ),
    );
  }
}
