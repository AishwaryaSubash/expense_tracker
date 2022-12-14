import 'package:flutter_application_1/homepage.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

addStringToSF(String id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('userId', id);
}

Future<dynamic> createAlbum(String username, String password) async {
  final response = await http.post(
    Uri.parse('https://expense-backend.vercel.app/user/signupUser'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
        <String, String>{'username': username, 'password': password}),
  );

  var result = jsonDecode(response.body);
  if (response.statusCode == 201) {
    return result;
  } else {
    result["statusCode"] = response.statusCode;
    return result;
  }
}

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isHidden = true;
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  Future<dynamic>? _futureAlbum;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        // // width: size.width,
        // height: size.height * 0.5,
        decoration: const BoxDecoration(
          color: Color(0xff1d2a31),
          borderRadius: BorderRadius.only(
            topLeft: Radius.elliptical(150, 20),
            topRight: Radius.elliptical(150, 20),
            // topRight: Radius.circular(50),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "SignUp",
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.person_rounded,
                      color: Colors.white,
                    ),
                    const Gap(20),
                    Expanded(
                      child: TextField(
                        controller: _controller1,
                        // style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: 'Username',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.key_outlined,
                      color: Colors.white,
                    ),
                    const Gap(20),
                    Expanded(
                      child: TextField(
                        controller: _controller2,
                        obscureText: _isHidden,
                        // style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          suffix: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(_isHidden
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  setState(
                    () {
                      isLoading = true;
                      _futureAlbum = createAlbum(
                          _controller1.text.trim(), _controller2.text);
                    },
                  );

                  // buildFutureBuilder();
                  var result = await _futureAlbum;
                  // print(result);

                  // print(result["verified"]);
                  if (result["verified"] == true) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                        (Route route) => false);
                    addStringToSF(
                      result["signupData"]["id"],
                    );
                  } else {
                    // print(result);
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
                  }
                },
                child: Container(
                  padding: const EdgeInsets.only(
                      bottom: 10, top: 10, left: 10, right: 10),
                  width: size.width * 0.2,
                  decoration: const BoxDecoration(
                    color: Color(0xFFe8f6fd),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: isLoading
                      ? const SpinKitFadingCircle(
                          size: 30,
                          color: Color(0xff1d2a31),
                        )
                      : const Text(
                          "SignUp",
                          textAlign: TextAlign.center,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
