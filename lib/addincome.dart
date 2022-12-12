import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:gap/gap.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class AddIncome extends StatefulWidget {
  const AddIncome({
    Key? key,
    required this.size,
    required this.uuid,
  }) : super(key: key);

  final Size size;
  final String uuid;
  @override
  State<AddIncome> createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> {
  final TextEditingController _controller1 = TextEditingController();
  bool isLoading = false;
  Future<dynamic> createAlbum(int amount) async {
    setState(() {
      isLoading = true;
    });
    if (widget.uuid != "default" && amount > 0) {
      final response = await http.post(
        Uri.parse('https://expense-backend.vercel.app/user/addIncome'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'userId': widget.uuid, 'income': amount}),
      );
      if (response.statusCode == 201) {
        setState(() {
          isLoading = false;
        });
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 16,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
        ),
        child: SizedBox(
          height: widget.size.height * 0.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: <Widget>[
                  const Icon(
                    Icons.currency_rupee_rounded,
                    color: Colors.black,
                  ),
                  const Gap(10),
                  Expanded(
                    child: TextField(
                      controller: _controller1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Enter Income',
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(20),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () async {
                    int? value = int.tryParse(_controller1.text);
                    if (value != null) {
                      if (await createAlbum(value)) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                          ModalRoute.withName("/"),
                        );
                      } else {
                        _controller1.clear();
                        setState(() {
                          isLoading = false;
                        });
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                height: widget.size.height * 0.2,
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Center(
                                      child: Text("Should not be empty"),
                                    ),
                                    const Gap(30),
                                    MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                            bottom: 10,
                                            top: 10,
                                            left: 10,
                                            right: 10,
                                          ),
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFe8f6fd),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          child: const Text(
                                            "Ok",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    } else {
                      _controller1.clear();
                      setState(() {
                        isLoading = false;
                      });
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              height: widget.size.height * 0.2,
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Center(
                                    child: Text("Enter Valid Income"),
                                  ),
                                  const Gap(30),
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                          bottom: 10,
                                          top: 10,
                                          left: 10,
                                          right: 10,
                                        ),
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFe8f6fd),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        child: const Text(
                                          "Ok",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                      bottom: 10,
                      top: 10,
                      left: 10,
                      right: 10,
                    ),
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
                            "Add",
                            textAlign: TextAlign.center,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
