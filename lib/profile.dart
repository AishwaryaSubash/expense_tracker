import 'package:flutter/material.dart';
import 'package:flutter_application_1/background.dart';
import 'package:flutter_application_1/bottomnavigation.dart';
import 'package:gap/gap.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xff1d2a31),
        ),
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: const BottomNavigation(
        page: "Profile",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: Stack(
                children: const [
                  Background(),
                  Positioned.fill(
                    bottom: -260,
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
            const Text(
              "Karthikeyan",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Gap(6),
            const Text(
              "@karthikeyan",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            Column(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
