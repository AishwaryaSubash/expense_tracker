import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';

import 'package:flutter_application_1/signup.dart';
import 'package:gap/gap.dart';

class Modal extends StatefulWidget {
  const Modal({super.key});

  @override
  State<Modal> createState() => _ModalState();
}

class _ModalState extends State<Modal> {
  double x = 0.0;
  double y = 0.0;
  void _updateLocation(PointerEvent details) {
    setState(() {
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: MouseRegion(
            onHover: _updateLocation,
            child: SizedBox(
              height: size.height * 0.92,
              child: Stack(
                children: [
                  Positioned(
                    width: x,
                    height: y,
                    child: const Icon(
                      Icons.circle,
                      size: 40,
                      color: Colors.transparent,
                      shadows: [
                        Shadow(
                          color: Color(0xffeae9fe),
                          offset: Offset(1, 1),
                          blurRadius: 1.0,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: y,
                    left: x,
                    bottom: x,
                    right: y,
                    child: const Icon(
                      Icons.circle,
                      size: 40,
                      color: Colors.transparent,
                      shadows: [
                        Shadow(
                          color: Color(0xffeae9fe),
                          offset: Offset(1, 1),
                          blurRadius: 1.0,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Gap(30),
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xffeae9fe),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Color(0xffeae9fe),
                                offset: Offset(100, 100),
                                blurRadius: 1000.0,
                                spreadRadius: 200.0,
                              ),
                              BoxShadow(
                                color: Color(0xffeae9fe),
                                offset: Offset(-100, 100),
                                blurRadius: 100.0,
                                spreadRadius: 100.0,
                              ),
                              BoxShadow(
                                color: Color(0xffeae9fe),
                                offset: Offset(100, -100),
                                blurRadius: 100.0,
                                spreadRadius: 100.0,
                              ),
                              BoxShadow(
                                color: Color(0xffeae9fe),
                                offset: Offset(-10, -10),
                                blurRadius: 100.0,
                                spreadRadius: 100.0,
                              ),
                            ],
                            shape: BoxShape.circle,
                          ),
                          // foregroundDecoration: const BoxDecoration(
                          //   backgroundBlendMode: BlendMode.colorBurn,
                          //   color: Color(0xffeae9fe),
                          // ),
                          child: Image.asset(
                            "assets/images/rupee1.png",
                            width: 150,
                            height: 150,
                            colorBlendMode: BlendMode.colorBurn,
                            color: const Color(0xffeae9fe),
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                        const Gap(70),
                        Flex(
                          direction: (size.width < size.height)
                              ? Axis.vertical
                              : Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (BuildContext context) {
                                    return Wrap(
                                      children: const [
                                        Login(),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                width: 200,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  color: Color(0xff1d2a31),
                                ),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            const Gap(20),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (BuildContext context) {
                                    return Wrap(
                                      children: const [
                                        SignUp(),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                width: 200,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  color: Color(0xff1d2a31),
                                ),
                                child: const Text(
                                  "SignUp",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
