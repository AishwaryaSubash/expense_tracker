import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:gap/gap.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        width: size.width,
        decoration: const BoxDecoration(
          color: Color(0xff1d2a31),
          borderRadius: BorderRadius.only(
            topLeft: Radius.elliptical(150, 20),
            topRight: Radius.elliptical(150, 20),
            // topRight: Radius.circular(50),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "SignUp",
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.person_rounded,
                      color: Colors.white,
                    ),
                    const Gap(20),
                    Expanded(
                      child: TextField(
                        // style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: 'Username',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.key_outlined,
                      color: Colors.white,
                    ),
                    const Gap(20),
                    Expanded(
                      child: TextField(
                        // style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                    ModalRoute.withName("/"),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: size.width * 0.2,
                  decoration: const BoxDecoration(
                    color: Color(0xFFe8f6fd),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "SignUp",
                    textAlign: TextAlign.center,
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
