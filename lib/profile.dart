import 'package:flutter/material.dart';
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xff1d2a31),
        ),
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: const Color(0xff1d2a31),
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
                color: Color(0xff122945),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Modal(),
                    ),
                    ModalRoute.withName("/Login"),
                  );
                  removeValues();
                },
                child: const Icon(
                  Icons.logout_rounded,
                  color: Colors.white54,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigation(
        page: "Profile",
      ),
      body: (data != null)
          ? SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: size.height * 0.35,
                    child: Stack(
                      children: <Widget>[
                        const Background(),
                        Positioned.fill(
                          bottom: -size.height * 0.22,
                          child: Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                "https://avatars.dicebear.com/api/bottts/$uuid.png?scale=100",
                              ),
                              radius: size.height * 0.06,
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    data["username"],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Gap(6),
                  Text(
                    uuid,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const Gap(12),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        const ProfileListing(
                          icons: Icons.person_add,
                          text: "Invite Friends",
                        ),
                        const Gap(10),
                        Row(
                          children: const [
                            Expanded(
                              child: Divider(),
                            ),
                          ],
                        ),
                        const Gap(25),
                        const ProfileListing(
                          icons: Icons.person,
                          text: "Account info",
                        ),
                        const Gap(25),
                        const ProfileListing(
                          icons: Icons.people_alt_rounded,
                          text: "Personal profile",
                        ),
                        const Gap(25),
                        const ProfileListing(
                          icons: Icons.mail,
                          text: "Message center",
                        ),
                        const Gap(25),
                        const ProfileListing(
                          icons: Icons.security_rounded,
                          text: "Login and security",
                        ),
                        const Gap(25),
                        const ProfileListing(
                          icons: Icons.lock,
                          text: "Data and privacy",
                        ),
                        const Gap(25),
                      ],
                    ),
                  )
                ],
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
