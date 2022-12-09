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
          Gap(size.height * 0.1),
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
          Container(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: TextField(
                controller: dateInput,
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today), labelText: "Enter Date"),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                    setState(() {
                      dateInput.text = formattedDate;
                    });
                  } else {}
                },
              ),
            ),
          ),
          TextButton.icon(
            style: TextButton.styleFrom(
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
