import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_application_1/addincome.dart';
import 'package:flutter_application_1/background.dart';
import 'package:flutter_application_1/bottomnavigation.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_application_1/modal.dart';
import 'package:flutter_application_1/profilelisting.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

removeValues() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Remove String
  prefs.remove("userId");
}

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String uuid = "default";
  dynamic data = null;

  Future<dynamic> fetchAlbum() async {
    final response = await http.get(
      Uri.parse("https://expense-backend.vercel.app/user/$uuid"),
    );
    if (response.statusCode == 200) {
      setState(() {
        data = jsonDecode(response.body);
      });

      //print(data["username"]);
    } else {
      throw Exception('Failed to load statistics');
    }
  }

  @override
  void initState() {
    super.initState();

    getStringValuesSF();
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString('userId');
    if (stringValue != null) {
      setState(() {
        uuid = stringValue;
      });
      fetchAlbum();
    }
  }

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: isDarkMode ? const Color(0xFF1E1F28) : Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xff1d2a31),
        ),
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor:
            isDarkMode ? const Color(0xFF2A2C36) : const Color(0xff1d2a31),
        automaticallyImplyLeading: false,
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
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    showDialog<String>(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Alert'),
                        content: const Text("Do you want to logout?"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              removeValues();

                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Modal(),
                                ),
                                ModalRoute.withName("/Login"),
                              );

                              // Navigator.pop(context, 'OK');
                            },
                            child: const Text('Yes'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, 'Cancel');
                            },
                            child: const Text('No'),
                          ),
                        ],
                      ),
                    );
                    // Navigator.pushAndRemoveUntil(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const Modal(),
                    //   ),
                    //   ModalRoute.withName("/Login"),
                    // );
                  },
                  child: const Icon(
                    Icons.logout_rounded,
                    color: Color(0xff122945),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        page: "Profile",
        dark: isDarkMode,
      ),
      body: (data != null)
          ? SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                    color: isDarkMode ? const Color(0xFF1E1F28) : Colors.white),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.27,
                      child: Stack(
                        children: <Widget>[
                          const Background(),
                          Positioned.fill(
                            bottom: -size.height * 0.09,
                            child: Align(
                              alignment: Alignment.center,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  "https://avatars.dicebear.com/api/bottts/$uuid.png?scale=100",
                                ),
                                radius: size.height * 0.08,
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      data["username"],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    const Gap(6),
                    Text(
                      uuid,
                      style: TextStyle(
                        fontSize: 14,
                        color:
                            isDarkMode ? const Color(0xff5562EB) : Colors.black,
                      ),
                    ),
                    const Gap(12),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          const Gap(8),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AddIncome(
                                      size: size,
                                      uuid: uuid,
                                    );
                                  },
                                );
                              },
                              child: ProfileListing(
                                icons: Icons.currency_rupee_rounded,
                                text: "Add Income",
                                dark: isDarkMode,
                              ),
                            ),
                          ),
                          const Gap(10),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: isDarkMode
                                      ? const Color(0xFF5562EB)
                                      : const Color(0x551E1F28),
                                ),
                              ),
                            ],
                          ),
                          const Gap(25),
                          ProfileListing(
                            icons: Icons.person_add,
                            text: "Invite Friends",
                            dark: isDarkMode,
                          ),
                          const Gap(25),
                          ProfileListing(
                            icons: Icons.person,
                            text: "Account info",
                            dark: isDarkMode,
                          ),
                          const Gap(25),
                          ProfileListing(
                            icons: Icons.mail,
                            text: "Message center",
                            dark: isDarkMode,
                          ),
                          const Gap(25),
                          ProfileListing(
                            icons: Icons.security_rounded,
                            text: "Login and security",
                            dark: isDarkMode,
                          ),
                          const Gap(25),
                          ProfileListing(
                            icons: Icons.lock,
                            text: "Data and privacy",
                            dark: isDarkMode,
                          ),
                          const Gap(25),
                        ],
                      ),
                    )
                  ],
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
