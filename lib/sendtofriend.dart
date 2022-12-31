import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'homepage.dart';

getStringValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String? stringValue = prefs.getString('userId');
  return stringValue;
}

Future<dynamic> createAlbum(String name, String description, int amount) async {
  String id = await getStringValuesSF();
  final response = await http.post(
    Uri.parse('https://expense-backend.vercel.app/expense/sendTo'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'userId': id,
      'amount': amount,
      'description': description,
      'recipientUn': name
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

class SendToFriend extends StatefulWidget {
  const SendToFriend({super.key});

  @override
  State<SendToFriend> createState() => _SendToFriendState();
}

class _SendToFriendState extends State<SendToFriend> {
  TextEditingController dateInput = TextEditingController();
  final fieldText = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "Enter friend's name",
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.grey,
                fontSize: 18,
              ),
              textAlign: TextAlign.start,
            ),
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
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 20),
            child: Text(
              "Description",
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.grey,
                fontSize: 18,
              ),
              textAlign: TextAlign.start,
            ),
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
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 20),
            child: Text(
              "Enter Amount",
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.grey,
                fontSize: 18,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          TextField(
            controller: _controller3,
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
          const Gap(20),
          Center(
            child: TextButton.icon(
              onPressed: () async {
                if (_controller1.text.isEmpty ||
                    _controller2.text.isEmpty ||
                    _controller3.text.isEmpty) {
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
                } else if (int.tryParse(_controller3.text) == null) {
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
                } else {
                  setState(
                    () {
                      isLoading = true;
                      _futureAlbum = createAlbum(
                        _controller1.text.trim(),
                        _controller2.text,
                        int.parse(_controller3.text),
                      );
                    },
                  );
                }
                var result = await _futureAlbum;
                // print(result);
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
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(20),
                backgroundColor: isDarkMode
                    ? const Color(0xff5562EB)
                    : const Color(0xff1d2a30),
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
