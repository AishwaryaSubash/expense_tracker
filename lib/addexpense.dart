import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_application_1/bottomnavigation.dart';
import 'package:flutter_application_1/inputfields.dart';
import 'package:flutter_application_1/sendtofriend.dart';
import 'package:gap/gap.dart';

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
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: null,
      bottomNavigationBar: BottomNavigation(
        page: "Add",
        dark: isDarkMode,
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
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(1.0, -1.0),
                  end: const Alignment(-1.0, 1.0),
                  colors: isDarkMode
                      ? [const Color(0xFF252733), const Color(0xFF252733)]
                      : [
                          const Color(0xff1d2a30),
                          const Color.fromARGB(255, 41, 76, 93),
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
              decoration: BoxDecoration(
                color: isDarkMode ? const Color(0xFF1E1F28) : Colors.white,
                borderRadius: const BorderRadius.only(
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
                            children: [
                              Text(
                                "Send to friend",
                                style: TextStyle(
                                  color: isDarkMode
                                      ? const Color(0xff5562EB)
                                      : Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Text(
                                isstate ? 'Add Your Credit' : 'Add Your Debit',
                                style: TextStyle(
                                  color: isDarkMode
                                      ? const Color(0xff5562EB)
                                      : Colors.black,
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
                        ? Column(
                            children: const [
                              Gap(10),
                              SendToFriend(),
                            ],
                          )
                        : InputFields(
                            isstate: isstate,
                          ),
                    Text(
                      'More Options',
                      style: TextStyle(
                        color:
                            isDarkMode ? const Color(0xff5562EB) : Colors.grey,
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
                                        color: isDarkMode
                                            ? const Color(0xff5562EB)
                                            : const Color(0xff152238),
                                      ),
                                      child: Icon(
                                        Icons.credit_card,
                                        color: isDarkMode
                                            ? Colors.white
                                            : const Color(0xff9ed2d1),
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
                                      children: [
                                        Text(
                                          'Add Credit',
                                          style: TextStyle(
                                            color: isDarkMode
                                                ? Colors.white
                                                : Colors.grey,
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
                              aspectRatio: 3.5 / 1,
                              child: Container(
                                padding: const EdgeInsets.all(13),
                                margin: const EdgeInsets.only(
                                  left: 26,
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
                                        color: isDarkMode
                                            ? const Color(0xff5562EB)
                                            : const Color(0xff203354),
                                      ),
                                      child: Icon(
                                        Icons.people,
                                        color: isDarkMode
                                            ? Colors.white
                                            : const Color(0xffe6c797),
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
                                      children: [
                                        Text(
                                          'Send To a Friend',
                                          style: TextStyle(
                                            color: isDarkMode
                                                ? Colors.white
                                                : Colors.grey,
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
                                      color: isDarkMode
                                          ? const Color(0xff5562EB)
                                          : const Color(0xff703770),
                                    ),
                                    child: Icon(
                                      Icons.more,
                                      color: isDarkMode
                                          ? Colors.white
                                          : const Color(0xff9ed2d1),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'More Options',
                                        style: TextStyle(
                                          color: isDarkMode
                                              ? Colors.white
                                              : Colors.grey,
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
