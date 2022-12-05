import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottomnavigation.dart';

class Stat extends StatelessWidget {
  const Stat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stat"),
      ),
      bottomNavigationBar: const BottomNavigation(
        page: "Stat",
      ),
    );
  }
}
