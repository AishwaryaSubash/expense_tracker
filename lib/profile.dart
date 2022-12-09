import 'package:flutter/material.dart';
import 'package:flutter_application_1/background.dart';
import 'package:flutter_application_1/bottomnavigation.dart';
import 'package:gap/gap.dart';

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
        backgroundColor: const Color(0xff1d2a31),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: const BottomNavigation(
        page: "Profile",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.35,
              child: Stack(
                children: [
                  const Background(),
                  Positioned.fill(
                    bottom: -size.height * 0.22,
                    child: Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundImage: const AssetImage(
                          "assets/images/karthi.png",
                        ),
                        radius: size.height * 0.06,
                      ),
                    ),
                  ),
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
              "@KayEe",
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
