import 'dart:convert';
import 'package:flutter/scheduler.dart';
import 'package:flutter_application_1/monthly.dart';
import 'package:flutter_application_1/weekly.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottomnavigation.dart';
import 'package:flutter_application_1/chart.dart';
import 'package:flutter_application_1/listcard.dart';
import 'package:flutter_application_1/toggleswitching.dart';
import 'package:gap/gap.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

getStringValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String? stringValue = prefs.getString('userId');
  return stringValue;
}

class Stat extends StatefulWidget {
  const Stat({super.key});

  @override
  State<Stat> createState() => _StatState();
}

class _StatState extends State<Stat> {
  dynamic stat = null;
  dynamic data = null;
  String avg = "";
  List<ChartData> chartData = <ChartData>[
    ChartData(
      x: 'Mon',
      y: 0,
    ),
    ChartData(
      x: 'Tue',
      y: 0,
    ),
    ChartData(
      x: 'Wed',
      y: 0,
    ),
    ChartData(
      x: 'Thu',
      y: 0,
    ),
    ChartData(
      x: 'Fri',
      y: 0,
    ),
    ChartData(
      x: 'Sat',
      y: 0,
    ),
    ChartData(
      x: 'Sun',
      y: 0,
    ),
  ];
  String res = "";
  Future<dynamic> fetchAlbum() async {
    res = await getStringValuesSF();
    final response = await http.get(
      Uri.parse("https://expense-backend.vercel.app/stats/$res"),
    );
    final expense = await http.get(
      Uri.parse("https://expense-backend.vercel.app/user/$res"),
    );
    if (response.statusCode == 200 && expense.statusCode == 200) {
      setState(() {
        stat = jsonDecode(response.body);
        chartData = <ChartData>[
          ChartData(
            x: 'Mon',
            y: stat[0]["quota"][1],
          ),
          ChartData(
            x: 'Tue',
            y: stat[0]["quota"][2],
          ),
          ChartData(
            x: 'Wed',
            y: stat[0]["quota"][3],
          ),
          ChartData(
            x: 'Thu',
            y: stat[0]["quota"][4],
          ),
          ChartData(
            x: 'Fri',
            y: stat[0]["quota"][5],
          ),
          ChartData(
            x: 'Sat',
            y: stat[0]["quota"][6],
          ),
          ChartData(
            x: 'Sun',
            y: stat[0]["quota"][0],
          ),
        ];
        String format = formatter!.format(
            ((stat[0]["quota"].reduce((a, b) => a + b)) /
                stat[0]["quota"].length));
        avg = (format.length > 3)
            ? format
            : "${((stat[0]["quota"].reduce((a, b) => a + b)) / stat[0]["quota"].length).toStringAsFixed(2)}";

        data = jsonDecode(expense.body);
      });
    } else {
      throw Exception('Failed to load statistics');
    }
  }

  NumberFormat? formatter;
  @override
  void initState() {
    super.initState();
    initializeDateFormatting("in");
    formatter = NumberFormat('#,##,000');
    fetchAlbum();
  }

  void refreshPull() async {
    chartData = <ChartData>[
      ChartData(
        x: 'Mon',
        y: 0,
      ),
      ChartData(
        x: 'Tue',
        y: 0,
      ),
      ChartData(
        x: 'Wed',
        y: 0,
      ),
      ChartData(
        x: 'Thu',
        y: 0,
      ),
      ChartData(
        x: 'Fri',
        y: 0,
      ),
      ChartData(
        x: 'Sat',
        y: 0,
      ),
      ChartData(
        x: 'Sun',
        y: 0,
      ),
    ];

    await fetchAlbum();
  }

  int show = 0;
  void setShow(int value) {
    setState(() {
      show = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xff1d2a31),
        ),
        centerTitle: true,
        title: const Text(
          "Statistics",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(
        page: "Stat",
      ),
      body: (data != null)
          ? RefreshIndicator(
              onRefresh: () {
                return Future.delayed(const Duration(seconds: 1), () {
                  setState(
                    () {
                      refreshPull();
                    },
                  );
                });
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Expenses Average",
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.grey,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        "₹$avg",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode
                              ? const Color(0xff5562EB)
                              : Colors.black,
                        ),
                      ),
                      const Gap(20),
                      Chart(
                        chartData: chartData,
                        stat: stat,
                      ),
                      const Gap(25),
                      Toggler(
                        setShow: setShow,
                      ),
                      const Gap(20),
                      (show == 0) ?  WeeklyChat(userId:res) : const MonthlyChart(),
                      const Gap(20),
                      Text(
                        "Expenses",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode
                              ? const Color(0xff5562EB)
                              : Colors.black,
                        ),
                      ),
                      const Gap(20),
                      ...List.from(
                        data["expense"]
                            .map(
                              (i) => Column(
                                children: [
                                  ListCard(
                                    image: i["id"],
                                    name: i["description"],
                                    price: (i["amount"].toString().length > 3)
                                        ? "-₹${formatter?.format(i["amount"])}"
                                        : "-₹${i["amount"]}",
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
                                  const Gap(10),
                                ],
                              ),
                            )
                            .toList()
                            .reversed,
                      ),
                      const Gap(10),
                    ],
                  ),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: SpinKitCircle(
                size: 100,
                color: isDarkMode
                    ? const Color(0xff5562EB)
                    : const Color(0xff1d2a31),
              ),
            ),
    );
  }
}
