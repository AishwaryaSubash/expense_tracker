import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class InputFields extends StatelessWidget {
  const InputFields({super.key});

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
                  children: [
                    Text(
                      "Description",
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: size.height * 0.3,
            width: size.width * 0.6,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Amount",
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.all(15),
              height: MediaQuery.of(context).size.width / 3,
              child: Center(
                  child: TextField(
                //editing controller of this TextField
                decoration: InputDecoration(
                    icon: Icon(Icons.calendar_today), //icon of text field
                    labelText: "Enter Date" //label text of field
                    ),
                readOnly: true,
                //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    // setState(() {
                    //   dateInput.text =
                    //       formattedDate; //set output date to TextField value.
                    // });
                  } else {}
                },
              )))
        ],
      ),
    );
  }
}
