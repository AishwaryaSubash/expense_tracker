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
          Gap(30),
          Container(
            width: size.width * 0.6,
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      "Description",
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          Gap(15),
          Container(
            width: size.width * 0.6,
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      "Amount",
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          Gap(15),
          TextButton.icon(
            // autofocus: true,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(20),
              backgroundColor: const Color(0xff1d2a30),
              foregroundColor: Colors.grey,
            ),
            // style: ButtonStyle(
            //   foregroundColor: MaterialStateProperty.all<Color>(Colors.grey),
            // ),
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
        ],
      ),
    );
  }
}
