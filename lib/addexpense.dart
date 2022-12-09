import 'package:flutter/material.dart';
import 'package:flutter_application_1/background.dart';
import 'package:flutter_application_1/bottomnavigation.dart';

class AddExpense extends StatelessWidget {
  const AddExpense({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: const [
            Background(),
          ],
        ),
      ),
    );
  }
}
