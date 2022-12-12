import 'dart:async';
import 'dart:convert';
import 'package:flutter_application_1/homepage.dart';
import 'package:http/http.dart' as http;
import 'package:gap/gap.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

getStringValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String? stringValue = prefs.getString('userId');
  return stringValue;
}

Future<dynamic> createAlbum(String description, int amount) async {
  String id = await getStringValuesSF();
  final response = await http.post(
    Uri.parse('https://expense-backend.vercel.app/expense/addExpense'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
        {'userId': id, 'amount': amount, 'description': description}),
  );

  var result = jsonDecode(response.body);
  if (response.statusCode == 201) {
    return result;
  } else {
    result["statusCode"] = response.statusCode;
    return result;
  }
}

class InputFields extends StatefulWidget {
  const InputFields({super.key});

  @override
  State<InputFields> createState() => _InputFieldsState();
}

class _InputFieldsState extends State<InputFields> {
  TextEditingController dateInput = TextEditingController();
  final fieldText = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  bool isLoading = false;
  Future<dynamic>? _futureAlbum;

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
                TextField(
                  controller: _controller1,
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
                TextField(
                  controller: _controller2,
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
            onPressed: () async {
              setState(
                () {
                  isLoading = true;
                  int amt = int.parse(_controller2.text);
                  _futureAlbum = createAlbum(_controller1.text, amt);
                },
              );

              var result = await _futureAlbum;
              // print(id);
              print(result);
              if (result["statusCode"] == 400) {
                showDialog<String>(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Error'),
                    content: Text(
                      result["message"],
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          setState(
                            () {
                              isLoading = false;
                            },
                          );
                          Navigator.pop(context, 'OK');
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
                fieldText.clear();
              }
            },
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
