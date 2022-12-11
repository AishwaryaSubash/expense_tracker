import 'package:flutter/material.dart';
import 'package:flutter_application_1/background.dart';
import 'package:flutter_application_1/bottomnavigation.dart';
import 'package:flutter_application_1/inputfields.dart';

class AddExpense extends StatelessWidget {
  const AddExpense({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xff1d2a31),
        ),
        title: const Text("Add Expenses"),
        centerTitle: true,
        backgroundColor: const Color(0xff1d2a30),
      ),
      bottomNavigationBar: const BottomNavigation(
        page: "Add",
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height * 0.7,
          child: Stack(
            children: [
              const Background(),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    width: size.width * 0.8,
                    height: size.height * 0.5,
                    child: const InputFields(),
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
