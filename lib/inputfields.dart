import 'dart:async';
import 'dart:convert';
import 'package:flutter/scheduler.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

getStringValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String? stringValue = prefs.getString('userId');
  return stringValue;
}

Future<dynamic> createAlbum(
    String description, int amount, bool isstate) async {
  String id = await getStringValuesSF();
  final response = await http.post(
    Uri.parse('https://expense-backend.vercel.app/expense/addExpense'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'userId': id,
      'amount': amount,
      'description': description,
      'debit': !isstate
    }),
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
  const InputFields({super.key, required this.isstate});
  final bool isstate;

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
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.9,
      child: Column(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: size.width * 0.8,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Description",
                          style: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.grey,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    TextField(
                      controller: _controller1,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff5562EB),
                      ),
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff5562EB),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: size.width * 0.8,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Amount",
                          style: TextStyle(
                            fontSize: 14,
                            color: isDarkMode ? Colors.white : Colors.grey,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    TextField(
                      controller: _controller2,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff5562EB),
                      ),
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff5562EB),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              AnimatedContainer(
                width: widget.isstate ? 180 : 200,
                duration: const Duration(milliseconds: 200),
                child: TextButton.icon(
                  // autofocus: true,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    backgroundColor: isDarkMode
                        ? const Color(0xff5562EB)
                        : const Color(0xff1d2a30),
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () async {
                    if (_controller1.text.isEmpty ||
                        _controller2.text.isEmpty) {
                      showDialog<String>(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Error'),
                          content: const Text("Fields cannot be null"),
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
                    } else if (int.tryParse(_controller2.text) == null) {
                      showDialog<String>(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Error'),
                          content: const Text("Amount cannot be string"),
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
                    } else if (int.parse(_controller2.text) <= 0) {
                      showDialog<String>(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Error'),
                          content: const Text("Amount cannot be negative"),
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
                      setState(
                        () {
                          isLoading = true;
                          int amt = int.parse(_controller2.text);

                          _futureAlbum = createAlbum(_controller1.text,
                              int.parse(_controller2.text), widget.isstate);
                        },
                      );
                    }
                    var result = await _futureAlbum;
                    print(result);

                    if (result["statusCode"] == 403) {
                      showDialog<String>(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Error'),
                          content: Text(
                            result["message"][0],
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
                    } else if (result["verified"] == false) {
                      showDialog<String>(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Error'),
                          content: Text(
                            result["message"][0],
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
                      // ignore: use_build_context_synchronously
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                          (Route route) => false);
                      fieldText.clear();
                    }
                  },
                  label: Text(
                    widget.isstate ? 'Add Credit' : 'Add Debit',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  icon: Icon(
                    widget.isstate ? Icons.add : Icons.currency_rupee,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
