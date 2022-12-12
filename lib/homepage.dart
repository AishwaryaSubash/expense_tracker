import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottomnavigation.dart';
import 'package:flutter_application_1/cards.dart';
import 'package:flutter_application_1/listcard.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

getStringValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String? stringValue = prefs.getString('userId');
  return stringValue;
}

class _HomePageState extends State<HomePage> {
  dynamic data = null;
  String uuid = "";
  Future<dynamic> fetchAlbum() async {
    dynamic res = await getStringValuesSF();
    final response = await http.get(
      Uri.parse("https://expense-backend.vercel.app/user/$res"),
    );
    if (response.statusCode == 200) {
      setState(() {
        data = jsonDecode(response.body);
        uuid = res;
      });

      //print(data["username"]);
    } else {
      throw Exception('Failed to load statistics');
    }
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting("in");

    fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(
            left: 5.0,
            bottom: 5.0,
            top: 5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${DateFormat.EEEE().format(DateTime.now().toLocal())},",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              Text(
                DateFormat.yMMMMd().format(DateTime.now().toLocal()),
                style: const TextStyle(
                  color: Color(0xFF041a0e),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 12.0,
              top: 5,
              bottom: 5,
            ),
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Icon(
                Icons.notifications_none_outlined,
                color: Color(0xFF979797),
              ),
            ),
          ),
        ],
        backgroundColor: const Color(0xFFf6f6f6),
      ),
      bottomNavigationBar: const BottomNavigation(
        page: "Home",
      ),
      body: (data != null)
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 18, 30, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Cards(
                      uuid: uuid,
                      username: data["username"],
                      income: data["income"],
                    ),
                    const Gap(30),
                    const Text(
                      "Today's Transactions",
                      style: TextStyle(
                        color: Color(0xFF041a0e),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const Gap(25),
                    ...data["expense"]
                        .map(
                          (i) => ListCard(
                            image: i["description"],
                            name: i["description"],
                            price: "-₹${i["amount"]}",
                            time: DateFormat.jm().format(
                              DateTime.parse(
                                i["date"],
                              ).toLocal(),
                            ),
                            color: 0xffebf9ff,
                            date: DateFormat.E().format(
                              DateTime.parse(
                                i["date"],
                              ).toLocal(),
                            ),
                          ),
                        )
                        .toList(),
                    const Gap(5),
                  ],
                ),
              ),
            )
          : const Padding(
              padding: EdgeInsets.all(20.0),
              child: SpinKitCircle(
                size: 100,
                color: Color(0xff1d2a31),
              ),
            ),
    );
  }
}
