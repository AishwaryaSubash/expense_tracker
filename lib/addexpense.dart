import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottomnavigation.dart';
import 'package:flutter_application_1/inputfields.dart';
import 'package:flutter_application_1/sendtofriend.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  bool isstate = false;
  bool ischange = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: null,
      bottomNavigationBar: const BottomNavigation(
        page: "Add",
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: size.height / 3,
            child: Container(
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(1.0, -1.0),
                  end: Alignment(-1.0, 1.0),
                  colors: [
                    Color(0xff1d2a30),
                    Color.fromARGB(255, 41, 76, 93),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: size.height / 1.4,
            child: Container(
              padding: const EdgeInsets.all(25),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ischange
                        ? Row(
                            children: const [Text(" ")],
                          )
                        : Row(
                            children: [
                              Text(
                                isstate ? 'Add Your Credit' : 'Add Your Debit',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              CupertinoSwitch(
                                value: isstate,
                                onChanged: (value) {
                                  setState(
                                    () {
                                      isstate = value;
                                    },
                                  );
                                },
                                trackColor: CupertinoColors.activeBlue,
                              ),
                            ],
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    ischange
                        ? const SendToFriend()
                        : InputFields(
                            isstate: isstate,
                          ),
                    const Text(
                      'More Options',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 70,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isstate = true;
                                ischange = false;
                              });
                            },
                            child: AspectRatio(
                              aspectRatio: 3.2 / 1,
                              child: Container(
                                padding: const EdgeInsets.all(13),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blueGrey,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 42,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff152238),
                                      ),
                                      child: const Icon(
                                        Icons.credit_card,
                                        color: Color(0xff9ed2d1),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          'Add Credit',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                ischange = true;
                              });
                            },
                            child: AspectRatio(
                              aspectRatio: 3.2 / 1,
                              child: Container(
                                padding: const EdgeInsets.all(13),
                                margin: const EdgeInsets.only(
                                  left: 20,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blueGrey,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 42,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff203354),
                                      ),
                                      child: const Icon(
                                        Icons.people,
                                        color: Color(0xffe6c797),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          'Send To a Friend',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          AspectRatio(
                            aspectRatio: 3.2 / 1,
                            child: Container(
                              padding: const EdgeInsets.all(13),
                              margin: const EdgeInsets.only(
                                left: 20,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blueGrey,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 42,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xff703770),
                                    ),
                                    child: const Icon(
                                      Icons.more,
                                      color: Color(0xff9ed2d1),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'More Options',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
