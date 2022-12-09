import 'package:flutter/material.dart';
import 'package:flutter_application_1/background.dart';
import 'package:flutter_application_1/bottomnavigation.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
        backgroundColor: const Color(0xff1d2a30),
      ),
      bottomNavigationBar: const BottomNavigation(
        page: "Profile",
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 340,
          child: Stack(
            children: const [
              Background(),
              Positioned.fill(
                bottom: -220,
                child: Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/karthi.png",
                    ),
                    radius: 50,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
